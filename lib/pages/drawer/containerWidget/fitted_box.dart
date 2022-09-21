import 'package:flutter/material.dart';

class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FittedBox'),
        ),
      body:Column(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.red,
            child: FittedBox(//子容器超过父容器,fit默认是包含 默认是不裁剪
              child: Container(width: 60, height: 70, color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.red,
            child: FittedBox(//子容器超过父容器
             fit: BoxFit.none,
              child: Container(width: 60, height: 70, color: Colors.blue),
            ),
          ),
          FittedBox(
            child: Column(
              children: [
                // Text('测试字体缩小'*4),
                // Text('测试字体缩小'*6),
                // Text('测试字体缩小'*8),
                Container(
                  width: 60,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
