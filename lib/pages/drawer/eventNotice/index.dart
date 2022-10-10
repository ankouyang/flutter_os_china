import 'package:flutter/material.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
import 'package:flutter_os_china/pages/drawer/eventNotice/listener_widget.dart';
import 'package:flutter_os_china/pages/drawer/eventNotice/gesture_detector_widget.dart';
import 'package:flutter_os_china/pages/drawer/eventNotice/notification_widget.dart';

class EventNotice extends StatefulWidget {
  const EventNotice({Key? key}) : super(key: key);

  @override
  State<EventNotice> createState() => _EventNoticeState();
}

class _EventNoticeState extends State<EventNotice> {

  Map<String,dynamic> widgetMap = const {
      'ListenerWidget':ListenerWidget(),
      'GestureDetector':GestureDetectorWidget(),
      'Notification':NotificationWidget(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('事件处理与通知'),
        ),
        body: ListViewItemWidget(listViewData: widgetMap)
    );


  }
}
