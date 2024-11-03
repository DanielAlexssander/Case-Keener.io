// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authed_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthedUserController on _AuthedUserStoreBase, Store {
  late final _$authedUserAtom =
      Atom(name: '_AuthedUserStoreBase.authedUser', context: context);

  @override
  User? get authedUser {
    _$authedUserAtom.reportRead();
    return super.authedUser;
  }

  @override
  set authedUser(User? value) {
    _$authedUserAtom.reportWrite(value, super.authedUser, () {
      super.authedUser = value;
    });
  }

  late final _$logoutAsyncAction =
      AsyncAction('_AuthedUserStoreBase.logout', context: context);

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_AuthedUserStoreBaseActionController =
      ActionController(name: '_AuthedUserStoreBase', context: context);

  @override
  dynamic authUser(dynamic user) {
    final _$actionInfo = _$_AuthedUserStoreBaseActionController.startAction(
        name: '_AuthedUserStoreBase.authUser');
    try {
      return super.authUser(user);
    } finally {
      _$_AuthedUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authedUser: ${authedUser}
    ''';
  }
}
