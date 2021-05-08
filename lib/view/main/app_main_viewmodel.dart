import 'package:mobx/mobx.dart';
part 'app_main_viewmodel.g.dart';

class AppMainViewModel = _AppMainViewModelBase with _$AppMainViewModel;

abstract class _AppMainViewModelBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void setCurrent(int index) {
    currentIndex = index;
  }

  int get current {
    return currentIndex;
  }
}
