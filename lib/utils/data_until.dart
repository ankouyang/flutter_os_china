import 'package:shared_preferences/shared_preferences.dart';//导入的文件共享组件
import 'package:flutter_os_china/models/user.dart';
class DataUntils {
  // {
  // "access_token":"8f56afac-affa-41d1-840f-dc1123c4c5a6",
  // "refresh_token":"723c5ea1-95ed-4552-866f-a94caf129019",
  // "uid":3007924,"token_type":"bearer","expires_in":604735
  // }


  //登录信息关系
  static  const String spAccessToken = 'access_token';
  static  const String spRefreshToken = 'refresh_token';
  static  const String spUid = 'uid';
  static  const String spBearer = 'token_type';
  static  const String spExpiresIn = 'expires_in';
  static  const String spIsLogin = 'is_login';


  //用户相关信息
  static  const String spUserId = 'id';
  static  const String spEmail = 'email';
  static  const String spName = 'name';
  static  const String spGender = 'gender';
  static  const String spAvatar = 'avatar';
  static  const String spLocation = 'location';
  static  const String spUrl = 'url';


  //存储登录信息
  static Future<void> saveLoginInfo(Map<String,dynamic> map) async{
    //map判空
    if(map.isNotEmpty){
      SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
      //通过SharedPreferences的实例中的setString(key,value)去存相关数据
      sp
        ..setString(spAccessToken, map[spAccessToken])
        ..setString(spRefreshToken, map[spRefreshToken])
        ..setInt(spUid, map[spUid])//存的int
        ..setString(spBearer, map[spBearer])
        ..setInt(spExpiresIn, map[spExpiresIn])
        ..setBool(spIsLogin, true);//如果存了上述信息说明是已经登陆了
    }

  }
  //清除登录信息
  static Future<void> clearLoginInfo() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
    //通过SharedPreferences的实例中的setString(key,value)去存相关数据
    sp
      ..setString(spAccessToken,'')
      ..setString(spRefreshToken, '')
      ..setInt(spUid, -1)//置为-1
      ..setString(spBearer, '')
      ..setInt(spExpiresIn, -1)//置为-1
      ..setBool(spIsLogin, false);

  }
  //是否登录
  static Future<bool> isLogin() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
    bool? isLogin = sp.getBool(spIsLogin);
    return isLogin!=null&&isLogin;
  }
  //获取token
  static Future<String> getAccessToken() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
    String accessToken = sp.getString(spAccessToken) as String;
    return accessToken;
  }
  //存储用户信息
  static  saveUserInfo(Map<String,dynamic> map) async{
    //map判空
    if(map.isNotEmpty){
      SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
      //通过SharedPreferences的实例中的setString(key,value)去存相关数据 或者setInt .....等等
      sp
        ..setInt(spUserId, map[spUserId])
        ..setString(spEmail, map[spEmail])
        ..setString(spName, map[spName])
        ..setString(spGender, map[spGender])
        ..setString(spAvatar, map[spAvatar])
        ..setString(spLocation, map[spLocation])
        ..setString(spUrl, map[spUrl]);

       //同事定义通过models user.dart文件定义好后端接口返回数据,因为返回的是一个user的类 所以这里实例化
      //   User  user = User(
      //       gender: map[spGender],
      //       name: map[spName],
      //       location: map[spLocation],
      //       id: map[spUserId],
      //       avatar: map[spAvatar],
      //       email:  map[spEmail],
      //       url: map[spUrl]
      //   );
      // return   user;
    }
  }
  // 获取用户信息
  static getUserInfo() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
    bool? isLogin = sp.getBool(spIsLogin);
    if (isLogin == null || !isLogin) {
      return null;
    }
    User user = User();
    user.gender = sp.getString(spGender);
    user.name = sp.getString(spName);
    user.location = sp.getString(spLocation);
    user.id = sp.getInt(spUserId);
    user.avatar = sp.getString(spAvatar);
    user.email = sp.getString(spEmail);
    user.url = sp.getString(spUrl);
    print(user);
    return user;
  }
  // 清除用户信息
  static Future<void> clearUseInfo() async{
    SharedPreferences  sp = await SharedPreferences.getInstance();//先定义一个SharedPreferences的实例。
    //通过SharedPreferences的实例中的setString(key,value)去存相关数据
    sp
    ..setInt(spUserId, -1)
    ..setString(spEmail,'')
    ..setString(spName,'')
    ..setString(spGender, '')
    ..setString(spAvatar, '')
    ..setString(spLocation,'')
    ..setString(spUrl, '');

  }
}