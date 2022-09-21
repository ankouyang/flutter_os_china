import 'package:flutter/material.dart';
class StackPostionedWidget extends StatefulWidget {
  const StackPostionedWidget({Key? key}) : super(key: key);

  @override
  State<StackPostionedWidget> createState() => _StackPostionedWidgetState();
}

class _StackPostionedWidgetState extends State<StackPostionedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stack and Positioned'),
        ),
        body:ConstrainedBox(
          constraints: const BoxConstraints.expand(),//用来占满全屏的 也可以Container设置一个width为double.infinity
          child: Stack(
            alignment: Alignment.center,// 居中显示
            fit: StackFit.expand,
            children:  [
               Container(
                color: Colors.red,
                child: const Text('我没有使用Positioned',style: TextStyle(color: Colors.lightBlue)),
              ),
              const Positioned(
                  top:18.0,
                  width: 200,
                  child: Text('我是使用Positioned width为200 top为18.0 绝对定位的')
              ),
              const Positioned(
                  left:18.0,
                  width: 100,
                  child: Text('我是使用Positioned width为200 left为18.0  绝对定位的')
              ),
              const Positioned(
                  bottom: 18.0,
                  left:18.0,
                  width: 200,
                  child: Text('我是使用Positioned width为200 bottom为18.0  left为18.0 绝对定位的')
              ),
            ],
          ),
        ),
    );
  }
}
