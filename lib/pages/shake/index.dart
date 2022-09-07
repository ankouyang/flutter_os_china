import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; //重力加速度
import 'package:vibration/vibration.dart';//手机震动
import 'package:shake_animation_widget/shake_animation_widget.dart';//图片文字抖动包
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';//音效
class ShakePage extends StatefulWidget {
  const ShakePage({Key? key}) : super(key: key);

  @override
  State<ShakePage>   createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage> {
  bool isShaked = false;
  int _curentIndex = 0;
      // StreamSubscription 是订阅Stream中的事件。
      // 当对Stream使用listen监听时，则返回一个StreamSubscription对象。
      // StreamSubscription是对当前Stream的监听产生的状态的管理对象，
      // 它能获取订阅事件的状态(是否被暂停)、订阅事件的取消、订阅事件的恢复以及保留用于处理事件的回调(onData,onDone,onError)

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  ///抖动动画控制器
  final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();
  //音效
  final _playerClickShake = AudioPlayer();//摇一摇
  final _playerClickResult = AudioPlayer();//结果
  // 定义本地音乐的路径
  final Map<String, String> audioAssets = {
    'result': 'https://img-qn.51miz.com/preview/sound/00/21/17/51miz-S211719-BB7E65D3-thumb.mp3',
    'shake': 'https://img-qn.51miz.com/preview/sound/00/23/25/51miz-S232594-1903B3DA-thumb.mp3',
  };

  @override
  void initState() {

    super.initState();
    // 检车手机是否抖动 我们监听重力减速度即可
    shakeListen();
    // 加载摇一摇音乐和结果音乐
    // _playerClickShake.setAudioSource(AudioSource.uri(Uri.parse(
    //     "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));



  }
  //摇手机监听
  shakeListen(){
    // 检车手机是否抖动 我们监听重力加速度即可
    _streamSubscriptions.add(
      //userAccelerometerEvents 重力加速度监听
      userAccelerometerEvents.listen((UserAccelerometerEvent   event) {
        //不受重力的影响
        // print(event);
        int value = 10;
        //这里只设置左右摇动 才算抖动  竖直方向摇动不触发
        if (event.x.abs() > value ||
            event.y.abs() > value){
          if(isShaked == false){
            // 摇一下之后 手机需要震动一下  这里需要一个第三方包
            _shakeAnimationController.start(shakeCount: 1);
            // 手机震动
            // Vibration.vibrate();
            // 先停止 摇一摇音乐和结果音乐，然后在开启摇一摇音乐
            _playerClickShake.setAudioSource(AudioSource.uri(Uri.parse(audioAssets['shake']!)));
            _playerClickShake.play();
            setState(() {
              isShaked = true;
            });

            Future.delayed(const Duration(seconds:2), () {
              _playerClickResult.setAudioSource(AudioSource.uri(Uri.parse(audioAssets['result']!)));
              _playerClickResult.play();
              //摇一摇的结果
              Fluttertoast.showToast(
                  msg: '亲,您未抽中礼物哦！',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0);

              if(_shakeAnimationController.animationRunging) {
                //停止抖动动画
                _shakeAnimationController.stop();
              }
                // isShaked 设置为false
                setState(() {
                  isShaked = false;
                });
            });
          }
        }
        },
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //取消监听
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    _playerClickShake.dispose();
    _playerClickResult.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('摇一摇'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildShakeAnimationWidget(),
            const SizedBox(
              height: 10.0,
            ),
            const Text('摇一摇获取礼品'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: '礼品'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label:'资讯')
        ],
        currentIndex: _curentIndex,
        onTap: (index) {
          if (!mounted) return;
          setState(() {
            _curentIndex = index;
            isShaked = false;
          });
        },
      ),
    );
  }
  ///构建抖动效果
  ShakeAnimationWidget buildShakeAnimationWidget() {
    return ShakeAnimationWidget(
      //抖动控制器
      shakeAnimationController: _shakeAnimationController,
      //微旋转的抖动
      shakeAnimationType: ShakeAnimationType.SkewShake,
      //设置不开启抖动
      isForward: false,
      //默认为 0 无限执行
      shakeCount: 0,
      //抖动的幅度 取值范围为[0,1]
      shakeRange: 0.6,
      //执行抖动动画的子Widget
      child:  Image.asset(
        'assets/images/shake.png',
        width: 120.0,
        height: 120.0,
      ),
    );
  }
}
