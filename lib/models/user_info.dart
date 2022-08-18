// 用户详细信息
class UserInfo {
  int uid;
  String name;
  int gender;
  String province;
  String city;
  List<dynamic> platforms;
  List<dynamic> expertise;
  String joinTime;
  String lastLoginTime;
  String portrait;
  int fansCount;
  int favoriteCount;
  int followersCount;
  Map<String, dynamic> notice;

  UserInfo(
      {required this.uid,
      required this.name,
      required this.gender,
      required this.province,
      required this.city,
      required this.platforms,
      required this.expertise,
      required this.joinTime,
      required this.lastLoginTime,
      required this.portrait,
      required this.fansCount,
      required this.favoriteCount,
      required this.followersCount,
      required this.notice});
}
