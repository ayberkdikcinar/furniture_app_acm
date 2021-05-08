import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_app/core/init/localization/locale_keys.g.dart';
import 'package:furniture_app/view/product/model/product_model.dart';

class FavoriteViewModel extends ChangeNotifier {
  List<Product> favoriteList = [];
  List<String> choices = [LocaleKeys.delete.tr(), 'Share'];

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

  List<String> get choiceList {
    return choices;
  }
}
