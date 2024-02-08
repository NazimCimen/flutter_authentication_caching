enum ApiServiceConts {
  baseUrl,
  loginPath,
  signupPath,
}

extension ApiPathsExtension on ApiServiceConts {
  String get value {
    switch (this) {
      case ApiServiceConts.baseUrl:
        return 'https://reqres.in';
      case ApiServiceConts.loginPath:
        return '/api/login';
      case ApiServiceConts.signupPath:
        return '/api/register';
    }
  }
}
