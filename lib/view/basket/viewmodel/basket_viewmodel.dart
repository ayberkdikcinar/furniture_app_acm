import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import 'package:furniture_app/view/product/model/product_model.dart';

import '../model/basket_model.dart';

part 'basket_viewmodel.g.dart';

class BasketViewModel = _BasketViewModelBase with _$BasketViewModel;

abstract class _BasketViewModelBase extends ChangeNotifier with Store {
  _BasketViewModelBase() {
    calculateTotalPrice();
  }

  @observable
  List<BasketItem> basketItems = [];

  @observable
  var totalPrice = 0.0;

  @action
  void calculateTotalPrice() {
    for (var item in basketItems) {
      totalPrice += item.quantity! * item.product!.price!;
    }
  }

  double get total {
    return totalPrice;
  }

  @action
  void addToBasket(Product product, int count) {
    var flag = false;
    for (var item in basketItems) {
      if (product.title == item.product!.title) {
        flag = true;
        item.quantity = item.quantity! + count;
        break;
      }
    }
    if (flag == false) {
      basketItems.add(BasketItem(product: product, quantity: count));
    }
    totalPrice += product.price! * count;
  }

  void decreaseCount(int index) {
    totalPrice -= basketItems[index].product!.price!;
    if (basketItems[index].quantity! > 1) {
      basketItems[index].quantity = basketItems[index].quantity! - 1;
    } else {
      basketItems.removeAt(index);
    }
  }

  void increaseCount(int index) {
    basketItems[index].quantity = basketItems[index].quantity! + 1;
    totalPrice += basketItems[index].product!.price!;
  }

  List<BasketItem> get basket {
    return basketItems;
  }
}
