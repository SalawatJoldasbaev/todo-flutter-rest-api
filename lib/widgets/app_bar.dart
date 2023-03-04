import 'package:flutter/material.dart'; 


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
