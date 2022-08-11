
import 'package:flutter/material.dart';
import 'package:flutter_os_china/widgets/navigation_icon_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // bottomBarTitle
   final  _appBottomBarTitle = ['资讯','动弹','发现','我的'];
  // 这里可以定义一个NavigationIconView Widgets类初始化赋值
   late  List<NavigationIconView> _navigationIconViews;
   //当前currentIndex
   int _currentIndex = 0;

   //切换不同的页面
   late  List<Widget>   _homeWidget;

   //这里需要引入PageView组件，需要先定义一个PageController来操PageView或者监听PageView
   late PageController  _pageController;

  //在初始化的是时候进行赋值
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化navigationIconViews
    _navigationIconViews = [
      NavigationIconView(label: '资讯', iconPath: 'assets/images/ic_nav_news_normal.png', activeIconPath: 'assets/images/ic_nav_news_actived.png'),
      NavigationIconView(label: '动弹', iconPath: 'assets/images/ic_nav_tweet_normal.png', activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(label: '发现', iconPath: 'assets/images/ic_nav_discover_normal.png', activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(label: '我的', iconPath: 'assets/images/ic_nav_my_normal.png', activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
   //初始化首页 Widget
   _homeWidget =[
      Container(color: Colors.red),
      Container(color: Colors.yellow),
      Container(color: Colors.blue),
      Container(color: Colors.green),
   ];

    //创建PageContoller控制器的实例,用来监听控制 pageView
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {

    //SafeArea 适配 刘海等异形屏
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,//去除阴影
        title:  Text(_appBottomBarTitle[_currentIndex],style: const TextStyle(fontSize: 18.0)),
      ),
      body: PageView.builder(
        // physics: NeverScrollableScrollPhysics(),//禁止滑动
        itemBuilder:(BuildContext context, int index) { //使用pageView组件 需要使用 PageView.builder  并返回当前的组件
          return    _homeWidget.elementAt(index);
        },
        itemCount:_homeWidget.length,//PageView的数量
        //控制器是当前的PageContoller控制器的实例,
        controller: _pageController,
          //滑动页面的回调
        onPageChanged:(index){
          //二次复制一定需要使用setState
          setState(() {
            _currentIndex =index;
          });
        }
      ),
      //底部Button
      bottomNavigationBar: BottomNavigationBar(
          items:_navigationIconViews.map((view) =>view.item).toList() ,//最终需要使用toList方法转化成List
          type:BottomNavigationBarType.fixed ,//让label文字显示出来
          onTap: (index){
            //点击时候也让其滑动到指定的页面
            _pageController.animateToPage(index, duration: Duration(milliseconds: 1), curve:Curves.ease );
          },
          currentIndex: _currentIndex,
      ),
      drawer:Drawer(),
    );
  }
}
