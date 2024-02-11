import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/app_constant.dart';
import 'package:newapp/utils/locale_constants.dart';
import 'package:newapp/views/Signup_view.dart';
import 'package:newapp/views/login_view.dart';
import 'package:newapp/views/splash_screen_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
    child: EasyLocalization(
        supportedLocales: [LocaleConstants.enLocale, LocaleConstants.trLocale],
        path: LocaleConstants.localePath,
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'LOGIN/SIGNUP/CACHING/MONGODB',
      home: SplashScreenView(),
    );
  }
}
