import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_example/model/todo.dart';
import 'package:todo_app_ui_example/provider/todos.dart';
import 'package:todo_app_ui_example/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  //final _formKey = GlobalKey<FormState>();
  //final _formKey = true;
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: addTodo,
            ),
          ],
        ),
      );

  void addTodo() {
    final isValid = true; // _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          title: title, description: description, createdTime: DateTime.now());

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
