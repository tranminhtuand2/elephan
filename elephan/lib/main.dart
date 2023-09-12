import 'package:elephan/src/components/loading.dart';
import 'package:elephan/src/constants/size.dart';
import 'package:elephan/src/getx_controller/auth_controller.dart';
import 'package:elephan/src/screen/sanpham_screen/chitietsanpham.dart';
import 'package:elephan/src/screen/signin_signup/pagedangnhap/sign_in.dart';
import 'package:elephan/src/utils/themes/text_theme.dart';
import 'package:elephan/src/utils/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.lightColorScheme,
          textTheme: TAppTextTheme.lightTextTheme),
      darkTheme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.darkColorScheme,
          textTheme: TAppTextTheme.darkTextTheme),
      home: const ChiTietSanPham(),
    //   Stack(
    //     children: [
    //       const LoginScreen(),
    //       Obx(() {
    //         final authController = Get.find<AuthController>();
    //         return authController.isLoading.value
    //             ? Loading()
    //             : const SizedBox();
    //       }),
    //     ],
    //   ),
    );
  }
}
