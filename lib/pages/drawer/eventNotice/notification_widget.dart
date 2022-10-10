import 'package:flutter/material.dart';
import 'package:flutter_os_china/common//notification.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);
  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
        ),
        body: NotificationListener<MyNotification>(
            onNotification:(notification){
               setState(() {
                 _msg +=notification.msg + " ";
               });
               return true;
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /**
                   * 注意：代码中注释的部分是不能正常工作的，因为这个context是根Context，
                   * 而NotificationListener是监听的子树，所以我们通过Builder来构建ElevatedButton，来获得按钮位置的context。
                   *
                   */

                  // ElevatedButton(
                  //     onPressed: (){
                  //       return MyNotification("Hi").dispatch(context);
                  //     },  child: const Text("发通知"),
                  // ),
                  Builder(
                    builder: (context) {
                      return ElevatedButton(
                        //按钮点击时分发通知
                        onPressed: () => MyNotification("Hi").dispatch(context),
                        child: const Text("发送通知"),
                      );
                    },
                  ),
                  Text(_msg)
                ],
              ),
            )
        ),
    );
  }

  NotificationListener<Notification> buildNotificationListener() {
    return NotificationListener<ScrollEndNotification>(//NotificationListener
        onNotification:(notification){
          print(notification);
          return true;
        } ,
        child:ListView.builder(
            itemCount: 50,
            itemBuilder: (context,index){
              return  ListTile(title: Text('${index+1}')
              );
            }),
      );
  }
}
