import 'package:flutter/cupertino.dart';
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
        body:SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:   <Widget>[
                // Text('TextAlignleft',textAlign: TextAlign.left),
                // Text('TextAlignlCenter',textAlign: TextAlign.center),
                // const SizedBox(
                //  width: double.infinity,
                //  height: 30.0,
                //  child: Text('TextAlignRight',textAlign: TextAlign.right)
                // ),
                // SizedBox(
                //     width: double.infinity,
                //     height: 30.0,
                //     child: Text('设置最大行,超过就点点点' * 8,
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //     )
                // ),
                // const SizedBox(
                //     width: double.infinity,
                //     height: 30.0,
                //     child: Text('当前字体大小的缩放因子',
                //         textScaleFactor: 1.5
                //     )
                // ),
                // SizedBox(
                //     width: double.infinity,
                //     height: 30.0,
                //     child: Text('textStyle',
                //       style: TextStyle(
                //          color: Colors.red,
                //          fontFamily:'Courier',
                //          height: 1.5,
                //          background: Paint()..color=Colors.yellow,
                //          decoration:TextDecoration.lineThrough,
                //          decorationStyle: TextDecorationStyle.dashed
                //       ),
                //     )
                // ),
                // SizedBox(
                //     width: double.infinity,
                //     height: 30.0,
                //     child: RichText(
                //          text: TextSpan(
                //              children: [
                //                const TextSpan(
                //                    text:'home'
                //                ),
                //                TextSpan(
                //                  text:'https://flutterchina.club',
                //                  style: const TextStyle(
                //                    color: Colors.blue,
                //                  ),
                //                  recognizer: _tapRecognizer,//这这是一个手势
                //                  mouseCursor: SystemMouseCursors.precise,
                //                ),
                //              ]
                //          ),
                //   )
                //  ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 300,
                //   child: DefaultTextStyle(
                //     //1.设置文本默认样式
                //     style: const TextStyle(
                //       color:Colors.red,
                //       fontSize: 20.0,
                //     ),
                //     textAlign: TextAlign.start,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const <Widget>[
                //         Text("hello world"),
                //         Text("I am Jack"),
                //         Text("I am Jack",
                //           style: TextStyle(
                //               inherit: false, //2.不继承默认样式
                //               color: Colors.grey
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // ElevatedButton(
                //   child: const Text('normal'),
                //   onPressed: () {  },
                // ),
                // const TextButton(onPressed: null,
                //     child: Text('TextButton')
                // ),
                // const OutlinedButton(onPressed: null, child: Text('OutlinedButton')),
                // const IconButton(onPressed: null, icon: Icon(Icons.save)),
                //
                // ElevatedButton.icon(
                //     onPressed: null,
                //     icon: const Icon(Icons.send),
                //     label: const Text('发送')
                // ),
                // TextButton.icon(
                //     onPressed: null,
                //     icon: const Icon(Icons.info),
                //     label: const Text('详情')
                // ),
                // OutlinedButton.icon(
                //     onPressed: null,
                //     icon: const Icon(Icons.add),
                //     label: const Text('添加')
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 200.0,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(image: NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'))
                //   ),
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 200.0,
                //   child: const Image(
                //     image: AssetImage('assets/images/cover_img.jpg'),
                //   ),
                // ),
                // Container(
                //   width: double.infinity,
                //   height: 200.0,
                //   child: Image.asset('assets/images/cover_img.jpg'),
                // ),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                          Text('cover')
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          ),
                          Text('fill')
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                          ),
                          Text('contain')
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fitWidth,
                          ),
                          Text('fitWidth')
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fitHeight,
                          ),
                          Text('fitHeight')
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children:const [
                          Image(
                            image:NetworkImage('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.scaleDown,
                          ),
                          Text('scaleDown')
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   width: double.infinity,
                //   height: 200.0,
                //   child:  Image.network('https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF'),
                // )

              ]
          )
        )

    );
  }
}
