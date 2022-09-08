import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/widgets/new_list_item.dart';
import 'package:flutter_os_china/pages/login/index.dart';
import 'package:flutter_os_china/common/event_bus.dart';
import 'package:flutter_os_china/constants/enum_data.dart' show LoadingStatus;
import 'package:flutter_os_china/widgets/loading_widget.dart';
import 'package:flutter_os_china/widgets/flutter-swiper.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int pageIndex = 1;
  bool isLogin = false;
  // 定义一个的滚动控制器，
  // ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件
  // 可以用ScrollController来控制可滚动组件的滚动位置
  ScrollController  scrollController = ScrollController();

  //页面数据源
  List ? newList;
  // 定义加载中的默认文字
  String loadingText = '加载中...';
  // 加载默认是空闲状态
  dynamic loadStatus = LoadingStatus.statusFree;
  // imgList
  List<Map<String,dynamic>> imgList = [
    {'title':'','img':'https://static.oschina.net/uploads/space/2021/0814/082104_deAI_4252687.png','url':'https://www.oschina.net/question/4487475_2323867'},
    {'title':'','img':'https://oscimg.oschina.net/oscnet/up-5f7b19952085318999567bddddbd9653774.png','url':'https://www.oschina.net/question/4489239_2322718'},
    {'title':'','img':'https://static.oschina.net/uploads/space/2022/0827/082211_BlX8_2720166.png','url':'https://www.oschina.net/news/208136/awk-support-unicode'},
    {'title':'','img':'https://static.oschina.net/uploads/space/2021/0422/163252_lwf9_4487475.png','url':'https://www.oschina.net/question/4487475_2322385'},
    {'title':'','img':'https://static.oschina.net/uploads/space/2022/0829/072426_P5Jg_4937141.png','url':'https://www.oschina.net/news/208302/virtualbox-7-support-windows-11'},
  ];

  //下拉刷新
  Future<void> _pullRefresh() async {
    //下拉刷新
    print('下拉刷新');
    setState(() {
      pageIndex = 1;
      newList = null;//同时清空
      loadingText = '加载中...';//恢复到初始化状态
      loadStatus = LoadingStatus.statusFree;//恢复到初始化状态
    });
    //更新新闻列表
    getBlogList(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //是否登陆
    DataUntils.isLogin().then((isLoginFlag) {
      if (!mounted) return;
      setState(() {
        isLogin = isLoginFlag;
      });
      // 获取新闻列表
      getBlogList(false);
    });

    //订阅登陆
    eventBus.on<LoginEvent>().listen((event) {
      //登录
      if (!mounted) return;
      setState(() {
        isLogin = true;
      });
      // 获取新闻列表
      getBlogList(false);
    });
    // 订阅退出
    eventBus.on<LogOutEvent>().listen((event) {
      //退出登录
      if (!mounted) return;
      setState(() {
        isLogin = false;
      });
    });
    //滚动监听
    scrollController.addListener(() {
      /**
          调用 scrollController.position.pixels 可以获取当前滚动的像素点 ;
          调用 scrollController.position.maxScrollExtent 可以获取当前最大可滚动位置 ;
          如果上述两个值相等 , 那么说明已经滚动到列表最底部了 , 此时可以执行上拉加载更多
       */
      dynamic maxScroll = scrollController.position.maxScrollExtent;
      dynamic pixels = scrollController.position.pixels;
      if(maxScroll == pixels){
        //加载更多
        setState(() {
          pageIndex ++;
        });

        //同时获取下面的新闻数据
        getBlogList(true);
      }
    });


  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //注意一点要把scrollController进行销毁 否则容易内存溢出
    scrollController.dispose();

  }

  void getBlogList(bool isLoadMore) {
    //设置状态
    if(loadStatus == LoadingStatus.statusFree){
      // 空闲状态的时候才能下拉加载数据
      setState(() {
        loadStatus = LoadingStatus.statusLoading;
      });
    }
    //获取token
    DataUntils.getAccessToken().then((accessToken) {
      if (accessToken.isEmpty) {
        return;
      }
      Map<String, dynamic> params = {
        'access_token': accessToken,
        'catalog': 1,
        'page': pageIndex,
        'pageSize': 20,
        'dataType': 'json'
      };
      NetUtils.get(AppUrls.blogList, params).then((data) {
        print('获取数据');
        print(data);
        if (data.isNotEmpty) {
          Map<String, dynamic> mapData = json.decode(data);
          List newListData = mapData['bloglist'];
          setState(() {
            if(isLoadMore){
              if(newListData.isEmpty||newListData == null){
                loadingText = '--- 亲,我是有底线的 ---';
                loadStatus = LoadingStatus.statusCompleted; //加载完成
              }else{
                newList?.addAll(newListData);//注意这里一定要addAll 把newListData数组里面的map数据全部添加进去
                loadStatus = LoadingStatus.statusFree;//同时状态至于空闲
                loadingText = '加载中...';//这个文案要显示加载中,因为这里需要下次继续加载
              }
            }else{
              newList = newListData;
            }
          });
        }
      });
    });
  }

  toLogin() async {
    //去登录页面
    dynamic result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    if (result != null && result == 'refresh') {
      //  先订阅
      eventBus.fire(LoginEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLogin) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('由于openapi限制,必须登录才能获取资讯!'),
            const SizedBox(height: 5.0),
            InkWell(
              onTap: toLogin,
              child: const Text('去登录'),
            )
          ],
        ),
      );
    }

    if (newList == null) {
      return const CupertinoActivityIndicator();
    }


    //  RefreshIndicator  下拉刷新页面
    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterSwiperWidget(imgList: imgList),
            Expanded(child:ListView.builder(
                controller: scrollController,//注意这里一定要加上滚动的控制器,否则是无法监听滚动元素的
                itemBuilder: (context, index) {
                  if(newList?.length == index){
                    return LoadingWidget(loadText:loadingText,loadStatus: loadStatus);
                  }else{
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Color(0xffaaaaaa)
                              )
                          )
                      ),
                      child: buildNewListItem(index),
                    );
                  }
                },
                itemCount: newList!.length + 1 //这个长度一定要记得+1 需要包含那个上拉加载图标
            ) )

          ],
        )
    );
  }

  StatefulWidget buildNewListItem(int index) {
    return NewListItem(newsList: newList![index],type: 'blog',title: '博客详情');
  }
}
