import 'package:flutter/material.dart';
class ConstrainedBoxWidget extends StatefulWidget {
  const ConstrainedBoxWidget({Key? key}) : super(key: key);

  @override
  State<ConstrainedBoxWidget> createState() => _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BoxConstraints'),
          actions: const  [
            UnconstrainedBox(
              // child: Text('xx' * 30),
              child:SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  valueColor:AlwaysStoppedAnimation( Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // ConstrainedBox(
            //   constraints: const BoxConstraints(
            //       minHeight: 80.0
            //   ),
            //   child: Container(
            //     height: 1.0,
            //     color: Colors.cyanAccent,
            //   ),
            // ),
            // SizedBox(
            //   width: 100,
            //   height: 100,
            //   child: Container(
            //     color: Colors.red,
            //   ),
            // ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints.tightFor(width: 100,height: 100),
            //   child: Container(
            //     color: Colors.red,
            //   ),
            // )
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxHeight: 100,minHeight: 100,maxWidth: 100,minWidth: 100),
            //   child: Container(
            //     color: Colors.red,
            //   ),
            // )

            // ConstrainedBox(
            //   constraints: const BoxConstraints(minWidth: 90.0, minHeight:20.0), //父
            //   child: ConstrainedBox(
            //     constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0),//子
            //     child: Container(
            //       width: 50.0,
            //       height: 1.0,
            //       color: Colors.red,
            //     ),
            //   ),
            // )
            
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60.0,minHeight: 100.0),
                child: UnconstrainedBox(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 90.0,minHeight: 20.0),
                    child: Container(
                      width:20,
                      height: 10,
                      color: Colors.red,
                    ),
                  ),
                ),
            )
            

          ],
        )

    );
  }
}
