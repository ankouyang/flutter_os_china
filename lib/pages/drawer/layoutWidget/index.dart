import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/layoutWidget/row_column.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
import 'package:flutter_os_china/pages/drawer/layoutWidget/constrained-box.dart';
class LayoutWidget extends StatefulWidget {
  const LayoutWidget({Key? key}) : super(key: key);

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  Map<String,dynamic> widgetMap = const {
    'BoxConstraints限制': ConstrainedBoxWidget(),
    'Row和Column': RowColumnWidget(),
  };

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('布局类组件'),
      ),
      body: ListViewItemWidget(listViewData: widgetMap),
    );
  }
}
