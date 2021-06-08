import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_example/model/todo.dart';
import 'package:todo_app_ui_example/services/firebase_api.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    FirebaseApi.createTodo(todo);
    _todos.add(todo);
    notifyListeners();
  }
}
