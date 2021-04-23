import 'package:mobx/mobx.dart';
part 'product_viewmodel.g.dart';

class ProductViewModel = _ProductViewModelBase with _$ProductViewModel;

abstract class _ProductViewModelBase with Store {
  @observable
  int _count = 1;

  int get count {
    return _count;
  }

  @action
  void incrementCount() {
    _count += 1;
  }

  @action
  void decreaseCount() {
    if (_count > 1) {
      _count -= 1;
    }
  }
}
