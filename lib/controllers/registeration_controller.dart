import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:todo/views/index.views.dart';

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithPhone() async {
    try {
      Map body = {
        'name': nameController.text,
        'phone': phoneController.text,
        'password': passwordController.text
      };

      http.Response response = await CallApi().postData(body, '/register');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['payload']['token'];
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        nameController.clear();
        phoneController.clear();
        passwordController.clear();
        Get.off(const TodoListPage());
      } else {
        throw jsonDecode(response.body)['message'] ?? 'unknown error';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Ops'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
