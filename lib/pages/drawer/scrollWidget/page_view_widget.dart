import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {

  List<BottomNavigationBarItem>  navigationIconViews= const[
    BottomNavigationBarItem(icon: Icon(Icons.access_time,color: Colors.grey),activeIcon:Icon(Icons.access_time,color: AppColor.primaryColor),label: 'page1'),
    BottomNavigationBarItem(icon: Icon(Icons.accessibility_sharp,color: Colors.grey),activeIcon:Icon(Icons.accessibility_sharp,color: AppColor.primaryColor),label: 'page2'),
    BottomNavigationBarItem(icon: Icon(Icons.scale,color: Colors.grey),activeIcon:Icon(Icons.scale,color: AppColor.primaryColor),label: 'page3'),
    BottomNavigationBarItem(icon: Icon(Icons.access_alarm,color: Colors.grey),activeIcon:Icon(Icons.access_alarm,color: AppColor.primaryColor),label: 'page4'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_accessibility_sharp,color: Colors.grey),activeIcon:Icon(Icons.settings_accessibility_sharp,color: AppColor.primaryColor),label: 'page5'),
  ];
  int activeIndex = 0;

  // 定义各个滚PageView控制器
  late PageController  pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialPage初始化页面
    pageController = PageController(initialPage: activeIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    pageController.dispose();//一定要销毁 否则会造成内存溢出
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const Text('PageView'),
         ),
         body: PageView.builder(
             itemCount: 5,
             controller: pageController,
             scrollDirection: Axis.vertical,
             itemBuilder: (context,index){
               return   Container(
                   constraints: const BoxConstraints.expand(),
                   color: index%2 == 0?Colors.cyanAccent:Colors.red,
                   child:  Center(child: Text('page${index+1}',textScaleFactor: 5))
               );
             },
             onPageChanged: (int index){
                setState(() {
                  activeIndex = index;
                });
             },
         ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationIconViews,
        type:BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            activeIndex = index;
          });
          //滑动到指定的页面
          pageController.animateToPage(activeIndex,duration:const  Duration(milliseconds: 100),curve: Curves.ease);
        },
        currentIndex: activeIndex,
      ),
    );
  }

  //普通的PageView
  PageView buildPageView() {
    return PageView(
           scrollDirection: Axis.vertical,
           children: [
              Container(
                constraints: const BoxConstraints.expand(),
                color: Colors.cyanAccent,
                child: const Center(child: Text('page1',textScaleFactor: 5))
             ),
             Container(
                 constraints: const BoxConstraints.expand(),
                 color: Colors.red,
                 child: const Center(child: Text('page2',textScaleFactor: 5))
             ),
             Container(
                 constraints: const BoxConstraints.expand(),
                 color: Colors.blue,
                 child: const Center(child: Text('page3',textScaleFactor: 5))
             ),
             Container(
                 constraints: const BoxConstraints.expand(),
                 color: Colors.orange,
                 child: const Center(child: Text('page4',textScaleFactor: 5))
             ),
           ],
       );
  }
}
