import 'dart:js';

import 'package:flutter/material.dart';
import 'package:newapp/models/login_request_model.dart';
import 'package:newapp/models/login_response_model.dart';
import 'package:newapp/models/signup_request_model.dart';
import 'package:newapp/models/signup_response_model.dart';
import 'package:newapp/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  ///text field obscure textin değişkeni
  bool isSecure = true;
  bool afterLoginAnimate = false;
  bool privacyCheckBoxStatus = false;
  AuthService _service = AuthService();
  LoginResponseModel? responseLogin = LoginResponseModel();
  SignupResponseModel? responseSignup = SignupResponseModel();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  ///post login
  Future<void> postLogin(
      LoginRequestModel requestModel, BuildContext context) async {
    afterLoginAnimate = true;
    responseLogin = await _service.postLogin(requestModel, context);
    afterLoginAnimate = false;
    notifyListeners();
  }

  ///post signup
  Future<void> postSignup(SignupRequestModel requestModel) async {
    afterLoginAnimate = true;
    responseSignup = await _service.postSignup(requestModel);
    afterLoginAnimate = false;
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
}
