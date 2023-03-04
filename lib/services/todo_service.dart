import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/services/api.dart';

class TodoService {
  static Future<bool> deleteById(int id) async {
    final response = await CallApi().deleteData('/tasks/$id');
    return response.statusCode == 200;
  }

  static Future<List?> fetchTasks() async {
    final http.Response response = await CallApi().getData('/tasks');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['payload'] as List;
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> updateTask(int id, Map body) async {
    final response = await CallApi().patchData(body, '/tasks/$id');
    return response.statusCode == 200;
  }

  static Future<bool> createTask(Map body) async {
    final response = await CallApi().postData(body, '/tasks');
    return response.statusCode == 200;
  }

  static Future<http.Response> doneTask(int id, Map body) async {
    final http.Response response = await CallApi().putData(body, '/tasks/$id');
    return response;
  }
}
