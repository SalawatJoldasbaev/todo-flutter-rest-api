import 'package:flutter/material.dart';
import 'package:todo/widgets/menu_item.dart';


class AppDrawerList extends StatefulWidget {
  final String pageName;
  const AppDrawerList({Key? key, required this.pageName}) : super(key: key);

  @override
  State<AppDrawerList> createState() => _AppDrawerListState();
}

class _AppDrawerListState extends State<AppDrawerList> {
  @override
  Widget build(BuildContext context) {
    final String pageName = widget.pageName;
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          AppMenuItem(
            title: 'Todo',
            icon: Icons.add,
            selected: '/todo' == pageName,
            page: '/todo',
          ),
          AppMenuItem(
            title: 'Profile',
            icon: Icons.person,
            selected: '/profile' == pageName,
            page: '/profile',
          ),
        ],
      ),
    );
  }
}
