// Packages
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// Controllers
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';
import 'package:task_manager/modules/tasks/controllers/task_controller.dart';

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({super.key});

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  final _titleTaskController = TextEditingController();
  final _descriptionTaskController = TextEditingController();

  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();
  final _taskController = Modular.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -1,
        title: Text("Criar uma tarefa"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              minHeight:
                  MediaQuery.of(context).size.height - kToolbarHeight - 30,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _generalWidgetsController.createTextField(
                      _titleTaskController,
                      "Título",
                      false,
                      'Digite o título da tarefa'),
                  SizedBox(height: 15),
                  _generalWidgetsController.createTextField(
                      _descriptionTaskController,
                      "Descrição",
                      false,
                      'Digite a descrição da tarefa',
                      null,
                      6),
                  SizedBox(height: 20),
                  _generalWidgetsController.createButton("Criar Tarefa",
                      () async {
                    await _taskController.create(
                      _titleTaskController.text,
                      _descriptionTaskController.text,
                      context,
                    );
                  }, null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
