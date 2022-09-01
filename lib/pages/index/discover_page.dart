import 'package:flutter/material.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // 先定义一个List,定义好名称和icon
  List<Map<String,IconData>> blocks = [
    {
      '开源众包':Icons.pageview,
      '开源软件':Icons.speaker_notes_off,
      '代码推荐':Icons.screen_share,
      '代码骗贷':Icons.assessment,
    },
    {
      '扫一扫':Icons.camera_alt,
      '摇一摇':Icons.camera,
    },
    {
      '码云封面人物':Icons.person,
      '线下活动':Icons.android,

    },
  ];

  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: '开灯');
  final _flashOffController = TextEditingController(text: '关灯');
  final _cancelController = TextEditingController(text: '取消');
  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  // 调用原生的扫一扫
  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      print('二维码结果');
      print(result.rawContent);
      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }
  void _handleItemClick(String title) {
    switch (title) {
      case '开源众包':
        // _navToWebPage(title, 'https://zb.oschina.net/');
        break;
      case '扫一扫':
        _scan();
        break;
      case '摇一摇':
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ShakePage()));
        break;
    }
  }

  _navToWebPage(String title,String url){
    // if(title!=null&&url!=null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>{})
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:blocks.length ,
        itemBuilder: (context,blockIndex){
         return  Container(
           //height: 200.0,
            // color: const Color(0xffff0000),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration:  BoxDecoration(
             color: Colors.white,
             // borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // border:  Border.all(width: 0, color: Colors.red,),
              boxShadow:[
                BoxShadow(
                    color:const Color(0xffaaaaaa).withOpacity(0.2),
                    offset: const Offset(0.0, 5.0), //阴影y轴偏移量
                    blurRadius: 5, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                )
              ]
              // border: Border(
              //   top: BorderSide(
              //     width: 1.0,
              //     color: Color(0xffaaaaaa)
              //   ),
              //   bottom: BorderSide(
              //     width: 1.0,
              //     color: Color(0xffaaaaaa)
              //     )
              // )
            ),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,mapIndex){
                   // InkWell 具有水波纹的效果
                    return InkWell(
                      onTap:(){
                       //跳转
                        _handleItemClick(blocks[blockIndex].keys.elementAt(mapIndex));
                      },
                      child:SizedBox(
                        height: 60.0,
                        child: ListTile(
                           leading: Icon(blocks[blockIndex].values.elementAt(mapIndex)),//取出具体value
                           title:Text(blocks[blockIndex].keys.elementAt(mapIndex)), //取出具体key
                           trailing: const Icon(Icons.arrow_forward_ios,size: 15.0),
                        ),
                      ) ,
                    );
                },
                separatorBuilder:(context,mapIndex){
                      return const Divider(
                        height: 2.0,
                        color: Color(0xffaaaaaa),
                      );
                },
                itemCount: blocks[blockIndex].length
            )
         );
    });
  }
}
