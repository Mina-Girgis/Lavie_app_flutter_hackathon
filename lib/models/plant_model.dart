class PlantModel {

  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late int waterCapacity;
  late int sunLight;
  late int temperature;
  int price = 70;
  int count=1;

  void changeCounter(int oneOrMinusOne){
    count+=oneOrMinusOne;
  }

  PlantModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.id,
    required this.sunLight,
    required this.temperature,
    required this.waterCapacity
  });

  PlantModel.fromJson(Map<String, dynamic>json){
    id=json['plantId'];
    name =json['name'];
    description=json['description'];
    imageUrl=json['imageUrl'];
    waterCapacity=json['waterCapacity'];
    sunLight=json['sunLight'];
    temperature=json['temperature'];
  }

}