import 'package:flutter/material.dart';


class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({Key? key}) : super(key: key);

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget> with SingleTickerProviderStateMixin  {

   late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //动画执行时间3秒
    animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 10),
    );
    animationController.forward();
    animationController.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinearProgressIndicator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
              .animate(animationController), // 从灰色变成蓝色
          // value: animationController.value,
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
        children: const [
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(height:20.0),
          LinearProgressIndicator(
            value: 0.8,
            backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          ),
          SizedBox(height: 10.0),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(height: 10.0),
          CircularProgressIndicator(
            value: 0.9,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            height: 10,
            child: LinearProgressIndicator(
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              value: 0.5,
            ),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            height: 100,
            width: 150,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          )

        ],
      );
  }
}
