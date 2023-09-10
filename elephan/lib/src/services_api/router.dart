import 'package:flutter_dotenv/flutter_dotenv.dart';

class Router {
  static String checkPhone =
      '${dotenv.env["URL_SERVER"]}/user/auth/checkmailphone';
  static String register = '${dotenv.env["URL_SERVER"]}/user/auth/register';
  static String activeCodeEmail =
      '${dotenv.env["URL_SERVER"]}/user/auth/activated';

  static String login = '${dotenv.env["URL_SERVER"]}/user/auth/login';
  static String getProduct = '${dotenv.env["URL_SERVER"]}/user/product/all';
}
