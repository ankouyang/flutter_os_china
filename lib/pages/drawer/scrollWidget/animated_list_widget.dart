import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class AnimatedListWidgetData extends StatefulWidget {
  const AnimatedListWidgetData({Key? key}) : super(key: key);

  @override
  State<AnimatedListWidgetData> createState() => _AnimatedListWidgetDataState();
}

class _AnimatedListWidgetDataState extends State<AnimatedListWidgetData> {

  //先定义一个List
  List<String> data = <String>[];
  int counter = 5;

  final  globalListKey = GlobalKey<AnimatedListState>();
  
  @override
  void initState() {
    // TODO: implement initState
    
    for(var i=0;i<counter;i++){
      data.add('${i+1}');
    }
    
    super.initState();
  }

   onDelete(context, index) {
    // 待实现
     setState(() {
       globalListKey.currentState!.removeItem(
         index,
             (context, animation) {
           // 删除过程执行的是反向动画，animation.value 会从1变为0
           var item = buildListTile(index, context);
           print('删除 ${data[index]}');
           data.removeAt(index);
           // 删除动画是一个合成动画：渐隐 + 缩小列表项告诉
           return FadeTransition(
             opacity: CurvedAnimation(
               parent: animation,
               //让透明度变化的更快一些
               curve: const Interval(0.5, 1.0),
             ),
             // 不断缩小列表项的高度
             child: SizeTransition(
               sizeFactor: animation,
               axisAlignment: 0.0,
               child: item,
             ),
           );
         },
         duration: const Duration(milliseconds: 200), // 动画时间为 200 ms
       );
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const Text('AnimatedList'),
         ),
         body: AnimatedList(
           key:globalListKey ,
           initialItemCount: data.length,
           itemBuilder: (
               BuildContext context,
               int index,
               Animation<double> animation
               ) {
                  // 添加列表项时会执行渐显动画
                  return  FadeTransition(
                    opacity: animation,
                    child: buildListTile(index, context),
                  );
               },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            child: const Icon(Icons.add,color: Colors.white),
            onPressed: () {
              // 添加一个列表项
              data.add('${++counter}');
              // 告诉列表项有新添加的列表项
              globalListKey.currentState!.insertItem(data.length - 1);
              // print(globalListKey.currentState!.insertItem());

            },
          ),
    );
  }

  ListTile buildListTile(int index, BuildContext context) => ListTile(key:  ValueKey(data[index]),title: Text('${index+1}'),trailing: IconButton(icon:const Icon(Icons.delete), onPressed: ()=>onDelete(context,index)));
}
