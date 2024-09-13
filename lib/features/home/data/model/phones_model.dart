import 'package:west_elbalad/features/home/domian/entites/phone_entites.dart';


class PhoneModel extends PhoneEntites{
  PhoneModel({required super.type, required super.name, required super.description, required super.price, required super.imageUrl});
    factory PhoneModel.fromEntity(PhoneEntites user) {
    return PhoneModel(
      type: user.type,
      name: user.name,
      description: user.description,
      price: user.price,
      imageUrl: user.imageUrl,
    );
  }

  
  toMap() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }
}