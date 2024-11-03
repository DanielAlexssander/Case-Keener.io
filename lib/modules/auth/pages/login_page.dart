// Packages
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Controllers
import '../controllers/auth_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = Modular.get<AuthController>();
  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _generalWidgetsController.createBubbleBackground(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _generalWidgetsController.createIconPerson(),
                  SizedBox(
                    height: 20,
                  ),
                  _generalWidgetsController.createTextField(
                      _emailController, "Email", false),
                  SizedBox(
                    height: 15,
                  ),
                  _generalWidgetsController.createTextField(
                      _passwordController, "Senha", true),
                  SizedBox(height: 20),
                  Observer(builder: (_) {
                    return _authController.isLoading == false
                        ? _generalWidgetsController.createButton("Entrar", () {
                            _authController.login(
                                context: context,
                                email: _emailController.text,
                                password: _passwordController.text);
                          }, null)
                        : _generalWidgetsController.createButton(
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            () => null,
                            Colors.grey);
                  }),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        Modular.to.navigate('/auth/register');
                      },
                      child: Text(
                        "Ainda não está cadastrado? Clique aki",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
