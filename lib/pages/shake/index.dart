import 'package:flutter/material.dart';
class ShakePage extends StatefulWidget {
  const ShakePage({Key? key}) : super(key: key);

  @override
  State<ShakePage>   createState() => _ShakePageState();
}

class _ShakePageState extends State<ShakePage> {
  bool isShaked = false;
  int _curentIndex = 0;

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('摇一摇'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/shake.png',
              width: 120.0,
              height: 120.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('摇一摇获取礼品'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: '礼品'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label:'资讯')
        ],
        currentIndex: _curentIndex,
        onTap: (index) {
          if (!mounted) return;
          setState(() {
            _curentIndex = index;
          });
        },
      ),
    );
  }
}
