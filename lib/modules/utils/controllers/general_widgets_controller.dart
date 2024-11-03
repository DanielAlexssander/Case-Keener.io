// Packages
import 'package:flutter/material.dart';
import 'package:task_manager/modules/utils/widgets/bubblesBackGround_widget.dart';

// Widgets
import 'package:task_manager/modules/utils/widgets/button_widget.dart';
import 'package:task_manager/modules/utils/widgets/iconPerson_widget.dart';
import 'package:task_manager/modules/utils/widgets/listTask_widget.dart';
import 'package:task_manager/modules/utils/widgets/textField_widget.dart';

class GeneralWidgetsController {
  Widget createButton(child, function, color) {
    return ButtonWidget(
      child: child,
      function: function,
      color: color,
    );
  }

  Widget createIconPerson() {
    return IconPersonWidget();
  }

  Widget createTaskOfList(title, completed, id) {
    return ListTaskWidget(title: title, completed: completed, id: id);
  }

  Widget createBubbleBackground() {
    return BubblesBackgroundWidget();
  }

  Widget createTextField(controller, labelText, obscure,
      [String? hintText, int? minLines, int? maxLines]) {
    if (hintText == null) {
      hintText = "";
    }
    if (maxLines == null) {
      maxLines = 1;
    }

    return TextFieldWidget(
      controller: controller,
      labelText: labelText,
      obscure: obscure,
      hintText: hintText,
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  throwError(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ));
  }
}
