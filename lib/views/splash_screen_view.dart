import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newapp/cache/auth_cache_manager.dart';
import 'package:newapp/utils/app_background.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/string_constants.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/views/home_view.dart';
import 'package:newapp/views/login_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  String? token;
  @override
  void initState() {
    tokenControl();
    super.initState();
  }

  Future<void> tokenControl() async {
    token = await AuthCacheManager.fetchUserToken();
    await Future.delayed(Duration(seconds: 3));
    if (token == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GradientBackgroundContainer(),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            children: [
              Text(
                StringConstants.loading,
                style: MyStyles.myTextStyle,
              ),
              SpinKitCircle(
                color: MyColors.myBrown,
                size: 42,
              )
            ],
          ),
        )
      ]),
    );
  }
}
