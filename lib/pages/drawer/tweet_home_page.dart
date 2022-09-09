import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TweetHomePage extends StatefulWidget {
  const TweetHomePage({Key? key}) : super(key: key);

  @override
  State<TweetHomePage> createState() => _TweetHomePageState();
}

class _TweetHomePageState extends State<TweetHomePage> {
  //这个要定义是单击 还是长按
   TapGestureRecognizer? _tapRecognizer;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = _handlePress;
  }

   _handlePress(){
     print('跳转');

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Column(
          children:   <Widget>[
            // Text('TextAlignleft',textAlign: TextAlign.left),
            // Text('TextAlignlCenter',textAlign: TextAlign.center),
            const SizedBox(
             width: double.infinity,
             height: 30.0,
             child: Text('TextAlignRight',textAlign: TextAlign.right)
            ),
            SizedBox(
                width: double.infinity,
                height: 30.0,
                child: Text('设置最大行,超过就点点点' * 8,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
            ),
            const SizedBox(
                width: double.infinity,
                height: 30.0,
                child: Text('当前字体大小的缩放因子',
                    textScaleFactor: 1.5
                )
            ),
            SizedBox(
                width: double.infinity,
                height: 30.0,
                child: Text('textStyle',
                  style: TextStyle(
                     color: Colors.red,
                     fontFamily:'Courier',
                     height: 1.5,
                     background: Paint()..color=Colors.yellow,
                     decoration:TextDecoration.lineThrough,
                     decorationStyle: TextDecorationStyle.dashed
                  ),
                )
            ),
            SizedBox(
                width: double.infinity,
                height: 30.0,
                child: RichText(
                     text: TextSpan(
                         children: [
                           const TextSpan(
                               text:'home'
                           ),
                           TextSpan(
                             text:'https://flutterchina.club',
                             style: const TextStyle(
                               color: Colors.blue,
                             ),
                             recognizer: _tapRecognizer,//这这是一个手势
                             mouseCursor: SystemMouseCursors.precise,
                           ),
                         ]
                     ),
              )
             ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: DefaultTextStyle(
                //1.设置文本默认样式
                style: const TextStyle(
                  color:Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text("I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
            )
        ]
        )
    );
  }
}
