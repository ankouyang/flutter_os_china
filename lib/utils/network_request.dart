import 'package:http/http.dart' as http;//引入dart http第三方包,并断言为http
// 定义一个网络请求的类
class NetUtils{
  // get请求,返回的是一个异步的Future对象,形参是一个string url 和一个parms的Map
  static Future<String> get(String url,Map<String,dynamic> params) async{
      //先判空
    if(params.isNotEmpty){
      //拼装参数 这里用的 dart:core 库中StringBuffer，允许使用write*() 方法增量构建字符串。仅当调用 toString 时，字符串才会连接到单个字符串
      StringBuffer  stringContact = StringBuffer('?');
      params.forEach((key, value) {
        stringContact.write('$key=$value&');//
      });
      //去除最后一个&，注意仅当调用 toString 时，字符串才会连接到单个字符串
      String  paramStr =  stringContact.toString().substring(0,stringContact.length-1);
      url+=paramStr;
    }
    Uri urlData = Uri.parse(url);//url string转为Uri
    http.Response  response = await http.get(urlData);
    return response.body;
  }

  //post请求
static  Future<String>  post(String url,Map<String,dynamic> params) async{
  Uri urlData = Uri.parse(url);
  http.Response  response = await http.post( urlData, body:params );
    return  response.body;
}
}