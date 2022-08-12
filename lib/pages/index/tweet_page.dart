import 'package:flutter/material.dart';


class TweetPage extends StatefulWidget {
  const TweetPage({Key? key}) : super(key: key);

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('动弹'),
    );
  }
}
