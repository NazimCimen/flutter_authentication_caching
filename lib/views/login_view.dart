import 'package:flutter/material.dart';
import 'package:newapp/models/login_request_model.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/app_background.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/size_extensions.dart';
import 'package:newapp/utils/string_constants.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/utils/text_editing_controller.dart';
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
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.verticalSizedBox(0.15),
            SizedBox(
              height: context.dynamicHeight(0.1),
              child: buildTextWelcome(),
            ),
            context.verticalSizedBox(0.05),
            SizedBox(
              height: context.dynamicHeight(0.15),
              child: buildEmailInputWidget(),
            ),
            SizedBox(
              height: context.dynamicHeight(0.15),
              child: buildPasswordInputWidget(),
            ),
            SizedBox(
              height: context.dynamicHeight(0.04),
              child: buildInkwellButton(context, 'Forget Password?'),
            ),
            SizedBox(
              height: context.dynamicHeight(0.14),
              child: buildButton(context),
            ),
            SizedBox(
              height: context.dynamicHeight(0.04),
              child: buildVisiblityAnimationWidget(context),
            ),
            context.verticalSizedBox(0.1),
            SizedBox(
              height: context.dynamicHeight(0.035),
              child: buildInkWellNavigatoToSignup(context),
            ),
          ],
        )

      ]),
    );
  }

  FittedBox buildVisiblityAnimationWidget(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 25,
        height: 25,
        child: FittedBox(
          child: Visibility(
              visible: context.watch<AuthProvider>().afterLoginAnimate,
              child: SpinKitThreeBounce(
                color: MyColors.myBrown,
                size: 24,
              )),
        ),
      ),
    );
  }

  FractionallySizedBox buildButton(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 0.8,
        child: CustomButton(
          text: 'Log in',
          onPressed: () async {
            context.read<AuthProvider>().postLogin(
                LoginRequestModel(
                  email: MyTextEditingController.mailController.text,
                  password: MyTextEditingController.passwordController.text,
                ),
                context);
            //   context.read<AuthProvider>().disposeControllers();
          },
        ));
  }

  InkWell buildInkWellNavigatoToSignup(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SignupView())));
        },
        child: FittedBox(
            child: Row(
          children: [
            const Text(
              'Do not have any account?',
              style: MyStyles.myTextStyle,
            ),
            Text(' Sign up',
                style:
                    MyStyles.myTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ],
        )));
  }

  FractionallySizedBox buildPasswordInputWidget() {
    return FractionallySizedBox(
      heightFactor: 0.8,
      widthFactor: 0.8,
      child: PasswordTextField(),
    );
  }

  FractionallySizedBox buildEmailInputWidget() {
    return FractionallySizedBox(
      heightFactor: 0.8,
      widthFactor: 0.8,
      child: CustomTextField(
        type: TextInputType.emailAddress,
        hint: 'email',
        icon: Icons.email_outlined,
      ),
    );
  }

  FittedBox buildTextWelcome() {
    return FittedBox(
      child: Text(
        StringConstants.welcome,
        style: MyStyles.myTextStyle,
      ),
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
