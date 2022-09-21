import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/clip_widget.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/padding_widget.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/decorated_box.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/transform.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/contaier_widget.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/fitted_box.dart';
import 'package:flutter_os_china/pages/drawer/containerWidget/scaffold_widget.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  Map<String,dynamic> widgetMap = const {
    'Padding': PaddingContainerWidget(),
    'DecoratedBox': DecoratedBoxWidgetData(),
    'Transform': TransformWidgetData(),
    'Container': CommonContainer(),
    'Clip': ClipWidgetData(),
    'FittedBox': FittedBoxWidget(),
    'Scaffold': ScaffoldMainWidget(),
  };

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('容器类组件'),
      ),
      body: ListViewItemWidget(listViewData: widgetMap),
    );
  }
}
