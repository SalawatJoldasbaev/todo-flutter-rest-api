import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  const MyButton({Key? key, required this.onTap, required this.text}) : super(key: key);
  final Function()? onTap;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
