import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/to_do_list_App/util/dialog_box.dart';
import 'package:flutter_application_1/to_do_list_App/util/to_do_tile.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  TextEditingController _controller = TextEditingController();

  List toDoList = [
    [_ProjectString().makeTutorial, true],
    [_ProjectString().doingExercise, false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
            controller: _controller,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_ProjectString().title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: createNewTask,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ToDoTile(
              deleteFunction: (context) => deleteTask(index),
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
            );
          },
          itemCount: toDoList.length,
        ));
  }
}

class _ProjectString {
  final String title = 'TO DO';
  final String doingExercise = 'Doing exercise';
  final String makeTutorial = 'Make Tutorial';
}
