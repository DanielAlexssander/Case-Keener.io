// Packages
import 'package:flutter_modular/flutter_modular.dart';

// Controllers
import 'package:task_manager/modules/home/controllers/home_controller.dart';

// Pages
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => HomePage());
  }
}
