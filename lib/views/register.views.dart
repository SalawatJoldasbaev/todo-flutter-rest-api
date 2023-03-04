// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:todo/components/button.dart';
import 'package:todo/components/square_tile.dart';
import 'package:todo/components/text_filed.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/registeration_controller.dart';
import 'package:todo/views/auth.views.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/views/index.views.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterationController registerationController =
      Get.put(RegisterationController());
  _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if(token != null){
      Get.offAndToNamed('/todo');
    }
  }
  @override
  void initState() {
    _loadUser();
    registerationController.phoneController.text = '+998';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.lock, size: 100, color: Colors.black),
              const SizedBox(height: 50),
              Text(
                'Sign Up for free!',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              ),
              const SizedBox(height: 25),
              MyTextFiled(
                type: TextInputType.phone,
                controller: registerationController.nameController,
                hintText: 'Name',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextFiled(
                type: TextInputType.phone,
                controller: registerationController.phoneController,
                hintText: 'Phone',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextFiled(
                controller: registerationController.passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                  onTap: registerationController.registerWithPhone,
                  text: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey.shade700)),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SquareTile(imagePath: 'lib/images/google.png'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'lib/images/apple.png')
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have a account?',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: const Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
