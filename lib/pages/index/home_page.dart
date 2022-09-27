import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/index/discover_page.dart';
import 'package:flutter_os_china/pages/index/my_page.dart';
import 'package:flutter_os_china/pages/index/news_page.dart';
import 'package:flutter_os_china/pages/index/blog_page.dart';
import 'package:flutter_os_china/widgets/my_drawer.dart';
import 'package:flutter_os_china/widgets/navigation_icon_view.dart';
import '../../constants/constants.dart';
import '../../widgets/keep_alive_wrapper.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // bottomBarTitle
   final  _appBottomBarTitle = ['资讯','博客','发现','我的'];
  // 这里可以定义一个NavigationIconView Widgets类初始化赋值
   late  List<NavigationIconView> _navigationIconViews;
   //当前currentIndex
   int _currentIndex = 0;

   bool showToTopBtn = false;

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
      NavigationIconView(label: '博客', iconPath: 'assets/images/ic_nav_tweet_normal.png', activeIconPath: 'assets/images/ic_nav_tweet_actived.png'),
      NavigationIconView(label: '发现', iconPath: 'assets/images/ic_nav_discover_normal.png', activeIconPath: 'assets/images/ic_nav_discover_actived.png'),
      NavigationIconView(label: '我的', iconPath: 'assets/images/ic_nav_my_normal.png', activeIconPath: 'assets/images/ic_nav_my_pressed.png'),
    ];
   //初始化首页 Widget
   _homeWidget =[
      NewsPage( key: newsPageKey, changeContentCallBack: (flag){
        setState(() {
          showToTopBtn = flag;
        });
      }),
      BlogPage(),
      DiscoverPage(),
      MyPage(),
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
        // physics: NeverScrollableScrollPhy sics(),//禁止滑动
        itemBuilder:(BuildContext context, int index) { //使用pageView组件 需要使用 PageView.builder  并返回当前的组件
          return  KeepAliveWrapper(child:_homeWidget.elementAt(index));
          // return _homeWidget.elementAt(index);
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
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 1), curve:Curves.ease );
          },
          currentIndex: _currentIndex,
      ),
      drawer: MyDrawer(
        headImgPath: 'assets/images/cover_img.jpg',
        menuIcons: const [Icons.send,Icons.settings,Icons.widgets,Icons.layers_outlined,Icons.icecream,Icons.screen_lock_landscape_outlined,Icons.accessibility,Icons.event],
        menuTitles: const ['写帖子','设置','基础类组件','布局类组件','容器类组件','可滚动类组件','功能型组件','事件处理与通知']),
      floatingActionButton: showToTopBtn?FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          child:  const Icon(Icons.arrow_upward,color: Colors.white),
          onPressed: () {
            //使用newsPageKey 来调用子组件中方法
            print( newsPageKey.currentState?.scrollTopPos());
            // newsPageKey.currentState!.scrollTopPos();
          },
        ):null,
      );
  }
}
