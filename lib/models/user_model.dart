class UserModel{
    late String userId;
    late String firstName;
    late String lastName;
    late String email;
    late String imageUrl;
    late String? address;
    late String role;

    UserModel({ required this.firstName,
      required this.lastName,
      required this.email,required
      this.userId,required
      this.address,
      required this.imageUrl,
      required this.role});


    UserModel.fromJson(Map<String,dynamic>json){
       userId = json['userId'];
      firstName=json['firstName'];
      lastName=json['lastName'];
       email=json['email'];
      imageUrl=json['imageUrl']??"";
      address=json['address']??"";
       role=json['role'];
    }

    int count=1;
    void countPlue(){
      count++;
    }
    void countMinus(){
      count--;
    }
}