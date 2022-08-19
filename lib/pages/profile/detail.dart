 import 'package:flutter/material.dart';
class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的资料'),
        ),
       body:Container(
         margin: const EdgeInsets.only(left: 20),
         padding: const EdgeInsets.only(top:10.0,bottom: 10,right: 20),
         child: InkWell(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text('设置'),
               Text('设置'),
             ],
           ),
         ) ,
       )
    );
  }
}
