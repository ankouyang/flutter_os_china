import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/widgets/flutter_quill.dart';
import 'package:flutter_os_china/utils/toast_until.dart';
import 'package:flutter_os_china/common/event_bus.dart';
import 'package:flutter_os_china/pages/login/index.dart';
 class PublishTweetPage extends StatefulWidget {
   const PublishTweetPage({Key? key}) : super(key: key);
   @override
   State<PublishTweetPage> createState() => _PublishTweetPageState();
 }



 class _PublishTweetPageState extends State<PublishTweetPage> {
   bool isLogin = false;
   Map<String,dynamic> inputData = {
     'title':'',
     'content':''
   };
   //  博客名称的控制器
   TextEditingController titleController = TextEditingController();
   // 发布博客
   publishBlog(){
     if(inputData['title'] == ''){
       ToastUntil.commonToast('请填写贴子标题');
       return ;
     }
     if(inputData['content'] == ''){
       ToastUntil.commonToast('请填写帖子内容');
       return ;
     }

     DataUntils.getAccessToken().then((token){
       Map<String,dynamic> params = {
         'access_token':token,
         'title':inputData['title'].toString(),//博客标题
         'content':inputData['content'].toString()//博客内容
       };
       print(params);
       NetUtils.post(AppUrls.postPub, params).then((data){
         print(data);
         if(data.isNotEmpty){
           Map<String,dynamic> mapData = jsonDecode(data);
           if(mapData['error'] == '200'){
             ToastUntil.commonToast(mapData['error_description']);
             Navigator.pop(context);//返回上一页
           }else{
             // 错误提示
             ToastUntil.commonToast(mapData['error_description']);
           }
         }
       });

     });
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
    });

    //订阅登陆
    eventBus.on<LoginEvent>().listen((event) {
      //登录
      if (!mounted) return;
      setState(() {
        isLogin = true;
      });
    });
    // 订阅退出
    eventBus.on<LogOutEvent>().listen((event) {
      //退出登录
      if (!mounted) return;
      setState(() {
        isLogin = false;
      });
    });

    titleController.addListener(() {
        setState(() {
          inputData['title'] = titleController.text;//监听输入的博客标题
        });
    });
  }

   // 初始化
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
     List<Widget>  columnChildren = [
       const Text('写帖子'),
     ];
     if(isLogin){
       columnChildren.add( GestureDetector(
            onTap: publishBlog,
           child: const Text('保存')
       ));
     }
     return Scaffold(
       appBar: AppBar(
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:columnChildren,
         ),
       ),
       body:buildColumn()
     );
   }



   Widget  buildColumn() {
     if (!isLogin) {
       return Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             const Text('由于openapi限制,必须登录才能写博客!'),
             const SizedBox(height: 5.0),
             InkWell(
               onTap: toLogin,
               child: const Text('去登录'),
             )
           ],
         ),
       );
     }

     return Column(
       children: [
         TextField(
           controller: titleController,
           decoration:const InputDecoration(
               labelText:'帖子标题',
           )
         ),
         const SizedBox(height: 20.0),
          Expanded(child:  FlutterQuill(changeContentCallBack:(content){
               // 接收子组件的content
               setState(() {
                 inputData['content'] = content;
               });
         })),
       ],
     );
   }
 }
