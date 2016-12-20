1、优化路由和地址重写，路由可自定义格式和规则。【暂时定死格式吧。。感觉没有再改的必要】
2、包含控制器、模型、视图、过滤器、后台服务（分为借机执行服务和持续执行服务）。【剩余后台服务未完成】
3、所有文件必须按需包含。【完全完成】
4、系统核心采用事件监听机制，方便组件扩展。
	思路：采用lambda闭包实现代码注入，前置和后置代码容易实现注入，环绕注入需要研究实现方式。【算是完成了，强制指定根类是DIEvent】
5、模型底层尽量采用接口方式编写，以便支持多种库、多个库连接操作。【已用模板模式建立了模型，已完成MYSQL驱动，其他类型的驱动以后版本再说吧】
6、视图层可采用现有模板引擎，也可自行编写。【已完成，可开关Smarty】
7、配置文件应合理配置和放置。【目前还算有条理，先后加载顺序已严格定义】

ActionInvoker 2 命名为 ActionInvoker Plus，别名DoInject


已完成DIDo和DIInject。已完成route到do的过渡。


已完成：
设法修改__autoload，使entity目录中的文件不必强制使用.entity.php后缀，类名也不强制使用Entity后缀

旧的注入思路：
方式1：利用__call()。
方式2：使用eval()执行新继承的临时类，在新类中扩展原有的方法。缺陷：需要显式地调用新类，需要对可能调用到的方法进行扩充。

新的注入思路：
1、构造全局上下文DIContext，在DIContext中注册需要注入的对象和注入点。
2、利用DIContext托管全局注册表，遇到不存在的类时，使用spl_autoload_register()临时覆盖__autoload(),新的autoload会自动调用注入逻辑，完成调用后，将恢复原__autoload()。
		针对现状：要么改造原__autoload()，要么临时覆盖__autoload()
	具体：在新__autoload()中，使用create_class创建继承于原类的临时类，扩展要调用的方法。


待办（优先级很低，以后搞科研再说）：
不应该把__autoload()写死，应该实现支持随处注册__autoload()的特性。


待办：
route流程————识别请求的类型(完成)->命令规则拦截(完成)->全局过滤器拦截->重写->参数过滤->分派执行(完成)->可选后置逻辑

待办（优先级很低，甚至不用做）：
Do方法inject前/中/后注入(完成)、Do模块inject前/后注入（不需中置）

已完成：全局过滤器和特定作用点过滤器

已完成：视图输出及模板引擎加载。难点：模板引擎合理加载

把letshell坑爹的格式改为?xxx.xxx。。（已完成）

已办：
数据库配置需要区别测试环境和正式环境，还要提供多库支持。
【已通过判断$_SERVER['HTTP_HOST']粗略判断服务器环境，多库连接支持还是算了，感觉个人站点没什么必要，真要用到的话，直接在别的库那里开放个接口即可】

已办：提供多运行环境的支持，并非仅有测试和正式，也有可能存在3台以上的服务器，且每台服务器上要求的配置参数不同。
【已通过判断$_SERVER['HTTP_HOST']粗略判断服务器环境】

待办：增加跑异常时的错误码记录。要有专用类来把错误码和具体错误信息对应起来。【次要，根据实际情况定义错误码即可】

待办：将ActionInvoker的扩展库移植到本框架中

待办：增加Redis和Memcache扩展【次要】

待办：扩展MongoDB【次要】

待办：把url()和pager(),arg()等实用方法引入

待办：模仿DIModelUtil::supertable()，写一个new类的通用方法，要考虑类已声明的情况

待办：过滤器层次要求：
		全局绝对过滤器	GAF (GlobalAbsoluteFilter, 后缀名.filter) -> 
		全局普通过滤器	GGF (GlobalGeneralFilter, 后缀名.filter) -> 
		特定范围过滤器	SSF (SpecificScopeFilter, 后缀名.filter) -> 
		Do单元过滤器		DUF (DoUnitFilter.inject)。
	其中，
	GAF在系统任何情况下都执行，无法停用，除非不声明或删除该过滤器(待实现，只需要在filtermap中配置一种新的过滤器类型，然后在__route.php中无条件执行之)；
	GGF在系统任何情况下一般都是可执行的，如果配置了例外项，则例外项可以不触发该过滤器执行。
	SSF可以指定多个Do组件、或某些Do方法与其它Do组件来共享该类型的过滤器。
	DUF在进行Do的某些需要注入增强逻辑的方法前执行。
	



















添加支持：PHP的RPC模型[这个要强力支持]

方式一：基于统一的HTTP接口模拟RPC

​RPC使用准备：
1、远端基地址（调用者需配置）
2、自动化调用库（调用者使用）：
        需要知道要调用的是函数还是对象的方法，以及需要的参数、调用途径（路径）。
        可用CURL向远端发起调用请求。
        能够自动处理远端返回的调用结果，要确保获取的结果与远端的执行结果相同。
3、提供者的支持库：
        响应调用者的请求，定位到被调代码
        执行被调代码
        封装好调用结果，发送到调用者

粗略实现：
    调用者发起请求
    提供者开放RpcController，根据调用者的请求查找对应的model，调用之，将调用结果序列化，发送给调用者。
    调用者接收调用结果，将其反序列化。拿到真实结果。


方式二：调用者本地声明被调用的抽象类或接口作为存根。。。

1、调用者声明接口或抽象类
2、提供者提供具体的实现
3、调用者使用 [实现代码自动装载库] ，在调用远程类时，自动从远程载入实现的代码。



以上两种方式最大的区别在于：前者核心过程在提供方进行，而后者的则在调用方执行。前者本质上还是远程接口请求调用，属于RPC模拟，而后者才是真正意义上的RPC。
