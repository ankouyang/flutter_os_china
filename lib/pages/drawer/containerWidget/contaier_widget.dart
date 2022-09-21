import 'package:flutter/material.dart';
class CommonContainer extends StatefulWidget {
  const CommonContainer({Key? key}) : super(key: key);

  @override
  State<CommonContainer> createState() => _CommonContainerState();
}

class _CommonContainerState extends State<CommonContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container组件'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0), //容器外补白
              color: Colors.orange,
              child: const Text("Hello world!"),
            ),
            Container(
              padding: const EdgeInsets.all(20.0), //容器内补白
              color: Colors.orange,
              child: const Text("Hello world!"),
            ),
          ],
        ),
    );
  }

  Container buildAllContainer() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 80.0),
        width: 200.0,
        height: 100.0,
        // color: Colors.red,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.red,
          // shape: BoxShape.circle,
          gradient: RadialGradient(colors: [Colors.red,Colors.orange]),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2),
        child: const Text('太阳'),
      );
  }
}
