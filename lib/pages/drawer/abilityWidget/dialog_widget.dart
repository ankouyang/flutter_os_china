import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
import 'package:address_picker/address_picker.dart';
class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);
  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  //点击触发AlertDialog弹窗动作，使用showDialog()触发
  Future  goToAlertDialog() async{
   var  result =   await showDialog(context: context, builder: (context){
        return   AlertDialog(
          title: const Text('温馨提示') ,
          content: const Text('您确定要删除当前文件吗'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
             child: const Text('取消')
            ),
            TextButton(
                onPressed: (){
                Navigator.pop(context,true);
             },
                child: const Text('确定',style: TextStyle(color: Colors.blue),)
            )
          ],
        );
    });

    if(result){
      print('删除成功');
    }
  }

  //点击触发Loading弹窗动作，使用showDialog()触发
  Future  goToLoadingDialog() async{
    var  result =   await showDialog(
         barrierDismissible:true,
         context: context,
         builder: (context){
      return   AlertDialog(
        content: SizedBox(
           width: 120,
           height: 100,
           child: Column(
             children: const [
               CircularProgressIndicator(),
               Padding(
                 padding: EdgeInsets.only(top: 26.0),
                 child: Text("正在加载，请稍后..."),
               )
             ],
           ),
        ),
      );
    });

    if(result){

    }
  }



  //点击触发SimpleDialog弹窗动作，使用showDialog()触发
  Future  goToSimpleDialog() async{
    var  result =   await showDialog(context: context, builder: (context){
      return    SimpleDialog(
        title: const Text('请选择语言') ,
        children: [
          SimpleDialogOption(
            onPressed: (){
               Navigator.pop(context,1);
            },
            child: const Text('中文简体'),

          ),
          SimpleDialogOption(
            onPressed: (){
              Navigator.pop(context,2);
            },
            child: const Text('西班牙语'),
          ),
        ],
      );
    });
   print(result);
  }

  //点击触发Dialog弹窗动作 使用showDialog()触发
  Future  goToDialog() async{
    var  result =   await showDialog(context: context, builder: (context){
      return     Dialog(
         child: ListView.separated(
             itemBuilder: (context,index){
               return  ListTile(title: Text('${index+1}'));
             },
             separatorBuilder: (context,index){
               return const Divider();
             },
             itemCount: 5
          ),
      );
    });
    print(result);
  }


  // 弹出底部菜单列表模态对话框  使用showModalBottomSheet方法触发
  Future _showModalBottomSheet() async {
    var  result = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.pop(context,index),
            );
          },
        );
      },
    );

    print(result);

  }


  // 弹出底部菜单列表模态对话框  使用showModalBottomSheet方法触发
  Future _showModalBottomPicker() async {
    var  result = await showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return BottomSheet(
            onClosing:(){
              print("关闭");
            },
            builder: (context){
              return SizedBox(
                height: 250.0,
                child: AddressPicker(
                  style: const TextStyle(color: Colors.black,fontSize: 17),
                    mode: AddressPickerMode.provinceAndCity,
                    onSelectedAddressChanged: (address) {
                      print('${address.currentProvince.province}');
                      print('${address.currentCity.city}');
                      print('${address.currentDistrict.area}');
                    },
                ),
              );
            }
        );
      },
    );

    // print(result);

  }




  // 使用日历选择器触发(安卓风格)
  Future  _showDatePicker() async {
    dynamic date = DateTime.now();//选择现在时间
    DateTime ?  result = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        const Duration(days: 30),
      ),
    );

    print(result);
    // if(result){
    //   print(result);
    // }
  }

// 使用日历选择器触发(IOS风格)
  Future  _showDatePickerIos() async {
    dynamic date = DateTime.now();//选择现在时间
   await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return  Container(
          height: 200,
          color: Colors.white,
          child:CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              const Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ) ,
        );
      },
    );
    // if(result){
    //   print(result);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('对话框详解'),
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(onPressed: goToSimpleDialog, child: const Text('SimpleDialog')),
                ElevatedButton(onPressed: goToDialog, child: const Text('Dialog')),
                ElevatedButton(onPressed: goToAlertDialog, child: const Text('AlertDialog')),
                ElevatedButton(onPressed: _showModalBottomSheet, child: const Text('showModalBottomSheet')),
                ElevatedButton(onPressed: goToLoadingDialog, child: const Text('loading')),
                ElevatedButton(onPressed: _showDatePicker, child: const Text('dateTime')),
                ElevatedButton(onPressed: _showDatePickerIos, child: const Text('dateTimeIos')),
                ElevatedButton(onPressed: _showModalBottomPicker, child: const Text('bottomPicker'))
              ],
            ),
          ),
    );
  }
}
