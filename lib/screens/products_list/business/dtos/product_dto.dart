import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../feature/products/models/product_uio.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "id")
  final int id;
  @HiveField(1)
  @JsonKey(name: "title")
  final String title;
  @HiveField(2)
  @JsonKey(name: "price")
  final double unitPrice;
  @HiveField(3)
  @JsonKey(name: "description")
  final String description;
  @HiveField(4)
  @JsonKey(name: "category")
  final String category;
  @HiveField(5)
  @JsonKey(name: "image")
  final String image;
  @HiveField(6)
  @JsonKey(name: "rating")
  final RatingDto rating;

  ProductDto({
    required this.id,
    required this.title,
    required this.unitPrice,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

extension ProductDtoMappers on ProductDto {
  ProductUio toProductUio() {
    return ProductUio(
      id: id,
      title: title,
      unitPrice: unitPrice,
      description: description,
      category: category,
      image: image,
      rating: rating.toRatingUio(),
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 1)
class RatingDto extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "rate")
  final double rate;
  @HiveField(1)
  @JsonKey(name: "count")
  final int count;

  RatingDto({
    required this.rate,
    required this.count,
  });

  factory RatingDto.fromJson(Map<String, dynamic> json) =>
      _$RatingDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RatingDtoToJson(this);
}

extension RatingDtoMappers on RatingDto {
  RatingUio toRatingUio() {
    return RatingUio(rate: rate, count: count);
  }
}
