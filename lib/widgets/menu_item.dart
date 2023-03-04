import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final String page;

  const AppMenuItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.selected, required this.page})
      : super(key: key);
  @override
  State<AppMenuItem> createState() => _AppMenuItemState();
}

class _AppMenuItemState extends State<AppMenuItem> {
  @override
  Widget build(BuildContext context) {
    final String title = widget.title;
    final IconData icon = widget.icon;
    final bool selected = widget.selected;
    final String page = widget.page;

    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
            Get.toNamed(page);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
