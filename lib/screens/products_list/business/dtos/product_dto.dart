import 'package:json_annotation/json_annotation.dart';

import '../../feature/products/models/product_uio.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price")
  final double unitPrice;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "category")
  final String category;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "rating")
  final RatingDto rating;

  const ProductDto({
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
class RatingDto {
  @JsonKey(name: "rate")
  final double rate;
  @JsonKey(name: "count")
  final int count;

  const RatingDto({
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
