import '../../categories/models/category_uio.dart';

class ProductUio {
  final int id;
  final String title;
  final double price;
  final String description;
  final CategoryUio category;
  final String image;
  final RatingUio rating;

  const ProductUio({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}

class RatingUio {
  final double rate;
  final int count;

  const RatingUio({required this.rate, required this.count});
}
