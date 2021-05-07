import 'package:furniture_app/view/product/model/product_model.dart';

class BasketItem {
  Product? product;
  int? quantity;

  BasketItem({
    this.product,
    this.quantity = 0,
  });
}
