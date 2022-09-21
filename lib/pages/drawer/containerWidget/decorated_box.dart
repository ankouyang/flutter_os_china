import 'package:flutter/material.dart';
class DecoratedBoxWidgetData extends StatefulWidget {
  const DecoratedBoxWidgetData({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxWidgetData> createState() => _DecoratedBoxWidgetDataState();
}

class _DecoratedBoxWidgetDataState extends State<DecoratedBoxWidgetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const Text('DecoratedBox'),
         ),
         body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration( //Decoration是一个抽象类。BoxDecoration是Decoration的子类
                      gradient:const LinearGradient(colors:[Colors.cyanAccent,Colors.orange] ) ,   // 渐变 LinearGradient   RadialGradient 一共两种  colors是一个list
                      borderRadius: BorderRadius.circular(3.0),//3像素圆角
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0,2.0),
                            blurRadius: 4.0
                        )
                      ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 18.0),//  left right 80   top和bottom为18.0
                    child: Text('DecoratedBox'),
                  ),

                ),
              ],
            ),
         )
    );
  }
}
