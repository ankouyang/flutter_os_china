import 'package:flutter/material.dart';
class ClipWidgetData extends StatefulWidget {
  const ClipWidgetData({Key? key}) : super(key: key);

  @override
  State<ClipWidgetData> createState() => _ClipWidgetDataState();
}

class _ClipWidgetDataState extends State<ClipWidgetData> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.network('https://t7.baidu.com/it/u=128764686,1887614532&fm=193&f=GIF',width: 60,);
    return Scaffold(
          appBar: AppBar(
            title: const Text('Clip组件'),
          ),
          body:Center(
            child:Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                avatar,
                ClipOval(child: avatar),//裁剪为圆形
                ClipRRect( //剪裁为圆角矩形
                  borderRadius: BorderRadius.circular(5.0),
                  child: avatar,
                ),
                ClipRect(//将溢出部分剪裁
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半
                    child: avatar,
                  ),
                ),
              ],
            ),
          )
       );
  }
}
