
class Model{
  late bool? status;
  late String? message;
  late UserData data;

  Model({required this.message,required this.status,required this.data});

  Model.fromJson(Map<String,dynamic>json){
    status= json['status'];
    message= json['message'];
    data=(json['data'] != null ? UserData.fromJson(json['data']) : null)!;
  }
}

class UserData{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.credit,
    required this.phone,
    required this.token,
    required this.points,
});

  UserData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image =json['image'];
    credit =json['credit'];
    token =json['token'];
    points =json['points'];
  }



}