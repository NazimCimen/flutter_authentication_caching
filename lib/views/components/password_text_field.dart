import 'package:flutter/material.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/utils/text_editing_controller.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  void dispose() {
    MyTextEditingController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: MyTextEditingController.passwordController,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: context.watch<AuthProvider>().isSecure,
      cursorColor: MyColors.myBrown,
      style: MyStyles.myTextStyle.copyWith(fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.myBrown, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2, color: MyColors.myBrown)),
        labelText: 'password',
        labelStyle: MyStyles.myTextStyle.copyWith(fontSize: 18),
        prefixIcon: const Icon(Icons.lock_outlined, color: MyColors.myBrown),
        suffixIcon: IconButton(
            onPressed: context.read<AuthProvider>().changeIsSecure,
            icon: Icon(
                context.watch<AuthProvider>().isSecure
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: MyColors.myBrown)),
      ),
    );
  }
}
