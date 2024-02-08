import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/app_constant.dart';
import 'package:newapp/views/Signup_view.dart';
import 'package:newapp/views/login_view.dart';
import 'package:newapp/views/splash_screen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      /* child: EasyLocalization(
          supportedLocales: [AppConstant.EN_LOCALE, AppConstant.TR_LOCALE],
          path: AppConstant.LANG_PATH,
          child: const MyApp())));*/
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOGIN/SIGNUP/CACHING/MONGODB',
      home: SplashScreenView(),
    );
  }
}
