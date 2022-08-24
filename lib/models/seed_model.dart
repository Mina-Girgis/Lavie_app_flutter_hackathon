class SeedModel{

  late String? id;
  late String? name;
  late String? description;
  late String? imageUrl;
  int? price = 70;
  SeedModel({
     this.name,
     this.imageUrl,
     this.description,
     this.id,
     this.price,
  });

  SeedModel.fromJson(Map<String,dynamic>json){
    id = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  int count=1;
  void changeCounter(int oneOrMinusOne){
    count+=oneOrMinusOne;
  }
}