import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/views/add.views.dart';
import 'package:todo/views/auth.views.dart';
import 'package:todo/views/index.views.dart';
import 'package:todo/views/profile.views.dart';
import 'package:todo/views/register.views.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/register',
      getPages: [
        GetPage(name: '/register', page: ()=>const RegisterPage()),
        GetPage(name: '/login', page: ()=>const AuthPage()),
        GetPage(name: '/todo', page: ()=>const TodoListPage()),
        GetPage(name: '/add', page: ()=>const AddTodoPage()),
        GetPage(name: '/profile', page: ()=>const ProfilePage()),
      ],
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
      debugShowCheckedModeBanner: false,
    );
  }
}
