// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

// Controllers
import 'package:task_manager/modules/utils/controllers/authed_user_controller.dart';
import 'package:task_manager/modules/utils/controllers/general_widgets_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeStoreBase with _$HomeController;

abstract class _HomeStoreBase with Store {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
  final _authedUserController = Modular.get<AuthedUserController>();
  final _generalWidgetsController = Modular.get<GeneralWidgetsController>();

  buildTasksList() {
    final tasks = _firebaseStore
        .collection('tasks')
        .where('userId', isEqualTo: _authedUserController.authedUser!.uid)
        .snapshots();

    return StreamBuilder(
      stream: tasks,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        if (snapshot.data!.docs.isEmpty) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Text(
              "Você ainda não tem nenhuma tarefa.",
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return Column(
          children: snapshot.data!.docs.map((doc) {
            return _generalWidgetsController.createTaskOfList(
                doc['title'], doc['completed'], doc.id);
          }).toList(),
        );
      },
    );
  }
}
