// Packages
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authed_user_controller.g.dart';

class AuthedUserController = _AuthedUserStoreBase with _$AuthedUserController;

abstract class _AuthedUserStoreBase with Store {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @observable
  User? authedUser;

  @action
  authUser(user) {
    authedUser = user;
    print(authedUser);
  }

  @action
  logout() async {
    await _firebaseAuth.signOut();
    authedUser = null;

    if (authedUser == null) {
      Modular.to.navigate('/auth/login');
    }
  }
}
