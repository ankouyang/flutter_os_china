import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart'  hide Text ;
class FlutterQuill extends StatefulWidget {
  const FlutterQuill({Key? key}) : super(key: key);

  @override
  State<FlutterQuill> createState() => _FlutterQuillState();
}

class _FlutterQuillState extends State<FlutterQuill> {
  final QuillController _controller = QuillController.basic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听flutter_quill
    _controller.addListener(() {
      // print(_controller.document.toDelta());
      var json = jsonEncode(_controller.document.toDelta());
      print(json);
    });


  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        QuillToolbar.basic(controller: _controller),
        Expanded(
          child: QuillEditor.basic(
            controller: _controller,
            readOnly: false, // true for view only mode
          ),
        )
      ],
    );
  }
}
