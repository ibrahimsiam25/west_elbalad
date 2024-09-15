import 'package:hive/hive.dart';
 part 'phone_entites.g.dart';
@HiveType(typeId: 1)
class PhoneEntites {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final String name;
  @HiveField(3)   
  final String description;
  @HiveField(4)
  final int price;
  @HiveField(5)
  final String imageUrl;

  PhoneEntites({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}
