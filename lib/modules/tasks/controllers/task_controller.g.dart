// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on _TaskStoreBase, Store {
  late final _$taskAtom = Atom(name: '_TaskStoreBase.task', context: context);

  @override
  Map<String, dynamic>? get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  @override
  set task(Map<String, dynamic>? value) {
    _$taskAtom.reportWrite(value, super.task, () {
      super.task = value;
    });
  }

  late final _$getTaskByIdAsyncAction =
      AsyncAction('_TaskStoreBase.getTaskById', context: context);

  @override
  Future getTaskById(dynamic taskId) {
    return _$getTaskByIdAsyncAction.run(() => super.getTaskById(taskId));
  }

  @override
  String toString() {
    return '''
task: ${task}
    ''';
  }
}
