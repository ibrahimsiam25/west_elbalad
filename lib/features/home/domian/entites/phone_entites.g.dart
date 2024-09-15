// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_entites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneEntitesAdapter extends TypeAdapter<PhoneEntites> {
  @override
  final int typeId = 1;

  @override
  PhoneEntites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneEntites(
      id: fields[0] as String,
      type: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      price: fields[4] as int,
      imageUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneEntites obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneEntitesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
