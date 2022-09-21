import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/index.dart';
import 'package:flutter_os_china/pages/drawer/settings_page.dart';
import 'package:flutter_os_china/pages/drawer/publish_blog_page.dart';
import 'package:flutter_os_china/pages/drawer/layoutWidget/index.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/index.dart';

class MyDrawer extends StatelessWidget {
  final String headImgPath;
  final List menuTitles;
  final List menuIcons;
  // 定义一个Map
  final   Map<int,Widget>  _navigationMap = {
    0:const PublishTweetPage(),
    1:const SettingsPage(),
    2:const BaseWidget(),
    3:const LayoutWidget(),
    4:const ContainerWidget(),
  };
  MyDrawer({Key? key, required this.headImgPath, required this.menuTitles, required this.menuIcons}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //这里使用ListView.separated组件  ListView.separated与ListView.builder的主要区别是它提供了生成分割线的一个必填参数separatorBuilder
    return Drawer(
      child: ListView.separated(
          padding: const EdgeInsets.all(0.0),//解决状态栏的问题 不然就会出现间距
          itemBuilder:(BuildContext context, int index){
              if(index == 0){
                return Image.asset(headImgPath,fit: BoxFit.cover);
              }
              index -=1;//这里Image占了一个位置所以需要减1
              return ListTile(
                leading: Icon(menuIcons[index]),
                title:Text(menuTitles[index]) ,
                trailing:const Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.grey),
                onTap: (){
                  //todo 待实现跳转
                  _pushRoute(context,index);
                },
              );
           },
          itemCount: menuTitles.length+1,
          separatorBuilder: (BuildContext context, int index) {//分割线添加
            if(index == 0){
              return const Divider(height: 0.0);//
            }else{
              return const Divider(height: 2.0);
            }

          }),
    ); //image占了一个位置，所以这里需要+1
  }
 _pushRoute(BuildContext context,int index){
    // Navigator.pop(context);//关闭Drawer抽屉
    Widget currentWidget = _navigationMap[index]!;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>currentWidget));
 }
}
