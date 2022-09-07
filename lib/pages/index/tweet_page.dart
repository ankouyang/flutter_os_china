import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/enum_data.dart' show LoadingStatus;
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/widgets/loading_widget.dart';
import 'package:flutter_os_china/widgets/tweet_list_item.dart';
import 'package:flutter_os_china/pages/login/index.dart';
import 'package:flutter_os_china/common/event_bus.dart';
import 'package:flutter_os_china/utils/data_until.dart';

import '../../constants/constants.dart';

class TweetPage extends StatefulWidget {
  const TweetPage({Key? key}) : super(key: key);

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  int pageIndex = 1;
  List? latestTweetList; //最新数据list
  List? hotTweetList; //最热数据list
  // 定义加载中的默认文字
  String loadingText = '加载中...';
  // 加载默认是空闲状态
  dynamic loadStatus = LoadingStatus.statusFree;
  //  是否登陆
  bool isLogin = false;
  //  滚动加载
  ScrollController  scrollController = ScrollController();

  //去登录
  toLogin() async {
    //去登录页面
    dynamic result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    if (result != null && result == 'refresh') {
      //  先订阅
      eventBus.fire(LoginEvent());
    }
  }
  //获取动弹列表
  getTweetList(bool isLoadMore,bool isHot){
    DataUntils.isLogin().then((isLogin) {
      if (isLogin) {
        DataUntils.getAccessToken().then((accessToken) {
          if (accessToken.isEmpty) {
            return;
          }
          Map<String, dynamic> params = <String, dynamic>{};
          params['access_token'] = accessToken;
          params['user'] = isHot ? -1 : 0;
          params['page'] = pageIndex;
          params['pageSize'] = 10;
          params['dataType'] = 'json';

          NetUtils.get(AppUrls.tweetList, params).then((data) {
            print(data);
            if (data.isNotEmpty) {
              Map<String, dynamic> map = json.decode(data);
              List tweetList = map['tweetlist'];
              if (!mounted) return;
              setState(() {
                if (isLoadMore) {
                  if (isHot) {
                    latestTweetList?.addAll(tweetList);
                    hotTweetList?.addAll(tweetList);
                  }
                } else {
                  if (isHot) {
                    hotTweetList = tweetList;
                  } else {
                    latestTweetList = tweetList;
                  }
                }
              });
            }
          });
        });
      }
    });
  }

  Future<void> _pullRefresh()  async {
    //下拉刷新
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
      getTweetList(false,false);
    });

    //订阅登陆
    eventBus.on<LoginEvent>().listen((event) {
      //登录
      if (!mounted) return;
      setState(() {
        isLogin = true;
      });
      // 获取新闻列表
      getTweetList(false,false);
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
        getTweetList(false,false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    if (!isLogin) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('必须登录才能查看动弹信息!'),
            const SizedBox(height: 5.0),
            InkWell(
              onTap: toLogin,
              child: const Text('马上登录'),
            )
          ],
        ),
      );
    }

    // 这里需要用到tabBar
    return Container(
      child: buildLatestTweetList(),
    );
  }
  // 最新widget
   Widget buildLatestTweetList(){
    if(latestTweetList==null){
      return const CupertinoActivityIndicator();
    }

    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
            controller:scrollController,
            itemCount: latestTweetList!.length + 1,//这里需要塞入一个加载中的提示文案
            itemBuilder: (context,index){
                if(latestTweetList?.length ==index){
                    return LoadingWidget(loadText:loadingText,loadStatus: loadStatus);
                }else{
                  return  Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Color(0xffaaaaaa)
                              )
                          )
                      ),
                      child:TweetListItem(tweetList: latestTweetList![index])
                  );
                }

            }
        )
    );
   }
 // 最热的widget(这个不需要刷新加载最新的)
  Widget buildHotTweetList(){
    if(hotTweetList==null){
      return const CupertinoActivityIndicator();
    }
    return ListView.builder(
        itemBuilder:(context,index){
          if(hotTweetList?.length ==index){
            return LoadingWidget(loadText:'---亲,我是有底线的---',loadStatus: LoadingStatus.statusCompleted);
          }else{
            return  Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.5,
                            color: Color(0xffaaaaaa)
                        )
                    )
                ),
                child:TweetListItem(tweetList: hotTweetList![index])
            );
          }
        });
  }


}
