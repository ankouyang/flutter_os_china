import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/tweet_home_page.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/radio_group_widget.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/form.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/linear_progress_Indicator.dart';
import 'package:flutter_os_china/pages/drawer/baseWidget/about_page.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);
  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  Map<String,dynamic>   widgetMap=  const {
    '自定义Icon':AboutPage(),
    '图片':TweetHomePage(),
    'Form表单':FormWidget(),
    '单选开关和复选框':RadioGroup(),
    '进度指示器':LinearProgressWidget(),
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('基础类组件'),
        ),
         body: ListViewItemWidget(listViewData: widgetMap),
    );
  }
}
