// Packages
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_manager/modules/utils/controllers/general_utils_controller.dart';

// Geral Controllers
import 'modules/utils/controllers/authed_user_controller.dart';
import 'modules/utils/controllers/general_widgets_controller.dart';

// Modules
import 'modules/auth/auth_module.dart';
import 'modules/home/home_module.dart';
import 'modules/tasks/task_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AuthedUserController.new);
    i.addSingleton(GeneralWidgetsController.new);
    i.addSingleton(GeneralUtilsController.new);
  }

  @override
  void routes(r) {
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
    r.module('/task',
        module: TaskModule(),
        transition: TransitionType.rightToLeftWithFade,
        duration: Duration(milliseconds: 200));
  }
}
