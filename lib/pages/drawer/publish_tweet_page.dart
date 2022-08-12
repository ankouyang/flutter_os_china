 import 'package:flutter/material.dart';
 class PublishTweetPage extends StatefulWidget {
   const PublishTweetPage({Key? key}) : super(key: key);

   @override
   State<PublishTweetPage> createState() => _PublishTweetPageState();
 }

 class _PublishTweetPageState extends State<PublishTweetPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),
       body: Text('发布动弹'),
     );
   }
 }
