import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/pages/newsDetail/index.dart';
class NewListItem extends StatefulWidget {
  final Map<String,dynamic>  newsList;
  final String type;
  final String title;
  const NewListItem({Key? key, required this.newsList, required this.type, required this.title}) : super(key: key);
  @override
  State<NewListItem> createState() => _NewListItemState();
}
class _NewListItemState extends State<NewListItem> {
  @override
  Widget build(BuildContext context) {

    var rowChildren = <Widget>[
      Text(widget.newsList['author']),
      const SizedBox(width: 5.0),
      Text(widget.newsList['pubDate']),
      const SizedBox(width: 8.0)
    ];
    if(widget.type =='blog'){
      rowChildren.add( Text(widget.newsList['type']==1?'原创':'转载',style: const TextStyle(fontSize: 15.0)));
    }
    //点击有波浪纹的效果
    return InkWell(
      onTap: (){
        if(mounted){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailPage(id:widget.newsList['id'], type:widget.type,title: widget.title)));
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  child: Text(
                      widget.newsList['title'],
                      style: const TextStyle(fontWeight:FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2
                  )
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: rowChildren,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.message,color: Color(0xffaaaaaa)),
                  const SizedBox(width: 3.0),
                  Text('${widget.newsList['commentCount']}')
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
