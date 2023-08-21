import '../../../../cart/models/product_to_purchase_uio.dart';
import '../../../business/dtos/product_dto.dart';

class ProductUio {
  final int id;
  final String title;
  final double unitPrice;
  final String description;
  final String category;
  final String image;
  final RatingUio rating;

  const ProductUio({
    required this.id,
    required this.title,
    required this.unitPrice,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

extension ProductToPurchaseUioMappers on ProductUio {
  ProductToPurchaseUio toProductToPurchaseUio() {
    return ProductToPurchaseUio(
      id: id,
      title: title,
      unitPrice: unitPrice,
      description: description,
      category: category,
      image: image,
      quantity: 1,
      rating: rating,
    );
  }
}

class RatingUio {
  final double rate;
  final int count;

  const RatingUio({required this.rate, required this.count});
}

extension RatingUioMappers on RatingUio {
  RatingDto toRatingDto() {
    return RatingDto(
      rate: rate,
      count: count,
    );
  }
}
