import 'package:flutter/material.dart';
class WillPopScopeWidget extends StatefulWidget {
  const WillPopScopeWidget({Key? key}) : super(key: key);

  @override
  State<WillPopScopeWidget> createState() => _WillPopScopeWidgetState();
}

class _WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  DateTime? _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('WillPopScope'),
        ),
        body: WillPopScope(
          onWillPop: () async{
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 1)) { //1秒内连续按两次返回键退出
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              return false;
            }
            return true;
          },
          child: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        )),
    );
  }
}
