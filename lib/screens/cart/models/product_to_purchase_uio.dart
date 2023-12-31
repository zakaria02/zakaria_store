import '../../products_list/feature/products/models/product_uio.dart';
import '../business/dtos/product_to_purchase_dto.dart';

class ProductToPurchaseUio extends ProductUio {
  int quantity;

  ProductToPurchaseUio({
    required this.quantity,
    required super.id,
    required super.title,
    required super.unitPrice,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  ProductToPurchaseUio copyWith(
          {int? quantity,
          int? id,
          String? title,
          double? unitPrice,
          String? description,
          String? category,
          String? image,
          RatingUio? rating}) =>
      ProductToPurchaseUio(
        quantity: quantity ?? this.quantity,
        id: id ?? this.id,
        title: title ?? this.title,
        unitPrice: unitPrice ?? this.unitPrice,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  double get totalPrice => unitPrice * quantity;
}

extension ProductToPurchaseUioMappers on ProductToPurchaseUio {
  ProductToPurchaseDto toProductToPurchaseDto() {
    return ProductToPurchaseDto(
      id: id,
      title: title,
      unitPrice: unitPrice,
      description: description,
      category: category,
      image: image,
      quantity: quantity,
      rating: rating.toRatingDto(),
    );
  }
}
