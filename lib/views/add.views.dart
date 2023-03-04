// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:todo/services/todo_service.dart';
import 'package:todo/widgets/app_bar.dart';
import 'package:todo/widgets/drawer.dart';
import 'package:get/get.dart';

import '../utils/snack_bar_helper.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Get.arguments != null) {
        final task = Get.arguments['task'];
        if (task != null) {
          isEdit = true;
          final title = task['task'];
          final description = task['description'] ?? '';
          taskController.text = title;
          descriptionController.text = description;
        }
      }
    });
    return Scaffold(
      appBar: MyAppBar(title: isEdit ? 'Edit task' : 'Add task'),
      drawer: const DrawerMenu(pageName: '/add'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Task'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: isEdit ? updateData : submitData,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(isEdit ? 'Update' : 'Submit'),
              ))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    final response = await TodoService.createTask(body);
    if (response) {
      taskController.text = '';
      descriptionController.text = '';
      showSuccessMessage(context, message: 'Task successfully created');
    } else {
      showErrorMessage(context, message: 'Task created fail');
    }
  }

  Future<void> updateData() async {
    final todo = Get.arguments['task'];
    if (todo == null) {
      showErrorMessage(context,
          message: 'You can not call updated without todo data');
      return;
    }
    final id = todo['id'];
    final response = await TodoService.updateTask(id, body);
    if (response) {
      showSuccessMessage(context, message: 'Task successfully updated');
    } else {
      showErrorMessage(context, message: 'Task updating fail');
    }
  }

  Map get body {
    final task = taskController.text;
    final description = descriptionController.text;
    return {"task": task, "description": description};
  }
}
