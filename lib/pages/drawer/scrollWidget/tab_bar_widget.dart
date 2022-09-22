import 'package:flutter/material.dart';
class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView'),
        bottom:  TabBar(
          controller: tabController,
          tabs: const [
            Text('内容1'),
            Text('内容2'),
            Text('内容3'),
          ],
        ),
      ),
      body:  TabBarView(
        controller: tabController,
        children:const  [
          Center(child: Text('内容1')),
          Center(child: Text('内容2')),
          Center(child: Text('内容3')),
        ],
      ),
    );
  }

  // buildDefaultTabController默认使用
  DefaultTabController buildDefaultTabController() {
    return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView'),
        bottom: const TabBar(
          tabs: [
            Text('内容1'),
            Text('内容2'),
            Text('内容3'),
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          Center(child: Text('内容1')),
          Center(child: Text('内容2')),
          Center(child: Text('内容3')),
        ],
      ),
    ));
  }
}
