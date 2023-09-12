import 'package:elephan/src/getx_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:elephan/src/screen/signin_signup/pagequenmatkhau/forgot_password.dart';
import 'package:get/get.dart';

import '../../../components/input_field.dart';
import '../../../components/my_button.dart';
import '../../../constants/text_string.dart';

import '../../../utils/themes/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();

  var controller = Get.put(AuthController());

  void checkPhoneAndNavigator() async {
    controller.checkPhoneNumber(phone: _controllerPhone.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
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
                  'số điện thoại',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: InputField(
                  controller: _controllerPhone,
                  inputType: TextInputType.phone,
                  labelText: 'Số Điện Thoại',
                  prefixIcon: const Icon(Icons.phone),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Vui lòng điền vào số điện thoại";
                    }
                    if (!RegExp(r"^(0|\\+84)[0-9]{9}$").hasMatch(value)) {
                      return "Số điện thoại sai định dạng";
                    }
                    return null;
                  },
                  maxLength: 10,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      checkPhoneAndNavigator();
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

              TextButton(
                onPressed: () {
                  // Get.to(() => SignUpPasswordPage(
                  //     phoneNumber: _controllerPhone.text));
                },
                child: Center(
                  child: Text(
                    Tregister,
                    style: text(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordLogin extends StatefulWidget {
  const PasswordLogin({super.key, this.phone, this.email});
  final String? phone;
  final String? email;

  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  final _formKey = GlobalKey<FormState>();

  final _controllerPassword = TextEditingController();
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: const Text(
                          'Xin mời \nnhập mật khẩu',
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 20),
                    child: InputField(
                      controller: _controllerPassword,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: MyButton(
                      height: 60,
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          controller.signIn(
                            password: _controllerPassword.text,
                            email: widget.email,
                            phone: widget.phone,
                          );
                        }
                      },
                      text: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Get.to(() => const ForgotPassword()),
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
