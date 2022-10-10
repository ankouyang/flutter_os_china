import 'package:flutter/material.dart';
import 'package:flutter_os_china/widgets/list_view_item.dart';
import 'package:flutter_os_china/pages/drawer/fileAction/file_widget.dart';
import 'package:flutter_os_china/pages/drawer/fileAction/http_client.dart';

class FileAction extends StatefulWidget {
  const FileAction({Key? key}) : super(key: key);

  @override
  State<FileAction> createState() => _FileActionState();
}

class _FileActionState extends State<FileAction> {

  Map<String,dynamic> widgetMap = const {
    '文件操作':FileWidget(),
    'HttpClient':HttpClientWidget(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('文件操作和网络请求'),
        ),
        body: ListViewItemWidget(listViewData: widgetMap)
    );


  }
}