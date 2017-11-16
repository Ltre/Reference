<?php
class AnimeController extends BaseController{
	
	

	
	public function actionList(){
		$type = arg('type');
		$ver  = arg('ver');
		$this->order = arg('order','new');
		$this->ver  = obj('Anime')->getMapData($ver);
		$this->type = obj('Anime')->getMapData($type);
		//$this->area = arg('area');
		$this->display('anime/anime_list.html');
	}

	//异步获取剧集列表页带分页
	public function actionAjaxList(){
		$type = arg('type');
		$ver  = arg('ver');
		$this->order = arg('order','new');
		$this->ver  = obj('Anime')->getMapData($ver);
		$this->type = obj('Anime')->getMapData($type);
		//$this->area = arg('area');

		/*$this->ver = arg('ver');
		$this->type = '热血';
		$this->area = '日本';*/
		$this->page = arg('p',1);

		$tags['anime_area'] = $this->area;
		$tags['anime_type'] = $this->type;
		$tags['anime_ver']  = $this->ver;
	
	
		$list = obj('Anime')->getAnimeList($tags,$this->order,$this->page,36);

	
		$this->pages  = $list['pages'];
		$this->list = $list['list'];
	
		echo  $this->display('anime/anime_list_unit.html',true);
	}

	public function actionDetail(){
		$filter_url = arg('filter_url');

		if( empty($filter_url) ){
			$this->err404();
		}
		$page = arg('p',1);
		//获取剧集基础信息
		$animeInfo = obj('CmsMirror')->getFilterByUrl( $filter_url );
		//$animeInfo = obj('Filter')->getFilterById( $fid );
		if ( empty($animeInfo) ) {
			$this->err404();
		}
		//获取剧集视频(带分页)
		$animeInfo['anime_type'] = array_filter( explode("/",$animeInfo['anime_type']) );
		$animeInfo['total'] = count( obj('Anime')->getAnimeVideo( $animeInfo['filter_name']) );
		$animeInfo['anime_desc'] =  mb_substr($animeInfo['anime_desc'], 0, 600, 'UTF8');;
		$this->animeInfo = $animeInfo;
		//获取标签链接
		$this->tagUrls = obj('Anime')->getTagUrl($animeInfo['anime_type']);
		
		$this->DWMRank = obj('PlayStats')->getDWMRank('vhuyadm');
		$animeRelate   = obj('Anime')->getAnimeTagData( $animeInfo['anime_type'],8 );
		$flag = array(); 	
		//去掉重复的相关剧集
		foreach ($animeRelate as $k => $v) {
			foreach ($v as $key => $val) {
				if ( !in_array($val['filter_id'],$flag) && $val['filter_id'] != $animeInfo['filter_id'] ) {
					$relate[] = $val;
					$flag[] = $val['filter_id'];
				}else{
					continue;
				}	
			}
		}

		$this->animeRelate = $relate;
		$this->display('anime/anime_detail.html');
	}

	public function actionAjaxPage(){
		$page = arg('p',1);
		$filter_name = arg('filter_name');
		$anime_name = arg('anime_name');
		if ( empty($filter_name) ) exit('');
		$this->data = obj('Anime')->getAnimePage( $filter_name,$anime_name,$page, 20);
		echo $this->display('anime/anime_page.html',true);
	}


	
}