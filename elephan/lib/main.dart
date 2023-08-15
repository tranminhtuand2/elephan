import 'package:elephan/src/constants/size.dart';
import 'package:elephan/src/screen/pagegioithieu/splashScreen/splashscreen.dart';
import 'package:elephan/src/utils/theme/texttheme.dart';
import 'package:elephan/src/utils/theme/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
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
          fontFamily: GoogleFonts.roboto().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.lightColorScheme,
          textTheme: TAppTextTheme.lightTextTheme),
      darkTheme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          useMaterial3: true,
          colorScheme: TAppTheme.darkColorScheme,
          textTheme: TAppTextTheme.darkTextTheme),
      ////test giao diện xong chú ý trả về giao diện  SplashScreen()

      home: SplashScreen(),
    );
  }
}
