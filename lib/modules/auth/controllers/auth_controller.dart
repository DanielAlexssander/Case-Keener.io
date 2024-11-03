// Packages
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Controllers
import 'package:task_manager/modules/utils/controllers/authed_user_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthStoreBase with _$AuthController;

abstract class _AuthStoreBase with Store {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _authedUserController = Modular.get<AuthedUserController>();
  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();

  @observable
  bool isLoading = false;

  @observable
  User? user;

  @action
  Future<void> login(
      {required context,
      required String email,
      required String password}) async {
    isLoading = true;

    try {
      if ([email, password].any((str) => str == '')) {
        return _generalWidgetsController.throwError(
            context, "Todos os campos devem ser preenchidos.");
      }

      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;

      setAuthUser(userCredential.user);

      if (user != null) {
        Modular.to.navigate('/home');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'invalid-email') {
        return _generalWidgetsController.throwError(
            context, "O email está incorreto.");
      } else if (e.code == 'invalid-credential') {
        return _generalWidgetsController.throwError(
            context, "Email ou senha está incorreto.");
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> register(
      {required context,
      required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    isLoading = true;

    try {
      if ([name, email, password, confirmPassword].any((str) => str == '')) {
        return _generalWidgetsController.throwError(
            context, "Algum campo está faltando ser preenchido.");
      } else if (password.length < 6) {
        return _generalWidgetsController.throwError(
            context, "A senha deve conter pelo menos 6 caracteres.");
      } else if (password != confirmPassword) {
        return _generalWidgetsController.throwError(
            context, "As senhas não combinam.");
      }

      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();

      user = _firebaseAuth.currentUser;

      setAuthUser(user);

      if (user != null) {
        Modular.to.navigate('/home');
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        return _generalWidgetsController.throwError(
            context, "O email já está em uso.");
      } else if (e.code == 'invalid-email') {
        return _generalWidgetsController.throwError(
            context, "O email está inválido.");
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  setAuthUser(user) {
    _authedUserController.authUser(user);
  }
}
