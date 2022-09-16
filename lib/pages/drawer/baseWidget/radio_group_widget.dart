import 'package:flutter/material.dart';
import 'package:flutter_os_china/constants/constants.dart';
class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);
  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  bool switchValue = false;
  String switchLabel ='关';
  String checkboxLabel ='未选中';
  bool checkboxValue = false;
  dynamic  groupValue = 1;


  List  checkBoxList = [true,false,false];

  List<Widget>  checkBoxListFn(){
    List<Widget> widget = [];
    for(int i =0;i< checkBoxList.length;i++){
      widget.add(buildCheckboxListTile(checkBoxList[i],i));

    }
    return  widget;
  }

  List  radioList  = [1,2,3,4];

  List<Widget>  radioListFn(){
    List<Widget> widget = [];
    for(int i =0;i< radioList.length;i++){
      widget.add(buildRow(i));

    }
    return  widget;
  }





  void _onChangedSwitch(val){
     setState(() {
       switchValue = val;
       switchLabel = val?'开':'关';
     });
  }
  void _onChangedCheckbox(val){
    setState(() {
      checkboxValue = val;
      checkboxLabel =  val?'选中':'未选中';
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox and Switch'),
      ),
      body: Column(
        // children:  [
        //   Row(
        //     children: [
        //       Switch(value: switchValue, onChanged:_onChangedSwitch,activeColor:AppColor.primaryColor),
        //       Text(switchLabel,style: TextStyle(color: switchValue?AppColor.primaryColor:Colors.black)),
        //     ],
        //   ),
        //   Row(
        //     children: [
        //       Checkbox(value: checkboxValue, onChanged: _onChangedCheckbox,activeColor: AppColor.primaryColor),
        //       Text(checkboxLabel,style: TextStyle(color: checkboxValue?AppColor.primaryColor:Colors.black)),
        //     ],
        //   ),
        //
        //   buildRow(1),
        //   buildRow(2),
        //   buildRow(3),
        //   // CheckboxListTile
        //
        // ],
        children:radioListFn()
        // children:  checkBoxListFn()
      ),

    );
  }

  Widget buildCheckboxListTile(value,index) {
    print(value);
    return CheckboxListTile(value: value, title:  Text('选项${index+1}'),activeColor:AppColor.primaryColor, onChanged: (val){
      print(val);
         setState(() {
           checkBoxList[index] = val;
         });
        });
  }


  Widget buildRow(index) {
    return Row(
          children: [
            Radio(value: '$index', activeColor: AppColor.primaryColor, groupValue: groupValue, onChanged: (val){
              setState(() {
                groupValue = val;
              });
            }),
            Text('${index + 1} Radio',style: TextStyle(color: groupValue=='$index'?AppColor.primaryColor:Colors.black))
          ],
        );
  }
}
