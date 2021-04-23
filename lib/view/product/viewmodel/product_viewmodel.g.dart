// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewModel on _ProductViewModelBase, Store {
  final _$_countAtom = Atom(name: '_ProductViewModelBase._count');

  @override
  int get _count {
    _$_countAtom.reportRead();
    return super._count;
  }

  @override
  set _count(int value) {
    _$_countAtom.reportWrite(value, super._count, () {
      super._count = value;
    });
  }

  final _$_ProductViewModelBaseActionController =
      ActionController(name: '_ProductViewModelBase');

  @override
  void incrementCount() {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase.incrementCount');
    try {
      return super.incrementCount();
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseCount() {
    final _$actionInfo = _$_ProductViewModelBaseActionController.startAction(
        name: '_ProductViewModelBase.decreaseCount');
    try {
      return super.decreaseCount();
    } finally {
      _$_ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
