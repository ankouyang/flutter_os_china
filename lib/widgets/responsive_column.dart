import 'package:flutter/material.dart';
class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;
  final tag;
  const ResponsiveColumn({Key? key, required this.children, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        assert(() {
          print('${tag ?? key}: $constraints');
          return true;
        }());

         print(constraints.maxWidth);
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: children
          );
        } else {
          // 大于200，显示双列
          var _children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {//这里是以2个为一对
            if (i + 1 < children.length) {
              _children.add(Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: [Expanded(flex: 1,child:children[i]), Expanded(flex:1,child: children[i + 1])],
              ));
            } else {
              _children.add(children[i]);
            }
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _children
          );
        }
      },
    );
  }
}