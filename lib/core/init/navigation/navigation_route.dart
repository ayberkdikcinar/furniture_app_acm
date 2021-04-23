import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/constants/navigation/navigation_constants.dart';
import 'package:furniture_app/view/product/model/product_model.dart';
import 'package:furniture_app/view/product/view/product_detail_view.dart';

import '../../../view/main/app_main_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(AppMainView());
      case NavigationConstants.PRODUCT_DETAIL_VIEW:
        return normalNavigate(ProductDetailView(
          product: args.arguments as Product,
        ));
      default:
        return MaterialPageRoute(builder: (context) => Text(''));
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
