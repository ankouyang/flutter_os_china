import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: const Text('GridView'),
         ),
         body: GridView.builder(
             itemCount: 50,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               childAspectRatio: 1.0
             ),
             itemBuilder: (context,index){
               return  ListTile(title: Text('${index+1}'));
             }
         )
    );
  }

  GridView buildGridCountView() {
    return GridView.count(
         crossAxisCount: 3,
         childAspectRatio: 1.0,
         children: const <Widget>[
           Icon(Icons.ac_unit),
           Icon(Icons.airport_shuttle),
           Icon(Icons.all_inclusive),
           Icon(Icons.beach_access),
           Icon(Icons.cake),
           Icon(Icons.free_breakfast),
         ],
       );
  }





  GridView buildGridMaxAxisExtentView() {
    return GridView(
         padding: EdgeInsets.zero,
         gridDelegate:const  SliverGridDelegateWithMaxCrossAxisExtent(
             maxCrossAxisExtent: 120.0,
             childAspectRatio: 2.0 //宽高比为2
         ),
         children: const <Widget>[
           Icon(Icons.ac_unit),
           Icon(Icons.airport_shuttle),
           Icon(Icons.all_inclusive),
           Icon(Icons.beach_access),
           Icon(Icons.cake),
           Icon(Icons.free_breakfast),
         ],
       );
  }

  GridView buildGridfixedAisCountView() {
    return GridView(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3, //横轴三个子widget
               crossAxisSpacing: 60,//横轴方向子元素的间距
               childAspectRatio: 1.0, //宽高比为1时，子widget
           ),
           children:const <Widget>[
             Icon(Icons.ac_unit),
             Icon(Icons.airport_shuttle),
             Icon(Icons.all_inclusive),
             Icon(Icons.beach_access),
             Icon(Icons.cake),
             Icon(Icons.free_breakfast)
           ]
       );
  }
}

