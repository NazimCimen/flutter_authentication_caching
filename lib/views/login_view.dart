import 'package:flutter/material.dart';
import 'package:newapp/models/login_request_model.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/app_background.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/views/Signup_view.dart';
import 'package:newapp/views/components/custom_button.dart';
import 'package:newapp/views/components/email_text_form_field.dart';
import 'package:newapp/views/components/password_text_field.dart';
import 'package:newapp/views/home_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        const GradientBackgroundContainer(),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(flex: 18),
              const Expanded(
                flex: 10,
                child: FittedBox(
                  child: Text(
                    'Welcome!',
                    style: MyStyles.myTextStyle,
                  ),
                ),
              ),
              const Spacer(flex: 3),
              const Expanded(
                flex: 5,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                  child: FittedBox(
                    child: Text('Discover all the events that interest you!',
                        style: MyStyles.myTextStyle),
                  ),
                ),
              ),
              const Spacer(flex: 5),
              const Expanded(
                flex: 10,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                  child: CustomTextField(
                    type: TextInputType.emailAddress,
                    hint: 'email',
                    icon: Icons.email_outlined,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              const Expanded(
                flex: 10,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                  child: PasswordTextField(),
                ),
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 3,
                child: buildInkwellButton(context, 'Forget Password?'),
              ),
              Expanded(
                flex: 15,
                child: FractionallySizedBox(
                    heightFactor: 0.5,
                    widthFactor: 0.8,
                    child: CustomButton(
                      text: 'Log in',
                      onPressed: () async {
                        context.read<AuthProvider>().postLogin(
                            LoginRequestModel(
                                email: context
                                    .read<AuthProvider>()
                                    .mailController
                                    .text,
                                password: context
                                    .read<AuthProvider>()
                                    .passwordController
                                    .text),
                            context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()));
                      },
                    )),
              ),
              Expanded(
                flex: 4,
                child: FittedBox(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: FittedBox(
                      child: Visibility(
                          visible:
                              context.watch<AuthProvider>().afterLoginAnimate,
                          child: SpinKitThreeBounce(
                            color: MyColors.myBrown,
                            size: 24,
                          )),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 5),
              Expanded(
                  flex: 3,
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignupView())));
                      },
                      child: FittedBox(
                          child: Row(
                        children: [
                          const Text(
                            'Do not have any account?',
                            style: MyStyles.myTextStyle,
                          ),
                          Text(' Sign up',
                              style: MyStyles.myTextStyle
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ],
                      )))),
              const Spacer(flex: 5),
            ],
          ),
        )
      ]),
    );
  }

  ///Forgot Password? button
  InkWell buildInkwellButton(BuildContext context, String text) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
        },
        child: FittedBox(
          child: Text(text, style: MyStyles.myTextStyle),
        ));
  }
}
