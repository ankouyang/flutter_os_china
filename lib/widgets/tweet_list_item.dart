import 'package:flutter/material.dart';
class TweetListItem extends StatefulWidget {
  final Map<String,dynamic> tweetList;
  const TweetListItem({Key? key, required this.tweetList}) : super(key: key);

  @override
  State<TweetListItem> createState() => _TweetListItemState();
}

class _TweetListItemState extends State<TweetListItem> {
  @override
  Widget build(BuildContext context) {

    dynamic  _columnChildren = <Widget> [
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 padding: const EdgeInsets.all(10.0),
                 // CircleAvatar //原型头像
                 child: const CircleAvatar(
                     backgroundImage:NetworkImage('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF')
                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Text(
                     'ankouyang',
                     style: TextStyle(
                       fontSize: 20.0,
                     ),
                   ),
                   Text(
                     '20220819',
                     style: TextStyle(
                       color: Color(0xffaaaaaa),
                     ),
                   )
                 ],
               )
             ],
           ),
           //动弹内容
           const Padding(
               padding: EdgeInsets.symmetric(vertical: 10.0),
               child: Text('过滤HTML的内容',style: TextStyle(fontSize: 18.0)),
           )//竖直方向

    ];

    return Container(child: _columnChildren);
  }
}
