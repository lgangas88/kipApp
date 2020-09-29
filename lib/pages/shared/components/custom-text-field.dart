import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function onSaved;
  final Function validate;
  final String placeholder;
  final bool isObscure;

  const CustomTextField(
      {Key key,
      @required this.onSaved,
      this.validate,
      this.placeholder,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        obscureText: this.isObscure,
        onSaved: (String value) => this.onSaved(value),
        validator: this.validate,
        decoration: InputDecoration(
            hintText: this.placeholder,
            filled: true,
            fillColor: Colors.white38,
            border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      ),
    );
  }
}
