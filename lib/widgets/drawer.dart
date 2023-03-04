import 'package:flutter/material.dart';
import 'package:todo/widgets/drawer_header.dart';
import 'package:todo/widgets/drawer_list.dart';

class DrawerMenu extends StatefulWidget {
  final String pageName;
  const DrawerMenu({Key? key, required this.pageName}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final pageName = widget.pageName;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppDrawerHeader(user: {'name': 'sake'},),
            AppDrawerList(pageName: pageName),
          ],
        ),
      ),
    );
  }
}
