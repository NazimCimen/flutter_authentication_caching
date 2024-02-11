import 'package:flutter/material.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/styles/text_styles.dart';
import 'package:newapp/utils/text_editing_controller.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType type;
  final String hint;
  final IconData icon;
  const CustomTextField(
      {super.key, required this.type, required this.hint, required this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void dispose() {
    MyTextEditingController.mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: MyTextEditingController.mailController,
      autofillHints: const [AutofillHints.email],
      keyboardType: widget.type,
      cursorColor: MyColors.myBrown,
      style:
          MyStyles.myTextStyle.copyWith(color: MyColors.myBrown, fontSize: 20),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.myBrown, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 2, color: MyColors.myBrown)),
          focusColor: Colors.black,
          labelText: widget.hint,
          labelStyle: const TextStyle(color: MyColors.myBrown, fontSize: 18),
          prefixIcon: Icon(widget.icon, color: MyColors.myBrown)),
    );
  }
}
