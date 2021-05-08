import 'package:flutter/cupertino.dart';
import 'package:furniture_app/view/product/model/product_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<Product> favoriteList = [];

  void addToFavorite(Product product) {
    favoriteList.add(product);
    notifyListeners();
  }

  void removeFromFavorite(Product product) {
    for (var item in favoriteList) {
      if (item.id == product.id) {
        favoriteList.remove(item);
        break;
      }
    }
    notifyListeners();
  }

  bool isInclude(Product product) {
    for (var item in favoriteList) {
      if (item.id == product.id) {
        return true;
      }
    }
    return false;
  }

  List<Product> get favorites {
    return favoriteList;
  }
}
