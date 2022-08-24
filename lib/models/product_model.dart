import 'package:lavie/models/plant_model.dart';
import 'package:lavie/models/seed_model.dart';
import 'package:lavie/models/tools_model.dart';

class ProductModel {
  late String? id;
  late String? name;
  late String? description;
  late String? imageUrl;
  late String? type;
  late int? price;
  late bool? avaliable;
  late SeedModel?seed;
  late PlantModel ?plant;
  late ToolModel? tool;



  ProductModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.type,
    required this.id,
    required this.avaliable,
    this.plant,
    this.seed,
    this.tool,
  });

  ProductModel.fromJson(Map<String,dynamic>json){
    id = json["productId"];
    name = json["name"];
    description = json["description"];
    imageUrl = json["imageUrl"];
    type = json["type"];
    price = json["price"];
    avaliable = json["avaliable"];
    // seed = SeedModel.fromJson(json["seed"]);
    // plant = PlantModel.fromJson(json["plant"]);
    // tool = ToolModel.fromJson(json["productId"]);
  }

  int count=1;

  void changeCounter(int oneOrMinusOne){
    count+=oneOrMinusOne;
  }

}
