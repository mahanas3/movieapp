import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
        required this.text1,
        required this.text2,
        this.icon,
        required this.controller,
        this.icon1,
        this.validator});

  String text1;
  String text2;
  Widget? icon;
  Widget? icon1;

  final TextEditingController controller;

  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff67686D),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        hintText: widget.text1,
        labelText: widget.text2,
        hintStyle: const TextStyle(color: Colors.white, fontFamily: 'popins2'),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'popins2',
        ),
        prefixIcon: widget.icon1,
        prefixIconColor: Colors.white,
        suffixIcon: widget.icon,
        suffixIconColor: Colors.white,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
}
