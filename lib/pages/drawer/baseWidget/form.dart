import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  // TextEditingController  textEditingController1 = TextEditingController();
  // TextEditingController  textEditingController2 = TextEditingController();
  // TextEditingController  textEditingController3 = TextEditingController();
  //  FocusNode  inputNode1 =  FocusNode();
  //  FocusNode  inputNode2 =  FocusNode();
  //  FocusNode  inputNode3 =  FocusNode();
  final FocusScopeNode scopeNode = FocusScopeNode();
  TextEditingController  userNameController =  TextEditingController();
  TextEditingController  passwordController =  TextEditingController();

  late String userName;
  late String password;
  bool  isObscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // textEditingController.addListener(() {
    //     print(textEditingController.text);
    // });
    //
    // inputNode1.addListener(() {
    //   //获得焦点时focusNode.hasFocus值为true，失去焦点时为false。
    //   print(inputNode1.hasFocus);
    // });
    //

    userNameController.addListener(() {
      print(userNameController.text);
      setState(() {
        userName = userNameController.text;
      });

    });
    passwordController.addListener(() {
      print(passwordController.text);
      setState(() {
        password =  passwordController.text;
      });
    });


  }

  login(){
    FormState?  currentState = formKey.currentState;
    if(currentState!.validate()){
      // currentState.save();
      currentState.reset();
      scopeNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('Form'),
       ),
       body: Container(
           padding: const EdgeInsets.all(15.0),
           child: FocusScope(
             node: scopeNode,
             child: Form(
               key: formKey,
               child:Column(
                 children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        labelText: '用户名',
                        hintText: '请输入用户名',
                        icon: Icon(Icons.person),
                      ),
                      validator: (v){
                        return v!.trim().isNotEmpty ? null : "用户名不能为空";
                      },
                      onEditingComplete: (){
                        scopeNode.nextFocus();
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                     controller: passwordController,
                     decoration:  InputDecoration(
                         labelText: '密码',
                         hintText: '请输入密码',
                         icon: const Icon(Icons.lock),
                         suffixIcon: GestureDetector(
                           onTap: (){
                             setState(() {
                               isObscureText =!isObscureText;
                             });
                           },
                           child: isObscureText?const Icon(Icons.visibility):Icon(Icons.visibility_off),
                         )
                     ),
                      obscureText: isObscureText,
                      validator: (v) {
                        return v!.trim().length > 5 ? null : "密码不能少于6位";
                      },
                     onEditingComplete: (){
                       scopeNode.unfocus();
                     },
                   ),
                     // 登录按钮
                     Padding(
                     padding: const EdgeInsets.only(top: 28.0),
                     child: Row(
                       children: <Widget>[
                         Expanded(
                           child: ElevatedButton(
                             onPressed: login,
                             child: const Padding(
                               padding: EdgeInsets.all(12.0),
                               child: Text("登录"),
                             )
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               )
             ),
           )

       ),
    );
  }
  Column buildColumn() {
    return Column(
             children: const <Widget>[

               TextField(
                 style: TextStyle(fontSize: 20.0,color: Colors.green),
                 textAlign: TextAlign.left,
                 autofocus:true,
                 obscureText:false,
                 maxLines:1,
                 maxLengthEnforcement:MaxLengthEnforcement.enforced,
                 maxLength: 15,
                 toolbarOptions: ToolbarOptions(
                   copy: true,
                   cut: true,
                   paste: true,
                   selectAll: true,
                 ),
                 enabled: true,
                 cursorColor: Colors.red,
                 cursorRadius: Radius.circular(10.0),
                 cursorWidth: 10.0,

                 decoration: InputDecoration(
                  hintText: '请输入文本'
                ),
                 textInputAction:TextInputAction.done,
               ),


               // TextField(
               //  decoration: InputDecoration(
               //    hintText: '请输入文本'
               //  ),
               //  keyboardType:TextInputType.text,
               // ),
               // TextField(
               //   decoration: InputDecoration(
               //       hintText: '请输入数字'
               //   ),
               //   keyboardType:TextInputType.number,
               // ),
               // TextField(
               //   decoration: InputDecoration(
               //       hintText: '请输入手机号'
               //   ),
               //   keyboardType:TextInputType.phone,
               // ),
               // TextField(
               //   decoration: InputDecoration(
               //       hintText: '请输入日期'
               //   ),
               //   keyboardType:TextInputType.datetime,
               // ),
               // TextField(
               //   decoration: InputDecoration(
               //       hintText: '请输入电子邮件'
               //   ),
               //   keyboardType:TextInputType.emailAddress,
               // ),
               // TextField(
               //   decoration: InputDecoration(
               //       hintText: '请输入url'
               //   ),
               //   keyboardType:TextInputType.url,
               // )
             ],
           );
  }
  TextField buildTextField(FocusNode inputNode,String hintText,FocusScopeNode scopeNode,textEditingController, bool flag ) {
    return TextField(
                 controller:textEditingController,
                 focusNode: inputNode,
                 decoration:  InputDecoration(
                   hintText: hintText
                 ),
                 onEditingComplete: (){
                    // scopeNode ??= FocusScope.of(context);
                    // scopeNode.requestFocus(inputNode3);
                    // if(flag){
                    //   print(45454);
                    //   inputNode3.unfocus();
                    // }
                 },
               );
  }
}
