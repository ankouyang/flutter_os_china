import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:flutter_os_china/pages/login/index.dart';
import 'package:flutter_os_china/common/event_bus.dart';
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/pages/profile/detail.dart';


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

  String ?userAvatar;
  String ?userName;

  Widget  loginWidget =  const LoginPage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 尝试获取用户信息
    _showUserInfo();
    // eventBus LoginEvent监听
    eventBus.on<LoginEvent>().listen((event) {
     // 登陆后获取用户信息
      _getUserInfo();
    });
    // eventBus做LogOutEvent监听
    eventBus.on<LogOutEvent>().listen((event) {
      //退出的登录的时候,也要重新调用_showUserInfo，我们在设置里面进行退出。
      _showUserInfo();
    });


  }

  _getUserInfo() async {
    String  accessToken =  await DataUntils.getAccessToken();
    if(accessToken == null ||accessToken.length ==0) return ;
        Map<String,dynamic> params = {
          'access_token': accessToken,
          'dataType':'json'
        };
        print(params);
       print(AppUrls.userInfo);
        NetUtils.get(AppUrls.userInfo, params).then((data){
          Map<String,dynamic> mapData  = json.decode(data);
          print(mapData);
          if(mounted){
            setState(() {
              userAvatar =  mapData['avatar'];
              userName =  mapData['name'];
            });
          }
         //同时存储用户信息
         DataUntils.saveUserInfo(mapData);
        });
  }
  _showUserInfo() async {
     var user =  await DataUntils.getUserInfo();
     if(mounted){
       setState(() {
          if(user!= null){
            userAvatar = user.avatar;
            userName = user.name;
          }else{
            userAvatar = null;
            userName = null;
          }
       });
     }

  }

  _login() async {
    //跳转到登陆页面
   final  result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>loginWidget));
   if(result!=null&&result =='refresh'){
     //登陆成功后,进行订阅 LoginEvent事件 这定义的是一个类
     eventBus.fire(LoginEvent());
    }
  }

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
               onTap:()async{
                 //TODO
                 bool? isLogin = await DataUntils.isLogin();
                 if(isLogin){
                   print('跳转到对应的详情界面');
                 }else{
                   _login();//否则重新登录
                 }
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
              child:userAvatar!=null?Container(
                width: 60.0,
                height: 60.0,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,//盒子形状
                    //image是背景图片
                    border: Border.all(
                        width: 2.0,
                        color: const Color(0xffffffff)
                    ),
                    image: DecorationImage(
                        image: NetworkImage(userAvatar!),
                        fit: BoxFit.cover
                    )
                ),
              ):Image.asset('assets/images/ic_avatar_default.png',width: 60.0,height: 60.0),
              onTap: () async{
               bool? isLogin = await DataUntils.isLogin();
                 if(isLogin){
                   if(mounted){
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> const ProfileDetail()));
                   }
                 }else{
                   _login();
                 }
              },
            ),
            const SizedBox(height: 10.0),
              Text(userName??='点击头像登陆',style: const TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}



