import 'package:elephan/src/components/loading.dart';
import 'package:elephan/src/constants/size.dart';
import 'package:elephan/src/getx_controller/auth_controller.dart';
import 'package:elephan/src/screen/pagegioithieu/splash_screen/splash_screen.dart';
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
          fontFamily: GoogleFonts.manrope().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.lightColorScheme,
          textTheme: TAppTextTheme.lightTextTheme),
      darkTheme: ThemeData(
          fontFamily: GoogleFonts.manrope().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.darkColorScheme,
          textTheme: TAppTextTheme.darkTextTheme),
      home: Builder(
        builder: (context) {
          final authController = Get.put(AuthController());
          return Obx(
            () {
              return Stack(
                children: [
                  SplashScreen(),
                  authController.isLoading.value ? Loading() : const SizedBox(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
