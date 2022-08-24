class ToolModel{

  late String id;
  late String name;
  late String description;
  late String imageUrl;
  int price = 70;
  ToolModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.id,
    required this.price,
  });

  ToolModel.fromJson(Map<String,dynamic>json){
    id = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  int count=1;

  void changeCounter(int oneOrMinusOne){
    count+=oneOrMinusOne;
  }
}