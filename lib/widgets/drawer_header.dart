import 'package:flutter/material.dart';
import 'package:todo/services/user_service.dart';

class AppDrawerHeader extends StatefulWidget {
  final Map user;
  const AppDrawerHeader({Key? key, required this.user}) : super(key: key);

  @override
  State<AppDrawerHeader> createState() => _AppDrawerHeaderState();
}

class _AppDrawerHeaderState extends State<AppDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Container(
      color: Colors.green.shade700,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('lib/images/me.jpg'),
              ),
            ),
          ),
          Text(user['name'],
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
