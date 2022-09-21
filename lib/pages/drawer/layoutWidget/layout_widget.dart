import 'package:flutter/material.dart';
import 'package:flutter_os_china/widgets/responsive_column.dart';

class LayoutBuilderWidget extends StatefulWidget {
  const LayoutBuilderWidget({Key? key}) : super(key: key);

  @override
  State<LayoutBuilderWidget> createState() => _LayoutBuilderWidgetState();
}

class _LayoutBuilderWidgetState extends State<LayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayoutBuilder AfterLayout'),
      ),
      body:ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child:  buildResponsiveColumn(),
      ),
    );
  }

  ResponsiveColumn buildResponsiveColumn() {
    return ResponsiveColumn(
          children: [
            Container(
                height: 50,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 10.0),
                child:const Center(child: Text('1'))
            ),
            Container(
                height: 50,
                color: Colors.blue,
                margin: const EdgeInsets.only(bottom: 10.0),
                child:const Center(child: Text('2'))
            ),
            Container(
                height: 50,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 10.0),
                child:const Center(child: Text('1'))
            ),
            Container(
                height: 50,
                color: Colors.blue,
                margin: const EdgeInsets.only(bottom: 10.0),
                child:const Center(child: Text('2'))
            ),

      ]);
  }
}
