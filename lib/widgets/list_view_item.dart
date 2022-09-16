import 'package:flutter/material.dart';

class ListViewItemWidget extends StatefulWidget {
  final Map  listViewData;
  const ListViewItemWidget({Key? key, required this.listViewData}) : super(key: key);

  @override
  State<ListViewItemWidget> createState() => _ListViewItemWidgetState();
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return ListTile(
            onTap:(){
              if(mounted){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>widget.listViewData.values.elementAt(index)));
              }
            },
            title: Text(widget.listViewData.keys.elementAt(index)),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18.0),
          );
        },
        separatorBuilder:(context,index){
          return const Divider();
        },
        itemCount: widget.listViewData.length);
  }
}
