import 'package:elephan/src/constants/text_string.dart';
import 'package:elephan/src/screen/pagedangkydangnhap/pagedangky/sign_up.dart';
import 'package:elephan/src/services_api/sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:elephan/src/screen/pagedangkydangnhap/pagequenmatkhau/forgot_password.dart';
import 'package:get/get.dart';

import '../../../components/button.dart';
import '../../../constants/shared_preferences.dart';
import '../../home_screen/home_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();

  Future<void> _navigateToPasswordLogin() async {
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PasswordLogin(
            phone: _controllerPhone.text,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Điền số',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'điện thoại!',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextFormField(
                      controller: _controllerPhone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vui lòng điền vào số điện thoại";
                        }
                        if (!RegExp(r"^(0|\\+84)[0-9]{9}$").hasMatch(value)) {
                          return "Số điện thoại sai định dạng";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "SỐ ĐIỆN THOẠI",
                        labelStyle: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground, // Màu sắc của tiêu đề
                          fontSize: 12, // Cỡ chữ của tiêu đề
                          fontWeight:
                              FontWeight.bold, // Trọng lượng chữ của tiêu đề
                        ),
                        hintText: "Nhập vào số điện thoại",
                        prefixIcon: Icon(Icons.phone),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _navigateToPasswordLogin();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Tiếp',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const SignUp());
                    },
                    child: Center(
                      child: Text(
                        Tregister,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}

class PasswordLogin extends StatefulWidget {
  PasswordLogin({super.key, required this.phone});
  final String phone;

  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  final _formKey = GlobalKey<FormState>();

  final _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Đăng nhập',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'Điền mật khẩu \nCủa bạn',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: TextFormField(
                      controller: _controllerPassword,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vui lòng điền vào mật khẩu";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Nhập mật khẩu",
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 221, 221, 221)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 228, 228, 228)),
                        ),
                        labelStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: btnSubmit(
                    height: 60,
                    backgroundColor: Theme.of(context).colorScheme.onBackground,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await SignInService.loginrUser(
                            widget.phone, _controllerPassword.text);

                        // Khi bạn nhận được phản hồi từ máy chủ sau khi đăng nhập thành công
                        final accessToken = response['data']['accessToken'];
                        final refreshToken = response['data']['refresh_token'];
                        final userInfo = response['data']['info'];

                        // Lưu thông tin vào Shared Preferences
                        final sharedPrefs =
                            await SharedPreferencesService.getInstance();
                        await sharedPrefs.setAccessToken(accessToken);
                        await sharedPrefs.setRefreshToken(refreshToken);
                        await sharedPrefs.setUser(userInfo);

                        //chuyển sang màn hình home nếu đăng nhập thành công
                        Get.off(const HomeScreen());
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
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
    );
  }
}
