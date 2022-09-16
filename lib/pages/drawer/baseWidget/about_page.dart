import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/my_font_icon.dart';
class AboutPage extends StatelessWidget {

  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: 0xe03e
    icons += "\uE03e";
// error:  0xe237
    icons += " \uE237";
// fingerprint: 0xe287
    icons += " \uE287";
    return Scaffold(
      appBar: AppBar(),
      // body: Text(
      //   icons,
      //   style: const TextStyle(
      //     fontFamily: "MaterialIcons",
      //     fontSize: 24.0,
      //     color: Colors.green,
      //   ),
      // ),
      body: Row(
        children: const [
          // Icon(Icons.accessible,color: Colors.green),
          // Icon(Icons.error,color: Colors.green,),
          // Icon(Icons.fingerprint,color: Colors.green),
          Icon(MyIcons.shafa,color: Colors.green),
          Icon(MyIcons.diannao,color: Colors.green),
          Icon(MyIcons.san,color: Colors.green),
        ],
      ),

    );
  }
}
