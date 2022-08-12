import 'package:flutter/material.dart';

class TweetHomePage extends StatefulWidget {
  const TweetHomePage({Key? key}) : super(key: key);

  @override
  State<TweetHomePage> createState() => _TweetHomePageState();
}

class _TweetHomePageState extends State<TweetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Text('动弹小黑屋'),
    );
  }
}
