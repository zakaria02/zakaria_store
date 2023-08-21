// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_to_purchase_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductToPurchaseDtoAdapter extends TypeAdapter<ProductToPurchaseDto> {
  @override
  final int typeId = 0;

  @override
  ProductToPurchaseDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductToPurchaseDto(
      quantity: fields[7] as int,
      id: fields[0] as int,
      title: fields[1] as String,
      unitPrice: fields[2] as double,
      description: fields[3] as String,
      category: fields[4] as String,
      image: fields[5] as String,
      rating: fields[6] as RatingDto,
    );
  }

  @override
  void write(BinaryWriter writer, ProductToPurchaseDto obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.quantity)
      ..writeByte(8)
      ..write(obj.totalPrice)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductToPurchaseDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
