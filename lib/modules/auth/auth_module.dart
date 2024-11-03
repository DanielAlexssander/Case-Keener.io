// Packages
import 'package:flutter_modular/flutter_modular.dart';

// Controllers
import 'controllers/auth_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

// Pages
import 'pages/login_page.dart';
import 'pages/register_page.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AuthController.new);
    i.add(GeneralWidgetsController.new);
  }

  @override
  void routes(r) {
    r.child('/login', child: (context) => LoginPage());
    r.child('/register', child: (context) => RegisterPage());
  }
}
