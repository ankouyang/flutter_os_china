import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_os_china/utils/data_until.dart';
import 'package:flutter_os_china/constants/constants.dart' show AppUrls;
import 'package:flutter_os_china/utils/network_request.dart';
import 'package:flutter_os_china/utils/image_picker.dart';
import 'package:flutter_os_china/models/user_info.dart';
class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  dynamic  _userInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfoDetail();
  }

  //获取详情接口
  void getUserInfoDetail()  {
    DataUntils.getAccessToken().then((accessToken){
       //拼装请求
      Map<String,dynamic>  params = {
        'access_token':accessToken,
        'dataType':'json',
      };

      //请求用户详情
        NetUtils.get(AppUrls.myInformation, params).then((data){
          print(data);
          if (data.isNotEmpty) {
            Map<String, dynamic> map = json.decode(data);
            UserInfo userInfo = UserInfo();
            userInfo.uid = map['uid'];
            userInfo.name = map['name'];
            userInfo.gender = map['gender'];
            userInfo.province = map['province'];
            userInfo.city = map['city'];
            userInfo.platforms = map['platforms'];
            userInfo.expertise = map['expertise'];
            userInfo.joinTime = map['joinTime'];
            userInfo.lastLoginTime = map['lastLoginTime'];
            userInfo.portrait = map['portrait'];
            userInfo.fansCount = map['fansCount'];
            userInfo.favoriteCount = map['favoriteCount'];
            userInfo.followersCount = map['followersCount'];
            userInfo.notice = map['notice'];
            setState(() {
              _userInfo = userInfo;
            });
          }
        });

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的资料'),
        ),
       body:buildSingleChildScrollView()
    );
  }

  Widget buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: _userInfo == null
          ? const Center(
        child: CupertinoActivityIndicator(),
      )
          : Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              //TODO
              ImagePickerUntil.chooseImage();
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '头像',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(_userInfo.portrait),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '昵称',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    _userInfo.name,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '加入时间',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.joinTime,
                  // _userInfo.joinTime.split(' ')[0],
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '所在地区',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    _userInfo.city,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      '开发平台',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      // 'Android,C/C++,J2ME/K-Java,Python,.NET/C#',
                      _userInfo.platforms.toString(),
                      style: const TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0),
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      '专长领域',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      // '手机软件开发，服务器开发，软件开发管理',
                      _userInfo.expertise.toString(),
                      style: const TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '粉丝数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.fansCount.toString(),
                  style: const TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '收藏数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.favoriteCount.toString(),
                  style: const TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '关注数',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  _userInfo.followersCount.toString(),
                  style: const TextStyle(fontSize: 20.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
