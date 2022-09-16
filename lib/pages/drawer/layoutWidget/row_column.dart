import 'package:flutter/material.dart';
class RowColumnWidget extends StatefulWidget {
  const RowColumnWidget({Key? key}) : super(key: key);

  @override
  State<RowColumnWidget> createState() => _RowColumnWidgetState();
}

class _RowColumnWidgetState extends State<RowColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row和Column'),
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text("hi"),
            Text("world"),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const  <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: const <Widget>[
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: const <Widget>[
              Text(" hello world ", style: TextStyle(fontSize: 30.0),),
              Text(" I am Jack "),
            ],
          ),
        ],
      ),
    );
  }
}
