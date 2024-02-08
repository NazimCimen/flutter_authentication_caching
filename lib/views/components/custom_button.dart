import 'package:flutter/material.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.myColorBtn1,
            elevation: 8,
            shadowColor: Colors.grey,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: MyStyles.myTextStyle,
        ));
  }
}
