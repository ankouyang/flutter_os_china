import 'package:flutter/material.dart';
class PaddingContainerWidget extends StatefulWidget {
  const PaddingContainerWidget({Key? key}) : super(key: key);

  @override
  State<PaddingContainerWidget> createState() => _PaddingContainerWidgetState();
}

class _PaddingContainerWidgetState extends State<PaddingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Padding'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                //左边添加8像素补白
                padding: EdgeInsets.only(left: 8),
                child: Text("Hello world"),
              ),
              Padding(
                //上下各添加8像素补白
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text("I am Jack"),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Text("Your friend"),
              )
            ],
          ),
        ),
    );
  }
}
