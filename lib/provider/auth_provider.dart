import 'package:flutter/material.dart';
import 'package:newapp/models/login_request_model.dart';
import 'package:newapp/models/login_response_model.dart';
import 'package:newapp/models/signup_request_model.dart';
import 'package:newapp/models/signup_response_model.dart';
import 'package:newapp/service/auth_service.dart';
import 'package:newapp/views/home_view.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  ///text field obscure textin değişkeni
  bool isSecure = true;
  bool afterLoginAnimate = false;
  bool privacyCheckBoxStatus = false;
  AuthService _service = AuthService();
  LoginResponseModel? responseLogin = LoginResponseModel();
  SignupResponseModel? responseSignup = SignupResponseModel();

  ///post login
  /* Future<void> postLogin(
      LoginRequestModel requestModel, BuildContext context) async {
    afterLoginAnimate = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    responseLogin = await _service.postLogin(requestModel);
    disposeControllers();

    navigateToHome(context, HomeView());
    afterLoginAnimate = false;
    notifyListeners();
  }*/

  Future<void> postLogin(
      LoginRequestModel requestModel, BuildContext context) async {
    afterLoginAnimate = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    responseLogin = await _service.postLogin(requestModel);
    navigateToHome(context, HomeView());
    // disposeControllers(); // disposeControllers() burada çağrıldı
    afterLoginAnimate = false;
    notifyListeners();
  }

  ///post signup
  Future<void> postSignup(
      SignupRequestModel requestModel, BuildContext context) async {
    afterLoginAnimate = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    responseSignup = await _service.postSignup(requestModel);
    navigateToHome(context, HomeView());
    afterLoginAnimate = false;
    // disposeControllers();
    notifyListeners();
  }

  ///text field obscure textin değişkeninin tersini alır
  void changeIsSecure() {
    isSecure = !isSecure;
    notifyListeners();
  }

  void changeCheckBoxStatus() {
    privacyCheckBoxStatus = !privacyCheckBoxStatus;
    notifyListeners();
  }

  void navigateToHome(BuildContext context, Widget route) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ));
  }

  void disposeControllers() {
    // mailController.dispose();
    //  passwordController.dispose();
    notifyListeners();
  }
}
