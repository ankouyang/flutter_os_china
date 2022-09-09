import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart'  hide Text ;
class FlutterQuill extends StatefulWidget {
  //  定义一个ValueChanged 父组件的回调方法
  final ValueChanged<String>  changeContentCallBack;
  const FlutterQuill({Key? key, required this.changeContentCallBack}) : super(key: key);

  @override
  State<FlutterQuill> createState() => _FlutterQuillState();
}

class _FlutterQuillState extends State<FlutterQuill> {
   QuillController _controller = QuillController.basic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听flutter_quill
    _controller.addListener(() {
      // print(_controller.document.toDelta());
      var json = jsonEncode(_controller.document.toDelta().toJson());
      //监听富文本内容的变化
      widget.changeContentCallBack(json);
    });

    setState(() {
      // 这个用于数据回显
      // dynamic  jsonString = jsonEncode([{"insert":"我就是我颜色不一样的烟火\n"}]);
      // var myJSON = jsonDecode(jsonString);
      // _controller = QuillController(document: Document.fromJson(myJSON), selection: const TextSelection.collapsed(offset: 0));
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
