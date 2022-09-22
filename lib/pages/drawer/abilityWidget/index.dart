import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/abilityWidget/will_pop_scope.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';

class AbilityWidget extends StatefulWidget {
  const AbilityWidget({Key? key}) : super(key: key);

  @override
  State<AbilityWidget> createState() => _AbilityWidgetState();
}

class _AbilityWidgetState extends State<AbilityWidget> {
  Map<String,dynamic> widgetMap = const {
    'WillPopScopeWidget': WillPopScopeWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('功能型组件'),
      ),
      body: ListViewItemWidget(listViewData: widgetMap),
    );
  }
}
