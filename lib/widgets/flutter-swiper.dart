import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_os_china/pages/commonweb/index.dart';
class FlutterSwiperWidget extends StatefulWidget {
  final List<Map<String,dynamic>> imgList;
  const FlutterSwiperWidget({Key? key, required this.imgList}) : super(key: key);
  @override
  State<FlutterSwiperWidget> createState() => _FlutterSwiperWidgetState();
}

class _FlutterSwiperWidgetState extends State<FlutterSwiperWidget> {
  _navToWebPage(String title,String url){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> CommonWeb(title: title, url: url)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: double.infinity,
        height: 200,
        child: Swiper(
           //轮播图数量
           itemCount: widget.imgList.length,
           itemBuilder: (context,index){
             return GestureDetector(
                onTap: (){
                  _navToWebPage('博客详情',widget.imgList[index]['url']);
                },
                child:  Stack(
               children: [
                 Container(
                   // margin: const EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     // boxShadow: const [
                     //   BoxShadow(offset: Offset(1, 1), color: Colors.black12),
                     //   BoxShadow(offset: Offset(-1, -1), color: Colors.black12),
                     //   BoxShadow(offset: Offset(-1, 1), color: Colors.black12),
                     //   BoxShadow(offset: Offset(1, -1), color: Colors.black12),
                     // ],
                       borderRadius: BorderRadius.circular(2.0),
                       image: DecorationImage(image: NetworkImage(widget.imgList[index]['img']),fit: BoxFit.cover)
                   ),
                 ),
                 Align(
                   alignment: Alignment.center,
                   child: Container(
                     width: double.infinity,
                     height: 200,
                     color: const Color(0x21000000),
                     child: Center(
                       child: Text(widget.imgList[index]['title'], style: const TextStyle(color: Colors.white, fontSize:30.0)),
                     ),
                   ),
                 )
               ],
             ));
           },
          autoplay: true,
          fade: 0.0,
          scale: 0.0,
          curve: Curves.ease,
          duration: 600,
          autoplayDelay: 5000,
          pagination: const SwiperPagination(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30)
          ),
        ),
    );
  }
}
