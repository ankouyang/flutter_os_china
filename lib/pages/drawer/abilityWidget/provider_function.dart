import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_os_china/models/provider_model.dart';
import 'package:flutter_os_china/models/provider_other.dart';
class ProviderWidget extends StatefulWidget {
  const ProviderWidget({Key? key}) : super(key: key);

  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {


  @override
  Widget build(BuildContext context) {
    MyModel info = Provider.of<MyModel>(context);
    OtherModel sex = Provider.of<OtherModel>(context);
    return Scaffold(
       appBar: AppBar(
         title: const Text('Provider的使用'),
       ),
      body: Column(
        children: [
          Text(info.name),
          Text(sex.sex),
        ],
      ),
    );
  }
}
