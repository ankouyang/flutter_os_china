import 'package:flutter/material.dart';
class SingleChildScrollWidget extends StatefulWidget {
  const SingleChildScrollWidget({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollWidget> createState() => _SingleChildScrollWidgetState();
}

class _SingleChildScrollWidgetState extends State<SingleChildScrollWidget> {

  String numStr =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SingleChildScrollView'),
        ),
        body: Scrollbar( //Scrollbar展示滚动条
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: numStr.split('').map((e) => Text(e,textScaleFactor: 2.0)).toList(),
              ),
            ),
          ),
        )
    );
  }
}
