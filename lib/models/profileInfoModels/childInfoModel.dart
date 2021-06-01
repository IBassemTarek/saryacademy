
class ChildInfoModel {
  final String  name;
  final String uid;
  final String  age;
  final String  photourl;
  final String  gender;
  final String  birthday;
  final String  email;
  final String  nationality;
  final int  reportType; // 1- for toddler report & 2- PRM2 & 3- PRM3
  ChildInfoModel({this.age,this.name, this.birthday, this.email,this.gender,this.nationality,this.photourl,this.reportType, this.uid});
}