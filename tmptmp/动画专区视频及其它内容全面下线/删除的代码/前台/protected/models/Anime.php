<?php
/**
* 
*/
class Anime extends Model
{	
    //特殊标签过滤
    private $tagFilterArr = array('家族','美少女','吐槽','校园','魔法','妹控','机战','高达','悬疑','友情','擦边球','重口','战斗','异世界');

    //动漫类型/版本转换
    private $animeMapArr = array(
            '1' => '热血',
            '2' => '爆笑',
            '3' => '纯爱',
            '4' => '福利',
            '5' => '后宫',
            '6' => '百合',
            '7' => '萝莉',
            '8' => '猎奇',
            '9' => '科幻',
            '10' => '奇幻',
            '11' => '治愈',
            '12' => '致郁',
            '13' => '催泪',
            '14' => '卖萌',
            '15' => '日常',
            '16' => '神作',
            '17' => '轻小说改',
            '18' => 'gal改',
            '19' => '二次元衍生',
            '20' => 'TV',
            '21' => '剧场版',
            '22' => 'OVA/OAD',
            '23' => 'MMD',
            '24' => 'MAD',
            '25' => '吐槽盘点',
        );

    //数字转换为标签
    public function getMapData($data,$num=''){
        if ( is_numeric($data) ) {
            return  $this->animeMapArr[$data];
        }else{
            if (!empty($num)) {
                $tem = array_flip($this->animeMapArr);
                return $tem[$data];
            }else{
                return $data;
            }
        }
    }

   //获取标签地址
    public function getTagUrl($tags){
        if (empty($tags))  return array();

        foreach ((array)$tags as $key => $val) {
            $id= obj('Anime')->getMapData($val,'num');
            if ( (int)$id > 19 ) {
                $tagUrl = "http://video.duowan.com/anime/ver_".$id.".html" ;
            }else{
                $tagUrl = "http://video.duowan.com/anime/type_".$id.".html" ;
            }
            $data[$val] = $tagUrl;
        }

        return $data;
    }
    //获取剧集标签获取相关动漫剧集
    public function getAnimeTagData( $tags ,$limit=4 ){
        $cache = obj('Cache')->getAnimeByTag($tags ,$limit);
        if( $cache ) return $cache;

        if (empty($tags)) return array();

        if (is_array($tags)) {
            $type = $tags;
        }else{
            $type = array_filter(explode(",",$tags));
        }
 
        $check = $this->tagFilterArr;
    
        foreach ( $type as $k => $v ) {
            if ( !in_array($v, $check) ) {
                $sql = "SELECT  DISTINCT filter_id FROM v_filter_ext_data WHERE LOCATE('".$v."',string_value) LIMIT {$limit}";
                if($tmp = obj("Filter")->query($sql)){
                    $res[$v] = $tmp;
                }
            }else{
                unset($type[$k]);
            }
        }

        if (!empty($res)) {
            $result = array();
            foreach ($res as $k => $v) {
                $fids = array();
                foreach ($v as $key => $val) {
                    $fids[] = $val['filter_id'];
                } 
                $result[$k] =  $this->getAnime($fids,'','',4)['list'];
            }
        }

        obj('Cache')->setAnimeByTag($tags ,$limit, $result);
        return $result;
    }

    //获取动漫剧集视频列表，参数为动漫剧集名称
    public function getAnimePage( $filter_name,$anime_name,$page, $limit = 20 ){
        $cache = obj('Cache')->getAnimePage( $filter_name,$anime_name,$page, $limit);
        if( $cache ) return $cache;
        if ( empty($page) ) return array();
        //获取所有视频
        $data = $this->getAnimeVideo( $filter_name );
        if (empty($data)) return array();
        //标题处理
        foreach ( $data as $k => $v) {
            $data[$k]['video_title'] = str_replace(array($anime_name,'[',']'),array('','',''),trim($v['video_title']));
        }
        //分页
        $total = count($data);   
        $res['pages'] = $this->pager( $page, $limit, 20, $total );
        $res['videos'] = array_slice( $data, ($page-1)*$limit, $limit );
        obj('Cache')->setAnimePage( $filter_name,$anime_name,$page, $limit, $res);
        return $res;
    }
    
    //根据剧集名获取所有视频并且按标题数字升序
    public function getAnimeVideo($tag, $page='' , $limit=20){
        $cache = obj('Cache')->getAnimeVideo($tag, $page , $limit);
        if( $cache ) return $cache;

        //暂时不做限制
        if (empty($tag)) return array();
        if (!empty($page)) {
            $star = ($page - 1) * $limit;
            $sqlLimit =  " limit {$star},{$limit}";
        }
    
        $list = $this->getAnimeArticleInfo($tag);
        if (!empty($list)) {
            foreach ($list as $key => $val) {
                $vids[] = trim($val['vids'],',');
            }
            $data = obj('VideoInfo')->getList($vids);
            //排序处理
            $videoList = $this->sortByTitle( $data );
         
        }
        
        obj('Cache')->setAnimeVideo( $tag, $page , $limit,$videoList );
        return empty($videoList) ? array() : $videoList;
    }
    
    //按标题升序视频
    public function sortByTitle($videos){
        if (empty($videos)) return array();
        foreach ($videos as $key => $val) {
            preg_match("/\[第(.*?)话\]/", $val['video_title'],$match);
            $title[$val['vid']] = $match[1];
        }
        asort($title); 
        foreach ($title as $key => $val) {
           foreach ($videos as $k => $v) {
               if ($v['vid'] == $key) {
                   $sort[] = $v;
               }
           }
        }
        return $sort;
    }

    //根据剧集名称去文章列表获取动漫剧集vid和周播放量
    public function  getAnimeArticleInfo($tag){
        $cache = obj('Cache')->getAnimeArticleInfo($tag);
        if( $cache ) return $cache;
        if (empty($tag)) return array();
        $sql = "SELECT vids,video_week_sum,publish_time FROM v_cms_article WHERE diy1 = :tag
                    AND channel = 'vhuyadm' AND vids !='' ORDER BY publish_time DESC {$sqlLimit}";
        $list = obj('Filter')->query($sql, array('tag'=>$tag));
        foreach ($list as $key => $val) {
            $list[$key]['vids'] = trim($val['vids'],','); 
        }
        obj('Cache')->setAnimeArticleInfo($tag ,$list);
        return empty( $list ) ? array() : $list; 
    }


   
    public function getAnimeList( $tags, $order='new', $page, $limit=36){
        $cache = obj('Cache')->getAnimeList($tags, $order, $page, $limit);
        if( $cache ) return $cache;
        $sql = "SELECT  DISTINCT filter_id FROM v_filter_ext_data WHERE  ";
        //过滤筛选条件
        if (!empty($tags)) {
            foreach ($tags as $k => $v) {
                if ( $v == '全部' || empty($v) ) {
                    unset($tags[$k]);
                }
            }
        }
    
        if (empty($tags)) {
            $res['all'] = obj("Filter")->query( $sql." field_name Like 'anime_%' ");
        }else{
            foreach ($tags as $k => $v) {
                if ( $k == 'anime_type') {
                    $sqlTail = $sql."field_name = '".$k."' AND  LOCATE( :val ,string_value) ";
                }else{
                    $sqlTail = $sql." field_name = '".$k."' AND string_value = :val";
                }
                if ( $tmp =  obj("Filter")->query( $sqlTail,array(':val' => $v) ) ) {
                   $res[$v] = $tmp;
                }
                $sqlTail = '';
            }
        }

        foreach ((array)$res as $key => $val) {
            foreach ($val as $k => $v) {
                $data[$key][] = $v['filter_id']; 
            }
        }
      
        $tagnum = count( $tags );
        $data = array_values((array)$data);
        if ( $tagnum > 2) {
            $result = array_intersect((array)$data[0],(array)$data[1],(array)$data[2]);
        }elseif ( $tagnum > 1 ) {
            $result = array_intersect((array)$data[0],(array)$data[1]);
        }else{
            $result =$data[0];
        }
        
        $list = $this->getAnime($result,$order,$page,$limit);
        $newlist['list'] = $list['list'];
        $newlist['pages'] = $list['pages'];
        obj('Cache')->setAnimeList($tags, $order, $page, $limit,$newlist );
        return $newlist;
    }


    //获取动漫剧集信息，支持单个或者多个filter_id查询，多个带分页
    public function getAnime( $filter_ids, $order='', $page='', $limit=4 ){
        //这里先分页在去拼接扩展数据
        $cache = obj('Cache')->getAnime($filter_ids, $order, $page, $limit, $need);
        if( $cache ) return $cache;

        if ( is_array($filter_ids) ) {
            $fids = implode(',',$filter_ids);
        }else{
            $fids =  trim( $filter_ids , ',');
        } 

        $animeList = array();
        if ( !empty($fids) ) {
            $page = max($page, 1);
            $start = ($page-1) * $limit;
            $sql = "SELECT * FROM v_filter WHERE filter_id in (".$fids." ) AND channel='vhuyadm' AND filter_type_id = 7 LIMIT {$start},{$limit} ";
            $animeList = obj('Filter')->query( $sql );
            //排序默认最新
            $animeList = $this->getAnimeSort($animeList, $order);
            //获取扩展信息
            foreach ((array)$animeList as $key => $val) {
                $filterExtData = obj('FilterExtData')->getData( $val['filter_id'], 7 );
                $animeList[$key] = array_merge((array)$val,  (array)$filterExtData);
            }
        }

        if ( !empty($fids) ) {
            $total = obj('Filter')->query("SELECT COUNT(*) as DW_COUNT FROM v_filter WHERE filter_id in (".$fids." ) AND channel='vhuyadm' " );
            $pageInfo = $this->pager( $page, $limit, 10, $total[0]['DW_COUNT'] );
        }
        $res = array('list' => $animeList, 'pages' => $pageInfo );
        obj('Cache')->setAnime($filter_ids, $order, $page, $limit, $need,$res);
        return $res;
    }

    public function getAnimeSort( $data, $order='new' ){
        //$cache = obj('Cache')->getAnimeSort($data, $order);
        if( $cache ) return $cache;
        if (!empty($data)) {
            foreach ($data as $k => $v) {
            if (!empty($v['filter_name'])) {
                $videos = $this->getAnimeArticleInfo($v['filter_name']);

                if (!empty($videos)) {
                    //排序
                    $sum = 0;
                    foreach ($videos as $_k => $_video) {
                        $sum += $_video['video_week_sum'];
                    }
                    $data[$k]['total_num'] = count($videos);
                    $data[$k]['play_sum'] = $sum;
                    $data[$k]['new_time'] = strtotime($videos[0]['publish_time']);
                    }
                }
            }

            //排序
            foreach ($data as $k => $v) {
                if ($order == 'hot') {
                    $sort[$v['filter_id']] = $v['play_sum'];
                }else{
                    $sort[$v['filter_id']] = $v['new_time'];
                }
            }
           arsort($sort);
           foreach ($sort as $key => $val) {
                foreach ($data as $k => $v) {
                    if ( $key == $v['filter_id'] ) {
                        $res[] = $v;
                    }
                }
            }
        }else{
            $res = array();
        }
        
        obj('Cache')->setAnimeSort($data, $order,$res);
        return $res;  
    }

}