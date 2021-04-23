import 'package:furniture_app/service/product_service.dart';
import 'package:furniture_app/view/product/model/product_model.dart';
import 'package:mobx/mobx.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

enum ViewState { Idle, Busy }

abstract class _HomeViewModelBase with Store {
  List<Product>? _productList = [];

  @observable
  ViewState? _state;
  final productDatabaseProvider = ProductDatabaseProvider.instance;

  _HomeViewModelBase() {
    _state = ViewState.Idle;
    fillProductList();
  }

  ViewState get state {
    return _state!;
  }

  @action
  void setState(val) {
    _state = val;
  }

  List<Product> get productList => _productList!;
  Future<void> fillProductList() async {
    try {
      setState(ViewState.Busy);
      var _products = await productDatabaseProvider?.getList();
      _productList = _products;
    } finally {
      setState(ViewState.Idle);
    }
  }
}
