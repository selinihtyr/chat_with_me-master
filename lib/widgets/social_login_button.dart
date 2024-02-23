import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final double? height;
  final Widget? icon;
  final VoidCallback onPressed;
  final Color buttonColor;
  final double fontSize;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.height,
    required this.icon,
    required this.onPressed,
    required this.buttonColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: buttonColor,
            textStyle: TextStyle(
              fontSize: fontSize,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon ?? Container(),
              Text(text),
              Opacity(
                opacity: 0.0,
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}