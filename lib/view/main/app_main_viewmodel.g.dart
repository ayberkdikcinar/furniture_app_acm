// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_main_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppMainViewModel on _AppMainViewModelBase, Store {
  final _$currentIndexAtom = Atom(name: '_AppMainViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_AppMainViewModelBaseActionController =
      ActionController(name: '_AppMainViewModelBase');

  @override
  void setCurrent(int index) {
    final _$actionInfo = _$_AppMainViewModelBaseActionController.startAction(
        name: '_AppMainViewModelBase.setCurrent');
    try {
      return super.setCurrent(index);
    } finally {
      _$_AppMainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
