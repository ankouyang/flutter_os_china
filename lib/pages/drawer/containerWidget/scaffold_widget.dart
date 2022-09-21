import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class ScaffoldMainWidget extends StatefulWidget {
  const ScaffoldMainWidget({Key? key}) : super(key: key);

  @override
  State<ScaffoldMainWidget> createState() => _ScaffoldMainWidgetState();
}

class _ScaffoldMainWidgetState extends State<ScaffoldMainWidget> {
  List<BottomNavigationBarItem>  bottomNavigationBarItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.school),label: 'School'),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return buildBottomAppBarScaffold();
  }

  Scaffold buildBottomNavigationBarScaffold() {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Scaffold 骨架屏'
          ),
          actions: [
            //右边分享图标
            IconButton(
              onPressed: () {
                print('分享');
              },
              icon:const Icon(Icons.share),
            )
          ],
        ),
        // 抽屉
        drawer:const Drawer(

        ),
        bottomNavigationBar:BottomNavigationBar(
          items: bottomNavigationBarItem,
          onTap:(index){
            setState(() {
              activeIndex = index;
            });
          } ,
          currentIndex: activeIndex,

        ) ,
        floatingActionButton: FloatingActionButton(
         backgroundColor: AppColor.primaryColor,
         onPressed: () {  },
         child: const Icon(Icons.add,color: Colors.white),
       ),
     );
  }

  Scaffold buildBottomAppBarScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Scaffold 骨架屏'
        ),
        actions: [
          //右边分享图标
          IconButton(
            onPressed: () {
              print('分享');
            },
            icon:const Icon(Icons.share),
          )
        ],
      ),
      // 抽屉
      drawer:const Drawer(

      ),
      bottomNavigationBar: BottomAppBar(
            elevation:10.0,
             color: Colors.white,
            shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,//图标是左右布局的方式
              children:  [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: IconButton(icon:const Icon(Icons.home,size: 32.0,color: Colors.grey), onPressed: () {
                         print('主页');
                    }),
                ),
                const SizedBox(),//中间位置空出来
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child:  IconButton(icon:const Icon(Icons.business,size: 32.0,color: Colors.grey), onPressed: () {
                    print('商务');
                  }),
                ),

              ],
            ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {  },
        child: const Icon(Icons.add,color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
