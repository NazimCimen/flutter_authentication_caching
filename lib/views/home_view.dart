import 'package:flutter/material.dart';
import 'package:newapp/cache/auth_cache_manager.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/views/components/custom_button.dart';
import 'package:newapp/views/login_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(context.watch<AuthProvider>().responseLogin?.token ??
              'null geldi')),
      body: Center(
          child: CustomButton(
        onPressed: () async {
          await AuthCacheManager.deleteUserToken();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
        },
        text: 'Log Out',
      )),
    );
  }
}
