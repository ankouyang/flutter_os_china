import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/utils/network_request.dart';
// import 'package:flutter_html/flutter_html.dart';

class MyNews extends StatefulWidget {
  const MyNews({Key? key}) : super(key: key);

  @override
  State<MyNews> createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  // 定义的tabBar title
  final List<String>  _tabTitle = [
     '@我',
     '评论',
     '私信',
  ];

  int curPage = 1;// 当前页面

  List?messageList;

  // 下拉刷新
  Future <void> _pullToRefresh() async{
    curPage = 1;
    _getMessageList();
  }
  // 获取私信列表
  _getMessageList() async{
    String  accessToken =  await DataUntils.getAccessToken();
    if(accessToken.isEmpty) return ;
    Map<String,dynamic> params = {
      'access_token': accessToken,
      'pageIndex':curPage,
      'pageSize':20,
      'dataType':'json'
    };
    NetUtils.get(AppUrls.messageList, params).then((data){
      if (data.isNotEmpty) {
        Map<String,dynamic> mapData  = json.decode(data);
        var messageListData = mapData['messageList'];
        print(messageListData);
        setState(() {
          if(mounted){
            messageList = messageListData;
          }
        });
      }


    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //这里使用 flutter 默认的Tab 切换组件  DefaultTabController 要配合  TabBarView 和 TabBar使用 不能单独进行使用
    return DefaultTabController(
        length: _tabTitle.length,
        child: Scaffold(
              appBar: AppBar(
                  title: const Text('消息中心'),
                  bottom: TabBar(
                    labelColor:Colors.white,
                    // indicatorColor:AppColor.primaryColor,
                    tabs: _tabTitle.map((title) => Tab(
                        text:title,
                    )).toList(),
                  )
              ),
              body:  TabBarView(children: [
                const Center(child: Text('暂无内容')),//@我
                const Center(child: Text('暂无评论')),//评论
                _buildNewsList(),//私信
                // _buildNewsList()
              ])
    ));
  }
  _buildNewsList(){
    if(messageList==null){
      //获取私信
      _getMessageList();
      return const Center(
        child: CupertinoActivityIndicator() //菊花加载页面
      );
    }

    //   下拉刷新的组件
    return  RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: messageList!.isEmpty ?const Center(child: Text('暂无私信')) : ListView.separated(
          itemBuilder: (context,index){
            return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                      Image.network(messageList![index]['portrait']), //私信人的头像
                      const SizedBox(width: 10.0),
                    // Expanded使用与类似与Column，Row，Flex等展示多个组件集合的组件，Expanded包含的组件可以占据剩余的空间
                      Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    messageList![index]['sendername'],
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    messageList![index]['pubDate'],
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Color(0xffaaaaaa)),
                                  ),
                                ],
                              ),
                              // Html(data: messageList![index]['content'])
                              Text(
                                messageList![index]['content'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(fontSize: 12.0),
                              ),
                            ],
                      ))
                  ],
                ),
            );
          },
          separatorBuilder: (context,index){
            return const Divider();
          },
          itemCount: messageList!.length),
    );
  }

}
