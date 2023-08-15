import 'package:flutter/material.dart';

Widget inputField(TextEditingController controller, String hint,
    TextInputType keyboardType, GlobalKey key) {
  return Form(
    key: key,
    child: SizedBox(
      height: 72,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == '') {
            return "Không bỏ trống";
          }
          if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value!)) {
            return 'Không chứa kí tự đặc biệt';
          }
          return null;
        },
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: hint,
            alignLabelWithHint: true,
            hintStyle: const TextStyle(fontSize: 15),
            contentPadding: const EdgeInsets.only(left: 16),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    ),
  );
}
