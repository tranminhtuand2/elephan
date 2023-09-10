import 'dart:developer';

import 'package:flutter/material.dart';

// Widget inputField(TextEditingController controller, String hint,
//     TextInputType keyboardType, GlobalKey key) {
//   return Form(
//     key: key,
//     child: SizedBox(
//       height: 72,
//       child: TextFormField(
//         controller: controller,
//         validator: (value) {
//           if (value == '') {
//             return "Không bỏ trống";
//           }
//           if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value!)) {
//             return 'Không chứa kí tự đặc biệt';
//           }
//           return null;
//         },
//         keyboardType: keyboardType,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         decoration: InputDecoration(
//             hintText: hint,
//             alignLabelWithHint: true,
//             hintStyle: const TextStyle(fontSize: 15),
//             contentPadding: const EdgeInsets.only(left: 16),
//             border: const OutlineInputBorder(
//                 borderSide: BorderSide(width: 0.2),
//                 borderRadius: BorderRadius.all(Radius.circular(6))),
//             focusedBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(6)),
//             ),
//             floatingLabelBehavior: FloatingLabelBehavior.never),
//       ),
//     ),
//   );
// }

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
    required this.inputType,
    this.height,
    this.validator,
    this.maxLength,
    this.enable = true,
  });
  final TextEditingController controller;
  final String labelText;
  final Icon prefixIcon;
  final bool isPassword, enable;
  final TextInputType inputType;
  final double? height;
  final int? maxLength;

  final String? Function(String?)? validator; // Hàm validator
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isShowEye = true;

  @override
  Widget build(BuildContext context) {
    void clickShowPass() {
      setState(() {
        _isShowEye = !_isShowEye;
      });
    }

    return SizedBox(
      height: widget.height,
      child: TextFormField(
        enabled: widget.enable,
        cursorColor: Colors.black,
        keyboardType: widget.inputType,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: widget.isPassword && _isShowEye,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          // fillColor: const Color.fromARGB(255, 245, 245, 245),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    clickShowPass();
                    log(_isShowEye.toString());

                    // widget.clickShowPass?.call();
                  },
                  child: Icon(
                    !_isShowEye ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : const SizedBox(),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
              width: 1, color: Colors.grey,
              // style: BorderStyle.none,
            ),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }
}
