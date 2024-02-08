import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newapp/models/signup_request_model.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/app_background.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/views/components/custom_button.dart';
import 'package:newapp/views/components/email_text_form_field.dart';
import 'package:newapp/views/components/password_text_field.dart';
import 'package:newapp/views/home_view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GradientBackgroundContainer(),
          Column(
            children: [
              const Spacer(flex: 13),
              Expanded(
                flex: 10,
                child: FittedBox(
                  child: Text(
                    'Please sign up first\n to discover events',
                    style: MyStyles.myTextStyle,
                  ),
                ),
              ),
              const Spacer(flex: 4),
              Expanded(
                  flex: 10,
                  child: FractionallySizedBox(
                    heightFactor: 0.8,
                    widthFactor: 0.8,
                    child: CustomTextField(
                      type: TextInputType.emailAddress,
                      hint: 'email',
                      icon: Icons.email_outlined,
                    ),
                  )),
              const Spacer(flex: 3),
              Expanded(
                flex: 10,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  widthFactor: 0.8,
                  child: PasswordTextField(),
                ),
              ),
              const Spacer(flex: 4),
              Expanded(
                flex: 5,
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: MyColors.myBrown,
                          value: context
                              .watch<AuthProvider>()
                              .privacyCheckBoxStatus,
                          onChanged: (bool? value) {
                            context.read<AuthProvider>().changeCheckBoxStatus();
                          },
                        ),
                        InkWell(
                          onTap: () {
                            ///sözleşme ve gizlilik onayları için sayfaya yönlendirilecek
                          },
                          child: Text(
                            'By signing up, I agree to Terms of Use & Privacy Policy',
                            style: MyStyles.myTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: MyColors.myBrown),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                  widthFactor: 0.8,
                  child: CustomButton(
                      text: 'SignUp',
                      onPressed: () async {
                        context.read<AuthProvider>().postSignup(
                            SignupRequestModel(
                                email: context
                                    .read<AuthProvider>()
                                    .mailController
                                    .text,
                                password: context
                                    .read<AuthProvider>()
                                    .passwordController
                                    .text));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeView()));
                      }),
                ),
              ),
              const Spacer(flex: 4),
              Expanded(
                  flex: 4,
                  child: Center(
                    child: FittedBox(
                      child: SizedBox(
                        width: 755,
                        height: 755,
                        child: FittedBox(
                          child: Visibility(
                              visible: context
                                  .watch<AuthProvider>()
                                  .afterLoginAnimate,
                              child: SpinKitThreeBounce(
                                color: MyColors.myBrown,
                                size: 24,
                              )),
                        ),
                      ),
                    ),
                  )),
              const Spacer(flex: 18)
            ],
          )
        ],
      ),
    );
  }
}
