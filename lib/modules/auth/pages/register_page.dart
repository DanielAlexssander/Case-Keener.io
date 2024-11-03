// Packages
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Controller
import 'package:task_manager/modules/auth/controllers/auth_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  final _authController = Modular.get<AuthController>();
  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _generalWidgetsController.createBubbleBackground(),
        Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _generalWidgetsController.createIconPerson(),
                    SizedBox(height: 20),
                    _generalWidgetsController.createTextField(
                        _nameController, "Nome", false),
                    SizedBox(height: 15),
                    _generalWidgetsController.createTextField(
                        _emailController, "Email", true),
                    SizedBox(height: 15),
                    _generalWidgetsController.createTextField(
                        _passwordController, "Senha", true),
                    SizedBox(height: 15),
                    _generalWidgetsController.createTextField(
                        _confirmPasswordController, "Confirme sua senha", true),
                    SizedBox(height: 20),
                    Observer(
                      builder: (_) {
                        return _authController.isLoading == false
                            ? _generalWidgetsController.createButton(
                                "Registrar",
                                () async {
                                  await _authController.register(
                                    context: context,
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                  );
                                },
                                null,
                              )
                            : _generalWidgetsController.createButton(
                                SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                () => null,
                                Colors.grey,
                              );
                      },
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Modular.to.navigate('/auth/login');
                      },
                      child: Text(
                        "Já se registrou? Clique aqui",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
