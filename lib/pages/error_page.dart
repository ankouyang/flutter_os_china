import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         title: const Text('错误页面'),
       ),
       body: const Center(
         child: Text('404 错误页面'),
       )
    );
  }
}
