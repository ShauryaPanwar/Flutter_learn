import 'package:flutter/material.dart';

import '../utils/textfieldstyle.dart';

class Logintextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool hasaster;

  const Logintextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.hasaster=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasaster,
      validator: (value) {

        if(validator!=null)
          return validator!(value);
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: ThemetextStyle.logintextfieldstyle,
      ),
    );
  }
}
