 import 'package:flutter/material.dart';
import 'package:flutter_os_china/widgets/flutter_quill.dart';
 class PublishTweetPage extends StatefulWidget {
   const PublishTweetPage({Key? key}) : super(key: key);

   @override
   State<PublishTweetPage> createState() => _PublishTweetPageState();
 }

 class _PublishTweetPageState extends State<PublishTweetPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             const Text('写博客'),
             GestureDetector(
                 onTap: (){
                   print('保存');
                 },
                 child: const Text('保存')
             )
           ],
         ),
       ),
       body:Column(
         children: [
           TextField(
             onTap:(){
             },
             decoration:const InputDecoration(
                 labelText:'博客标题',
             )
           ),
           const SizedBox(height: 20.0),
           const Expanded(child:  FlutterQuill()),
         ],

       )
     );
   }
 }
