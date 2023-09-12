import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../components/my_button.dart';
import '../../../getx_controller/auth_controller.dart';
import '../../../utils/themes/text_theme.dart';
import '../../../utils/themes/theme_color.dart';

class ForgotPasswordOTPPage extends StatefulWidget {
  final String? valueEmail;
  final String? valuePhone;

  const ForgotPasswordOTPPage({super.key, this.valueEmail, this.valuePhone});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordOTPState createState() => _ForgotPasswordOTPState();
}

class _ForgotPasswordOTPState extends State<ForgotPasswordOTPPage> {
  final _formKey = GlobalKey<FormState>();
  // final pinController = TextEditingController();
  String numberPin = '';

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Nhập OTP',
          style:
              text(context).titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Nhập OTP \nnhận được \ntừ email',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: enterPin(context),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    controller.activeCodeEmail(
                      email: widget.valueEmail ?? '',
                      code: int.parse(numberPin.trim()),
                    );
                  }
                },
                backgroundColor: colorScheme(context).onBackground,
                height: 60,
                text: Text(
                  'Tiếp tục',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PinCodeTextField enterPin(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      textStyle:
          text(context).titleLarge?.copyWith(fontWeight: FontWeight.bold),
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 6) {
          return "Mã pin gồm 6 số";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 60,
        fieldWidth: 60,
        activeColor: Colors.transparent,
        inactiveColor: const Color.fromARGB(255, 216, 215, 215),
        inactiveFillColor: Colors.transparent,
        selectedColor: Colors.white,
        activeFillColor: Colors.teal.withOpacity(0.4),
        disabledColor: Colors.red,
        selectedFillColor: Colors.teal.withOpacity(0.2),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (v) {
        print("Completed $v");
      },
      onChanged: (value) {
        print(value);
        setState(() {
          numberPin = value;
        });
      },
      appContext: context,
    );
  }
}
