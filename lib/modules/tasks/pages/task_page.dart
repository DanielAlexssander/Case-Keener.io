// Packages
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// Controllers
import 'package:task_manager/modules/tasks/controllers/task_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_utils_controller.dart';

class TaskPage extends StatefulWidget {
  final String taskId;

  const TaskPage({super.key, required this.taskId});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _taskController = Modular.get<TaskController>();
  final _generalUtilsController = Modular.get<GeneralUtilsController>();

  final _titleTaskController = TextEditingController();
  final _descriptionTaskController = TextEditingController();

  getTaskById() async {
    await _taskController.getTaskById(widget.taskId).then((_) {
      _titleTaskController.text = _taskController.task!['title'];
      _descriptionTaskController.text = _taskController.task!['description'];
    });
  }

  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();

    getTaskById();

    _titleTaskController.addListener(_onTextChanged);
    _descriptionTaskController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final currentTitle = _titleTaskController.text;
    final currentDescription = _descriptionTaskController.text;

    setState(() {
      _hasChanges = currentTitle != _taskController.task!['title'] ||
          currentDescription != _taskController.task!['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -1,
          title: Text("Tarefa"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await _taskController.deleteTaskById(widget.taskId);
                Modular.to.pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Observer(
            builder: (_) {
              if (_taskController.task == null) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView(
                children: [
                  Column(
                    children: [
                      TextField(
                        minLines: 1,
                        maxLines: null,
                        controller: _titleTaskController,
                        style: TextStyle(fontSize: 30),
                        decoration: InputDecoration(
                          hintText: 'Digite o título da tarefa',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: _descriptionTaskController,
                        maxLines: null,
                        minLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'Digite a descrição da tarefa',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Text(
                    'Criado em: ${_generalUtilsController.formatDate(_taskController.task!['createdOn'])}',
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButton: _hasChanges
            ? SizedBox(
                width: 65,
                height: 65,
                child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () async {
                      await _taskController.updateTaskById(
                          widget.taskId,
                          _titleTaskController.text,
                          _descriptionTaskController.text,
                          context);

                      getTaskById();

                      _onTextChanged();
                    }),
              )
            : null);
  }
}
