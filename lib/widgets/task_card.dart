// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/services/todo_service.dart';

import '../utils/snack_bar_helper.dart';

class TodoCard extends StatefulWidget {
  final int index;
  final Map item;
  final Function(Map) navigatedEdit;
  final Function(int) deleteById;

  const TodoCard(
      {Key? key,
      required this.index,
      required this.item,
      required this.navigatedEdit,
      required this.deleteById})
      : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final id = widget.item['id'] as int;
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: widget.item['is_done'],
          onChanged: (bool? val) => setState(() {
            widget.item['is_done'] = val!;
            doneTask(id, val);
          }),
        ),
        title: Text(widget.item['task']),
        subtitle: Text(widget.item['description'] ?? ''),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              widget.navigatedEdit(widget.item);
            } else if (value == 'delete') {
              widget.deleteById(id);
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(value: 'edit', child: Text('Edit')),
              const PopupMenuItem(value: 'delete', child: Text('Delete')),
            ];
          },
        ),
      ),
    );
  }

  Future<void> doneTask(id, value) async {
    Map body = {'is_done': value};
    final response = await TodoService.doneTask(id, body);
    if (response.statusCode > 299) {
      showErrorMessage(context,
          message: jsonDecode(response.body)['message'] ?? 'unknown error');
    }
  }
}
