import 'package:elephan/src/screen/signin_signup/pagedangnhap/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/input_field.dart';
import '../../../components/loading.dart';
import '../../../components/my_button.dart';
import '../../../getx_controller/auth_controller.dart';
import '../../../utils/themes/theme_color.dart';

class ResetPasswordPage extends StatefulWidget {
  final String? valueEmail;
  final String? valuePhone;
  final String? valuePhoneOrEmail;
  final bool? isSignUp;

  const ResetPasswordPage({
    super.key,
    this.isSignUp = false,
    this.valueEmail,
    this.valuePhone,
    this.valuePhoneOrEmail,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerNewPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return Loading();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nhập mật khẩu \nmới của bạn',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputField(
                            controller: _controllerNewPassword,
                            inputType: TextInputType.text,
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Nhập mật khẩu',
                            isPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Vui lòng điền vào mật khẩu";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          InputField(
                            controller: _controllerConfirmPassword,
                            inputType: TextInputType.text,
                            prefixIcon: const Icon(Icons.lock),
                            labelText: 'Nhập lại mật khẩu',
                            isPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Vui lòng xác nhận mật khẩu ";
                              }
                              if (value != _controllerNewPassword.text) {
                                return "Mật khẩu xác nhận không khớp";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      MyButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (widget.isSignUp!) {
                              //Người dùng đăng kí mới tài khoản
                              controller.signUp(
                                phone: widget.valuePhone ?? '',
                                email: widget.valueEmail ?? '',
                                password: _controllerConfirmPassword.text,
                              );
                            } else {
                              //Người dùng reset mật khẩu khi quên mật khẩu
                              Get.offAll(() => const LoginScreen());
                            }
                          }
                        },
                        text: const Text(
                          'Xác nhận',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: colorScheme(context).onBackground,
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
