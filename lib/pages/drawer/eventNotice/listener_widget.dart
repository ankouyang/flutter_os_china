import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';


class ListenerWidget extends StatefulWidget {
  const ListenerWidget({Key? key}) : super(key: key);

  @override
  State<ListenerWidget> createState() => _ListenerWidgetState();
}

class _ListenerWidgetState extends State<ListenerWidget> {
   PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listener '),
        ),
        body: Center(
          child: Listener(
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          ),
        )
    );
  }

  Listener buildListener() {
    return Listener(
          child: Container(
            alignment: Alignment.center,
            color: AppColor.primaryColor,
            height: 150.0,
            width: 300.0,
            child: Text('${_event?.localPosition??''}',style: const TextStyle(color: Colors.white),),
          ),
          onPointerDown: (e){
            setState(() {
              _event =e;
            });
          },
          onPointerMove: (e){
            setState(() {
              _event =e;
            });
          },
          onPointerUp: (e){
            setState(() {
              _event =e;
            });
          },
        );
  }
}
