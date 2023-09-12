import 'dart:developer';

import 'package:elephan/src/components/snack_bar_getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/input_field.dart';
import '../../../components/my_button.dart';
import '../../../utils/themes/text_theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _showForgotEmail = ValueNotifier(false);
  bool isChoiceEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quên mật khẩu',
          style:
              text(context).titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Mời nhập',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'email đăng ký',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 20, top: 30),
                  child: InputField(
                    enable: isChoiceEmail,
                    controller: _controllerEmail,
                    inputType: TextInputType.emailAddress,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (!isChoiceEmail) {
                        return null;
                      }
                      if (value!.isEmpty) {
                        return "Vui lòng điền vào địa chỉ email";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                          .hasMatch(value)) {
                        return "Địa chỉ email không hợp lệ";
                      }
                      return null;
                    },
                  ),
                ),

                ValueListenableBuilder<bool>(
                  valueListenable: _showForgotEmail,
                  builder: (context, value, child) {
                    return AnimatedCrossFade(
                        sizeCurve: Curves.linearToEaseOut,
                        firstChild: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChoiceEmail = !isChoiceEmail;
                                  log('isChoiceEmail $isChoiceEmail');
                                  _showForgotEmail.value =
                                      !_showForgotEmail.value;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.chevron_up,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('Ẩn bớt '),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20, bottom: 20),
                              child: InputField(
                                controller: _controllerPhone,
                                enable: !isChoiceEmail,
                                inputType: TextInputType.phone,
                                labelText: 'Số Điện Thoại',
                                prefixIcon: const Icon(Icons.phone),
                                validator: (value) {
                                  if (isChoiceEmail) {
                                    return null;
                                  }
                                  if (value!.isEmpty) {
                                    return "Vui lòng điền vào số điện thoại";
                                  }
                                  if (!RegExp(r"^(0|\\+84)[0-9]{9}$")
                                      .hasMatch(value)) {
                                    return "Số điện thoại sai định dạng (số 0 ở đầu tiên)";
                                  }
                                  return null;
                                },
                                maxLength: 10,
                              ),
                            ),
                          ],
                        ),
                        secondChild: InkWell(
                          onTap: () {
                            setState(() {
                              isChoiceEmail = !isChoiceEmail;
                              log('isChoiceEmail $isChoiceEmail');
                              _showForgotEmail.value = !_showForgotEmail.value;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.chevron_down,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('Hoặc lấy lại mật khẩu bằng SĐT'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        crossFadeState: value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200));
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        //Xử lý khi người dùng quên mật khẩu với 2 kiểu email hoặc sđt
                        showCustomSnackBar(
                            title: "Warning",
                            message: "Chức năng đang phát triển",
                            type: Type.warning);
                        // Get.to(
                        //   () => ForgotPasswordOTPPage(
                        //     valuePhoneOrEmail: isChoiceEmail
                        //         ? _controllerEmail.text
                        //         : _controllerPhone.text,
                        //   ),
                        // );
                      }
                    },
                    backgroundColor: Colors.black,
                    height: 60,
                    text: const Text(
                      'Tiếp tục',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //trang đăng ký
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
