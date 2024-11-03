// Packages
import 'package:flutter_modular/flutter_modular.dart';
import 'package:task_manager/modules/tasks/controllers/task_controller.dart';

// Pages
import 'pages/task_create_page.dart';
import 'pages/task_page.dart';

class TaskModule extends Module {
  @override
  void binds(i) {
    i.add(TaskController.new);
  }

  @override
  void routes(r) {
    r.child('/create', child: (context) => TaskCreatePage());
    r.child('/:taskId',
        child: (context) => TaskPage(taskId: r.args.params['taskId']));
  }
}
