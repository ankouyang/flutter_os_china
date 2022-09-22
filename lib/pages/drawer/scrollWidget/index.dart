import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/list_view_widget.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/single_child_scroll_view.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/animated_list_widget.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/grid_view_widget.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/page_view_widget.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/tab_bar_widget.dart';
import 'package:flutter_os_china/pages/drawer/scrollWidget/custom_scroll_view.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
class ScrollWidget extends StatefulWidget {
  const ScrollWidget({Key? key}) : super(key: key);

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  Map<String,dynamic> widgetMap = const {
    'SingleChildScrollView': SingleChildScrollWidget(),
    'ListView': ListViewWidget(),
    'AnimatedList': AnimatedListWidgetData(),
    'GridView': GridViewWidget(),
    'PageView': PageViewWidget(),
    'TabBar': TabBarWidget(),
    'CustomScrollView': CustomScrollViewWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('可滚动类组件'),
      ),
      body: ListViewItemWidget(listViewData: widgetMap),
    );
  }
}
