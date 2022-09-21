import 'package:flutter/material.dart';

class FlexLayoutWidget extends StatefulWidget {
  const FlexLayoutWidget({Key? key}) : super(key: key);

  @override
  State<FlexLayoutWidget> createState() => _FlexLayoutWidgetState();
}

class _FlexLayoutWidgetState extends State<FlexLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flex_layout'),
      ),
      body: Column(
         children: [
           Flex(
             direction:Axis.horizontal ,//水平方向
             children: [
               Expanded(
                   flex:1,
                   child:Container(
                     height: 50,
                     color: Colors.cyanAccent,
                     child: const Center(
                       child: Text('占比是1'),
                     ),
                   )
               ),
               Expanded(
                   flex:2,
                   child:Container(
                     height: 50,
                     color: Colors.red,
                     child:   const Center(
                       child: Text('占比是2'),
                     ),
                   )
               )
             ],
           ),
           Padding(
             padding: const EdgeInsets.only(top: 30),
             child: SizedBox(
               height: 100,
               child: Flex(
                  direction: Axis.vertical,//竖直
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
               ),
             )
           )
         ],
      )
    );
  }
}
