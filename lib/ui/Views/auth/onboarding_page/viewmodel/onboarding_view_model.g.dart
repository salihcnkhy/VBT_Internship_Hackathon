// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingViewModel on _OnboardingViewModelBase, Store {
  Computed<bool> _$isNotLastPageComputed;

  @override
  bool get isNotLastPage =>
      (_$isNotLastPageComputed ??= Computed<bool>(() => super.isNotLastPage,
              name: '_OnboardingViewModelBase.isNotLastPage'))
          .value;
  Computed<String> _$buttonFinishValueComputed;

  @override
  String get buttonFinishValue => (_$buttonFinishValueComputed ??=
          Computed<String>(() => super.buttonFinishValue,
              name: '_OnboardingViewModelBase.buttonFinishValue'))
      .value;

  final _$currentPageAtom = Atom(name: '_OnboardingViewModelBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_OnboardingViewModelBaseActionController =
      ActionController(name: '_OnboardingViewModelBase');

  @override
  void onPageChanged(int index) {
    final _$actionInfo = _$_OnboardingViewModelBaseActionController.startAction(
        name: '_OnboardingViewModelBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$_OnboardingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
isNotLastPage: ${isNotLastPage},
buttonFinishValue: ${buttonFinishValue}
    ''';
  }
}
