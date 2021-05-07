// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BasketViewModel on _BasketViewModelBase, Store {
  final _$basketItemsAtom = Atom(name: '_BasketViewModelBase.basketItems');

  @override
  List<BasketItem> get basketItems {
    _$basketItemsAtom.reportRead();
    return super.basketItems;
  }

  @override
  set basketItems(List<BasketItem> value) {
    _$basketItemsAtom.reportWrite(value, super.basketItems, () {
      super.basketItems = value;
    });
  }

  final _$totalPriceAtom = Atom(name: '_BasketViewModelBase.totalPrice');

  @override
  double get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(double value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$_BasketViewModelBaseActionController =
      ActionController(name: '_BasketViewModelBase');

  @override
  void calculateTotalPrice() {
    final _$actionInfo = _$_BasketViewModelBaseActionController.startAction(
        name: '_BasketViewModelBase.calculateTotalPrice');
    try {
      return super.calculateTotalPrice();
    } finally {
      _$_BasketViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToBasket(Product product, int count) {
    final _$actionInfo = _$_BasketViewModelBaseActionController.startAction(
        name: '_BasketViewModelBase.addToBasket');
    try {
      return super.addToBasket(product, count);
    } finally {
      _$_BasketViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
basketItems: ${basketItems},
totalPrice: ${totalPrice}
    ''';
  }
}
