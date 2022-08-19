
import 'package:flutter/material.dart';
import 'package:flutter_os_china/common/event_bus.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/utils/hex_Color_to_Color.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: Container(
        width:AppPhysicalSize().hcScreenWidth(),
        height: AppPhysicalSize().hcScreenHeight(),
        color:HexColor('#F5F5F5'),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 0.8,
                color: HexColor('#DCDCDC'),
              ),
              GestureDetector(
                child: Container(
                    height: 40.0,
                    color: Colors.white,
                    child:const Center(
                      child:  Text('退出登录'),
                    )
                ),
                onTap: ()  {
                  //退出登录,清空用户信息
                  DataUntils.clearLoginInfo().then((_){
                    //发布通知退出事件
                    eventBus.fire(LogOutEvent());
                    //并返回上一页
                    Navigator.pop(context);
                  });
                },
              ),
              Container(
                height: 0.8,
                color: HexColor('#DCDCDC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
