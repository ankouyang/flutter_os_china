import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);
  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  //定义一个ScrollController
  ScrollController scrollController = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //滚动监听
    scrollController.addListener(() {
      // scrollController.jumpTo(100);
      // scrollController.jumpTo(600);
      print(scrollController.offset); //打印滚动位置
      if (scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          //调用父组件传递的方法
          showToTopBtn = false;
        });
      } else if (scrollController.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          //调用父组件传递的方法
          showToTopBtn = true;
        });
      }

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    //要销毁
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const  Text('ListView'),
         ),
         body: buildListViewSeparated(),
         floatingActionButton: showToTopBtn?FloatingActionButton(
           backgroundColor: AppColor.primaryColor,
           child:  const Icon(Icons.arrow_upward,color: Colors.white),
           onPressed: () {
             // scrollController.jumpTo(0.0);
             scrollController.animateTo(
                 0.0,
                 duration: const Duration(milliseconds: 200),//动画持续时间
                 curve: Curves.linear,//动画方式
             );
           },
         ):null

    );
  }

  // ListView.separated
  ListView buildListViewSeparated() {
    return ListView.separated(
           controller: scrollController,
           itemBuilder: (context,index){
             return ListTile(title: Text('$index'),trailing: const Icon(Icons.arrow_forward_ios),onTap: (){},);
           },
           separatorBuilder: (context,index){
             return index%2==0?const Divider(color: Colors.green):const Divider(color: Colors.blue);
           },
           itemCount: 100,
       );
  }

  // ListView.builder
  ListView buildListViewBuilder() {
    return ListView.builder(
           itemCount: 100,//这里demo设置为100
           itemExtent: 80.0,//强制高度为50
           itemBuilder:(context,index){
            return ListTile(title: Text('$index'),trailing: const Icon(Icons.arrow_forward_ios),onTap: (){},);
          });
  }
}
