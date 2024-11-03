// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

// Controllers
import 'package:task_manager/modules/utils/controllers/authed_user_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_utils_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

part 'task_controller.g.dart';

class TaskController = _TaskStoreBase with _$TaskController;

abstract class _TaskStoreBase with Store {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
  final _authController = Modular.get<AuthedUserController>();
  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();
  final _generalUtilsController = Modular.get<GeneralUtilsController>();

  @observable
  Map<String, dynamic>? task;

  create(title, description, context) {
    if (title == "") {
      return _generalWidgetsController.throwError(
          context, "O título deve ser preenchido.");
    }

    final titleFormated = _generalUtilsController.toUpperCase(title);

    _firebaseStore
        .collection('tasks')
        .add({
          'title': titleFormated,
          'description': description,
          'completed': false,
          'createdOn': Timestamp.now(),
          'userId': _authController.authedUser!.uid,
        })
        .then((value) => Modular.to.pop())
        .catchError((error) => print("Failed to add task: $error"));
  }

  @action
  getTaskById(taskId) async {
    DocumentSnapshot docSnapshot =
        await _firebaseStore.collection('tasks').doc(taskId).get();

    if (docSnapshot.exists) {
      task =
          Map<String, dynamic>.from(docSnapshot.data() as Map<String, dynamic>);
    } else {
      print("Task not found");
      return null;
    }
  }

  updateTaskById(taskId, title, description, context) async {
    if (title == "") {
      return _generalWidgetsController.throwError(
          context, "O título deve ser preenchido.");
    }

    final titleFormated = _generalUtilsController.toUpperCase(title);

    return FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .update({'title': titleFormated, 'description': description})
        .then((value) => print("Task Updated"))
        .catchError((error) => print("Failed to update Task: $error"));
  }

  Future<void> deleteTaskById(taskId) {
    return FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .delete()
        .then((value) => print("Task Deleted"))
        .catchError((error) => print("Failed to delete Task: $error"));
  }
}
