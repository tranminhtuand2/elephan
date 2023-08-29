import 'package:elephan/src/services_api/sign_up_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/button.dart';
import '../pagedangnhap/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Vui lòng nhập \nSố Điện Thoại',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: TextFormField(
                    maxLength: 10,
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
                      fillColor: Theme.of(context).colorScheme.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: btnSubmit(
                    height: 50,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // var checkPhone = await SignUpService.checkPhoneNumber(
                        //     _controllerPhone.text);

                        // if (checkPhone) {
                        //   Get.to(
                        //     SignUpPasswordPage(
                        //       phoneNumber: _controllerPhone.text,
                        //     ),
                        //   );
                        // } else {
                        //   Get.to(PasswordLogin(
                        //     phone: _controllerPhone.text,
                        //   ));
                        // }
                        Get.to(
                          SignUpPasswordPage(
                            phoneNumber: _controllerPhone.text,
                          ),
                        );
                      }
                    },
                    text: Text(
                      'Tiếp',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
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

class SignUpPasswordPage extends StatefulWidget {
  final String phoneNumber;

  const SignUpPasswordPage({super.key, required this.phoneNumber});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPasswordPageState createState() => _SignUpPasswordPageState();
}

class _SignUpPasswordPageState extends State<SignUpPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Đăng ký',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Mời nhập \nMật Khẩu',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
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
                      labelText: "Mật Khẩu",
                      labelStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground, // Màu sắc của tiêu đề
                        fontSize: 16, // Cỡ chữ của tiêu đề
                        fontWeight:
                            FontWeight.bold, // Trọng lượng chữ của tiêu đề
                      ),
                      hintText: "Nhập mật khẩu",
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextFormField(
                    controller: _controllerConfirmPassword,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui lòng xác nhận mật khẩu";
                      }
                      if (value != _controllerPassword.text) {
                        return "Mật khẩu xác nhận không khớp";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Xác nhận mật khẩu",
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      labelText: "xác nhận lại mật khẩu",
                      labelStyle: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground, // Màu sắc của tiêu đề
                        fontSize: 16, // Cỡ chữ của tiêu đề
                        fontWeight:
                            FontWeight.bold, // Trọng lượng chữ của tiêu đề
                      ),
                      fillColor: Theme.of(context).colorScheme.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: btnSubmit(
                  height: 60,
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final register = await SignUpService.registerUser(
                          widget.phoneNumber, _controllerConfirmPassword.text);
                      if (register) {
                        // Get.off(const HomeScreen());
                        Get.snackbar('Đăng ký thành công!',
                            'Hãy đăng nhập để sử dụng dịch vụ');
                        Get.off(PasswordLogin(
                          phone: widget.phoneNumber,
                        ));
                      }
                    }
                  },
                  text: Text(
                    'Tiếp',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpNamePage extends StatefulWidget {
  final String phoneNumber;
  final String password;

  const SignUpNamePage(
      {super.key, required this.phoneNumber, required this.password});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpNamePageState createState() => _SignUpNamePageState();
}

class _SignUpNamePageState extends State<SignUpNamePage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerFirstName = TextEditingController();
  final _controllerLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Đăng ký',
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: SafeArea(
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
                      'Điền vào',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'họ và tên!',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          controller: _controllerFirstName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Vui lòng điền vào họ";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Họ",
                            filled: true,
                            fillColor: Color.fromARGB(255, 245, 245, 245),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelStyle: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          controller: _controllerLastName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Vui lòng điền vào tên";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Tên",
                            filled: true,
                            fillColor: Color.fromARGB(255, 245, 245, 245),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelStyle: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
