import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/input_field.dart';
import '../../../components/my_button.dart';
import '../pagequenmatkhau/reset_password_page.dart';

class SignUpEmailPage extends StatefulWidget {
  final String phoneNumber;

  const SignUpEmailPage({super.key, required this.phoneNumber});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpEmailPageState createState() => _SignUpEmailPageState();
}

class _SignUpEmailPageState extends State<SignUpEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                    'địa chỉ email',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 20, top: 20),
                  child: InputField(
                      controller: _controllerEmail,
                      inputType: TextInputType.emailAddress,
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Vui lòng điền vào địa chỉ email";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return "Địa chỉ email không hợp lệ";
                        }
                        return null;
                      }),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.to(() => ResetPasswordPage(
                              valueEmail: _controllerEmail.text,
                              valuePhone: widget.phoneNumber,
                              isSignUp:
                                  true, //dùng chung màn hình với resetpass page
                            ));
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
