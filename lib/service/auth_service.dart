import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newapp/cache/auth_cache_manager.dart';
import 'package:newapp/models/login_request_model.dart';
import 'package:newapp/models/login_response_model.dart';
import 'package:newapp/models/signup_request_model.dart';
import 'package:newapp/models/signup_response_model.dart';
import 'package:newapp/utils/api_extensions.dart';
import 'package:newapp/views/home_view.dart';

abstract class IAuthService {
  Future<LoginResponseModel?> postLogin(
      LoginRequestModel model, BuildContext context);
  Future<SignupResponseModel?> postSignup(
      SignupRequestModel SignupRequestModel);
}

class AuthService extends IAuthService {
  final Dio _networkManager =
      Dio(BaseOptions(baseUrl: '${ApiServiceConts.baseUrl.value}'));
  LoginResponseModel loginResponseModel = LoginResponseModel();
  SignupResponseModel signupResponseModel = SignupResponseModel();

  @override
  Future<LoginResponseModel?> postLogin(
      LoginRequestModel requestModel, BuildContext context) async {
    try {
      final response = await _networkManager
          .post(ApiServiceConts.loginPath.value, data: requestModel.toJson());
      if (response.statusCode == 200) {
        loginResponseModel = LoginResponseModel.fromJson(response.data);
        if (loginResponseModel.token != null) {
          await AuthCacheManager.saveUserToken(
              token: loginResponseModel.token!);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(),
              ));
          return loginResponseModel;
        }
      }
    } catch (e) {
      print(e.toString());
      //hata yönetimini burada yapmayı unutma!!!!!
      ///validate yapmayı unutma
    }
//eve.holt@reqres.in
//cityslicka
    return null;
  }

  @override
  Future<SignupResponseModel?> postSignup(
      SignupRequestModel signupRequestModel) async {
    try {
      final response = await _networkManager.post(
          ApiServiceConts.signupPath.value,
          data: signupRequestModel.toJson());
      if (response.statusCode == 200) {
        signupResponseModel = SignupResponseModel.fromJson(response.data);
        print('aaaaaaaaaaaaaaa${signupResponseModel.token}');
        await AuthCacheManager.saveUserToken(token: loginResponseModel.token!);
        return signupResponseModel;
      }
    } catch (e) {}
    return null;
  }
}
