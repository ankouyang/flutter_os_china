import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:path_provider/path_provider.dart';


class FileWidget extends StatefulWidget {
  const FileWidget({Key? key}) : super(key: key);

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
   int counter = 0;
   // 新增累计计算
   _incrementCounter() async {
     setState(() {
       counter++;
     });
     // 将点击次数以字符串类型写到文件中
     await (await getLocalFile()).writeAsString('$counter');
   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();//初始化
    //从文件读取点击次数
    readCounter().then((int value) {
      setState(() {
        counter = value;
      });
    });
  }

  //获取的本地文件
   Future<File> getLocalFile() async {
     // getApplicationDocumentsDirectory()  获取应用目录
     String dir = (await getApplicationDocumentsDirectory()).path;
     // 并在应用目录中写入相应的txt文件
     print(dir);
     return File('$dir/counter.txt');
   }

  //从文件中读取数量
   Future<int> readCounter() async {
     try {
       // 读取存储的文件
       File file = await getLocalFile();
       // 读取点击次数（以字符串）
       String contents = await file.readAsString();
       // 转化为init
       return int.parse(contents);
     } on FileSystemException {
       //出现错误的时候直接返回 0
       return 0;
     }
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
             title: const Text('文件操作'),
         ),
        body: Center(
           child: Text('$counter'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: _incrementCounter,
          tooltip: '新增',
          child: const Icon(Icons.add,color: Colors.white),
          ),
    );
  }
}

