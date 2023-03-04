// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo/widgets/app_bar.dart';
import 'package:todo/widgets/drawer.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'TODO APP'),
      body: Center(child: Text('Profile')),
      drawer: DrawerMenu(pageName: '/profile',),
    );
  }
}
