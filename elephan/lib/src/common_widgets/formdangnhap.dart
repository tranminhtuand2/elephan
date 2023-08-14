// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  const textformfield({
    Key? key,
    required this.hintext,
    required this.labeltext,
    required this.icon,
    required this.regExp,
    required this.isempty,
    required this.wrongtype,
    required this.textcontroller,
    required this.hint,
  }) : super(key: key);
  final String hintext;
  final String labeltext;
  final Icon icon;
  final dynamic regExp;
  final String isempty;
  final String wrongtype;
  final TextEditingController textcontroller;
  final bool hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: hint,
        controller: textcontroller,
        decoration: InputDecoration(
          hintText: hintext,
          labelText: labeltext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          prefixIcon: icon,

          suffixIcon: textcontroller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  onPressed: () => textcontroller.clear(),
                  icon: Icon(Icons.close),
                ),
          // suffixIcon: Icon(Icons.close),
        ),
        validator: (value) => value!.isEmpty
            ? isempty
            : RegExp(regExp).hasMatch(value)
                ? null
                : wrongtype);
  }
}
