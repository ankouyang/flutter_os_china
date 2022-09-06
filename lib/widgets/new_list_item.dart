import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewListItem extends StatefulWidget {
  final Map<String,dynamic>  newsList;
  const NewListItem({Key? key, required this.newsList}) : super(key: key);
  @override
  State<NewListItem> createState() => _NewListItemState();
}
class _NewListItemState extends State<NewListItem> {
  @override
  Widget build(BuildContext context) {
    //点击有波浪纹的效果
    return InkWell(
      onTap: (){
        print('跳转到对应的资讯列表');
        Fluttertoast.showToast(
            msg: '功能还未开放,敬请期待！',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black45,
            textColor: Colors.white,
            fontSize: 16.0);
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
                children: <Widget>[
                  Text(widget.newsList['author']),
                  const SizedBox(width: 5.0),
                  Text(widget.newsList['pubDate']),
                ],
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
