import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/constants/constants.dart';
import '../dtos/product_to_purchase_dto.dart';

class CartService {
  Future<void> saveProduct(ProductToPurchaseDto product) async {
    Box<ProductToPurchaseDto> box =
        await Hive.openBox<ProductToPurchaseDto>(Constants.cartHiveBox);
    if (box.containsKey(product.id)) {
      int oldQuantity = box.get(product.id)?.quantity ?? 0;
      product.quantity = product.quantity + oldQuantity;
    }
    await box.put(product.id, product).whenComplete(() => box.close());
  }

  Future<List<ProductToPurchaseDto>> fetchProducts() async {
    Box<ProductToPurchaseDto> box =
        await Hive.openBox<ProductToPurchaseDto>(Constants.cartHiveBox);
    List<ProductToPurchaseDto> data = box.values.toList();
    box.close();
    return data;
  }

  Future<void> deleteProduct(int id) async {
    Box<ProductToPurchaseDto> box =
        await Hive.openBox<ProductToPurchaseDto>(Constants.cartHiveBox);
    await box.delete(id).whenComplete(() => box.close());
  }
}
