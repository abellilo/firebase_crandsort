import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obsucreText;
  final String hintText;

  MyTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obsucreText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: obsucreText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14
          ),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          fillColor: Colors.white,
          filled: true
        ),
      ),
    );
  }
}
