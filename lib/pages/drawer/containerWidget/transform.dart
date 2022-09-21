import 'package:flutter/material.dart';
import 'dart:math' as math;
class TransformWidgetData extends StatefulWidget {
  const TransformWidgetData({Key? key}) : super(key: key);

  @override
  State<TransformWidgetData> createState() => _TransformWidgetDataState();
}

class _TransformWidgetDataState extends State<TransformWidgetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transform'),
        ),
        body:buildRotatedBoxRow()
    );
  }

  Container buildRotatedBoxRow(){
    return Container(
      margin: const  EdgeInsets.symmetric(vertical: 80,horizontal: 80),
      child: Row(
        children: const [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: RotatedBox(
              //缩小0.8倍
              quarterTurns:1,//选择90.0
              child: Text('Hello world'),
            ),
          ),
          Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
        ],
      ) ,
    );
  }


  Container buildTranformRow(){
    return Container(
      margin: const  EdgeInsets.symmetric(vertical: 80,horizontal: 80),
      child: Row(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child:  Transform.scale(
              //缩小0.8倍
              scale:1.5,
              child: const Text('Hello world'),
            ),
          ),
          const  Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
        ],
      ) ,
    );
  }


  Container buildTScaleContainer() {
    return Container(
      margin:const  EdgeInsets.symmetric(vertical: 80,horizontal: 80),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.red
        ),
        child: Transform.scale(
          //缩小0.8倍
          scale:0.8,
          child: const Text('Hello world'),
        ),
      ),
    );
  }



  Container buildTranslateContainer() {
    return Container(
      margin:const  EdgeInsets.symmetric(vertical: 80,horizontal: 80),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.red
        ),
        child: Transform.translate(
        //默认原点为左上角，左移20像素，向上平移5像素
        offset: const Offset(-20.0,-5.0),
          child: const Text('Hello world'),
        ),
      ),
    );
  }


  Container buildRotateContainer() {
    return Container(
        margin:const  EdgeInsets.symmetric(vertical: 80,horizontal: 80),
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.red
          ),
          child: Transform.rotate(
            angle: math.pi/2,//旋转90.c
            child: const Text('Hello world'),
          ),
        ),
      );
  }

  Center buildCenter() {
    return Center(
        child:  Container(
          color: Colors.black,
          child: Transform(
            alignment: Alignment.topRight,//相对于坐标系原点的对齐方式
            transform: Matrix4.skewY(0.3),//沿Y轴倾斜0.3弧度
            child:  Container(
              padding: const EdgeInsets.symmetric(horizontal: 80.0,vertical: 18.0),
              color: Colors.deepOrange,
              child: const Text('Transform'),
            ),
          ),
        ),
      );
  }
}
