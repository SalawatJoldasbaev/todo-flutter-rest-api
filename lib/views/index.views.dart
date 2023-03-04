// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/services/todo_service.dart';
import 'package:todo/widgets/app_bar.dart';
import 'package:todo/widgets/drawer.dart';

import '../utils/snack_bar_helper.dart';
import '../widgets/task_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  List items = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'TODO APP'),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
                child: Text('No task',
                    style: Theme.of(context).textTheme.headlineMedium)),
            child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return TodoCard(
                    index: index,
                    deleteById: deleteById,
                    navigatedEdit: navigatedToEditPage,
                    item: item,
                  );
                }),
          ),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      drawer: const DrawerMenu(pageName: '/todo'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Get.toNamed('/add');
          fetchTodo();
        },
        label: const Text('Add task'),
      ),
    );
  }

  Future<void> fetchTodo() async {
    final response = await TodoService.fetchTasks();
    if (response != null) {
      setState(() {
        items = response;
      });
    }else{
      showErrorMessage(context, message:'something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(int id) async {
    final isSuccess = await TodoService.deleteById(id);
    if (isSuccess) {
      final filtered = items.where((element) => element['id'] != id).toList();
      setState(() {
        items = filtered;
      });
      showSuccessMessage(context, message:'Successfully deleted task');
    } else {
      showErrorMessage(context, message:'Task deleting fail');
    }
  }

  Future<void> navigatedToEditPage(Map item) async {
    setState(() {
      isLoading = true;
    });
    Get.toNamed('/add', arguments: {
      "task": item
    });
    fetchTodo();
  }
}
