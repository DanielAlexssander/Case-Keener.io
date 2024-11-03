import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListTaskWidget extends StatelessWidget {
  final String title;
  final String id;
  final bool completed;

  const ListTaskWidget({
    super.key,
    required this.title,
    required this.completed,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          trailing: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: completed,
              onChanged: (value) {
                FirebaseFirestore.instance
                    .collection('tasks')
                    .doc(id)
                    .update({'completed': !completed}).catchError(
                        (error) => print("Failed to update user: $error"));
              },
            ),
          ),
          onTap: () {
            Modular.to.pushNamed('/task/$id');
          },
        ),
        Divider(
          height: 0,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Colors.grey,
        ),
        Container(
          height: 20,
        )
      ],
    );
  }
}
