import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class GestureDetectorWidget extends StatefulWidget {
  const GestureDetectorWidget({Key? key}) : super(key: key);

  @override
  State<GestureDetectorWidget> createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();


  String _operation = "No Gesture detected!"; //保存事件名

  double top = 0.0; //距顶部的偏移
  double left = 0.0;//距左边的偏移

  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  bool _toggle = false ;//变色开关

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('GestureDetector'),
          ),
          body: buildGestureRecognizer(),
    );
  }

  // 点击 双击 长按
  GestureDetector buildGestureTapLongPress() {
    return GestureDetector(
          onTap: (){
            updateText('onTap');
          },
          onDoubleTap: (){
            updateText('onDoubleTap');
          },
          onLongPress: (){
            updateText('onLongPress');
          },
          child: Center(
             child: Container(
               alignment: Alignment.center,
               color:AppColor.primaryColor,
               width: 200.0,
               height: 100.0,
               child:  Text(_operation,style: const TextStyle(color: Colors.white)),
             ),
          ),
        );
  }

  // 拖动、滑动
  Widget buildGestureTouchMove(){
      return  Stack(
         children: [
           Positioned(
               top: top,
               left: left,
               child: GestureDetector(
                 child: const CircleAvatar(child: Text("A")),
                 onTap: (){
                   print('点击了我');
                 },
                 //手指按下时会触发此回调
                 onPanDown: (DragDownDetails e) {
                   //打印手指按下的位置(相对于屏幕)
                   print("用户手指按下：${e.globalPosition}");
                 },
                 //手指滑动时会触发此回调
                 onPanUpdate: (DragUpdateDetails e) {
                   //用户手指滑动时，更新偏移，重新构建
                   print(e.delta.dx);//只是X轴移动的距离
                   print(e.delta.dy);//只是Y轴移动的距离
                   setState(() {
                     left += e.delta.dx;//这里要进行一个累加，否则无法进行拖动
                     top += e.delta.dy;//这里要进行一个累加，否则无法进行拖动
                   });
                 },
                 onPanEnd: (DragEndDetails e){
                   //打印滑动结束时在x、y轴上的速度
                   print(e.velocity);

                   // setState(() {
                   //   left = 0;//这里要进行一个累加，否则无法进行拖动
                   //   top =0;//这里要进行一个累加，否则无法进行拖动
                   // });
                 },
               ),
           )
         ],
      );
  }

  // 缩放
  Widget  buildGestureScale(){
      return Center(
         child: GestureDetector(
           //指定宽度，高度自适应
           child:Image.network('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',width: _width),
           //两个手指波动变大
           onScaleUpdate: (ScaleUpdateDetails details) {
             setState(() {
               //缩放倍数在0.8到10倍之间
               _width=200*details.scale.clamp(.8, 10.0);
             });
           },
         ),
      );
  }

  // GestureRecognizer 这个配合TextSpan富文本一起使用 这个也是经常用来富文本跳转
  Widget buildGestureRecognizer(){
      return Center(
        child: Text.rich(
           TextSpan(
             children:[
               const TextSpan(text:'你好世界'),
               TextSpan(text:"点击我变色",style: TextStyle(
                 fontSize: 30.0,
                 color: _toggle?Colors.blue:Colors.red,
               ),
                 recognizer:_tapGestureRecognizer..onTap=(){ //为级联操作,可以同时赋值执行方法
                       setState(() {
                         _toggle = !_toggle;
                       });
                 },
               ),
               const TextSpan(text:'你好世界')
             ]
           )
        ),
      );
  }

}
