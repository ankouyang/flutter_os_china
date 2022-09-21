import 'package:flutter/material.dart';
class AlignWidget extends StatefulWidget {
  const AlignWidget({Key? key}) : super(key: key);

  @override
  State<AlignWidget> createState() => _AlignWidgetState();
}

class _AlignWidgetState extends State<AlignWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align组件'),
      ),
      // body:const Align(
      //   alignment: Alignment.center,
      //   child: Text('alignment组件'),
      // ),
      // body: Container(
      //   // width: 120.0,
      //   // height: 120.0,
      //   color: Colors.cyanAccent,
      //   child:const Align(
      //     alignment: Alignment(1.0,-1),
      //     widthFactor: 2.0,
      //     heightFactor: 2.0,
      //     child:  FlutterLogo(
      //       size: 60,
      //     ),
      //   ),
      // ),
        body:Column(
          children: [
            Container(
              decoration: const  BoxDecoration(color: Colors.red),
              child: const Center(
                child: Text('center'),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: const BoxDecoration(color: Colors.red),
              child: const Center(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Text('center'),
              ),
            )
          ],
        ),
    );
  }
}
