import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppColor;

class MyPage extends StatefulWidget {
   const MyPage({Key? key}) : super(key: key);
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List menuIcons = [
    Icons.new_label,
    Icons.emergency_recording,
    Icons.error,
    Icons.question_answer_sharp,
    Icons.local_activity,
    Icons.onetwothree_rounded,
    Icons.person
  ];
  List menuTitles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友'
  ];
  @override
  Widget build(BuildContext context) {
    //这里使用带有分割线的ListView
    return ListView.separated(
        padding: EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context,int index){
           if(index == 0){
             return _buildHeader();
           }
           index -=1;
           return ListTile(
               leading: Icon(menuIcons[index]),
               title: Text(menuTitles[index]),
               trailing: Icon(Icons.arrow_forward_ios,size: 15.0),
               onTap:(){
                 //TODO
                 print('跳转');
               } ,
           );
        },
        separatorBuilder: (context,index){
          return const Divider();
        },
        itemCount: menuTitles.length+1
    );
  }

  Container _buildHeader(){
    return Container (
      height: 150.0,
      color: AppColor.primaryColor,
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child:Container(
                width: 60.0,
                height: 60.0,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,//盒子形状
                    //image是背景图片
                    border: Border.all(
                        width: 2.0,
                        color: const Color(0xffffffff)
                    ),
                    image:const DecorationImage(
                        image: AssetImage('assets/images/ic_avatar_default.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              onTap: (){
                print('点击头像触发事件');
              },
            ),
            const SizedBox(height: 10.0),
            const Text('点击头像登陆',style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}



