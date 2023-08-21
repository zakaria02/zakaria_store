import 'package:hive/hive.dart';

import '../../../products_list/business/dtos/product_dto.dart';
import '../../models/product_to_purchase_uio.dart';

part 'product_to_purchase_dto.g.dart';

@HiveType(typeId: 0)
class ProductToPurchaseDto extends ProductDto {
  @HiveField(7)
  int quantity;
  @HiveField(8)
  double get totalPrice => unitPrice * quantity;

  ProductToPurchaseDto({
    required this.quantity,
    required super.id,
    required super.title,
    required super.unitPrice,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });
}

extension ProductToPurchaseDtosMappers on ProductToPurchaseDto {
  ProductToPurchaseUio toProductToPurchaseUio() {
    return ProductToPurchaseUio(
      id: id,
      title: title,
      unitPrice: unitPrice,
      description: description,
      category: category,
      image: image,
      quantity: quantity,
      rating: rating.toRatingUio(),
    );
  }
}
