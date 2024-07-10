import 'package:booklywithcleanarchitecture/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.backgroundColor,
      this.color,
      this.borderRadius,
      this.text});
  final Color? backgroundColor;
  final Color? color;
  final BorderRadius? borderRadius;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color(0xffEF8262),
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12)),
          ),
          onPressed: () {},
          child: Text(
            text ?? 'Free preview',
            style: Styles.style18.copyWith(
                color: color ?? Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
