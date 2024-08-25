import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/to_do_list_App/util/my_buttons.dart';
import 'package:flutter_application_1/to_do_list_App/util/to_do_tile.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {Key? key,
      required this.controller,
      required this.onSave,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        color: Colors.yellow[100],
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.yellow[100],
                filled: true,
                border: OutlineInputBorder(),
                hintText: 'Add a new Task',
                hoverColor: Colors.white,
                focusColor: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtons(
                  text: 'save',
                  onPressed: onSave,
                ),
                MyButtons(text: 'cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
