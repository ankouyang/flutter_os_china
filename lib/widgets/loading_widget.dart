import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppColor;
import 'package:flutter_os_china/constants/enum_data.dart';

class LoadingWidget extends StatefulWidget {
   String loadText;
   dynamic loadStatus;
   LoadingWidget({Key? key,required this.loadText,required this.loadStatus}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    var  loadingTextStyle = const TextStyle(color: AppColor.primaryColor,fontSize: 14.0);
    Widget  loadingText = Text(widget.loadText,style:loadingTextStyle);
    Widget   loadingIndicator =  Visibility(
        visible:widget.loadStatus == LoadingStatus.statusLoading?true:false,
        child: const SizedBox(
          width: 15.0,
          height: 15.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColor.primaryColor),
          ),
        )
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          loadingIndicator,
          const SizedBox(width: 5.0),
          loadingText,
        ],
      ),
    );
  }
}
