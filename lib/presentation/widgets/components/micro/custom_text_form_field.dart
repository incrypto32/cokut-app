import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key key,
      this.hintText,
      this.prefixText,
      this.isPassword,
      this.validator,
      this.onChanged,
      this.centerText = false,
      this.borderRadius = 30,
      this.textInputType = TextInputType.text,
      this.padding,
      this.enableBorder = true})
      : super(key: key);

  final String hintText;
  final String prefixText;
  final bool centerText;
  final bool isPassword;
  final Function(String) validator;
  final Function(dynamic) onChanged;
  final TextInputType textInputType;
  final double borderRadius;
  final EdgeInsets padding;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
      child: TextFormField(
        keyboardType: textInputType,
        textAlign: centerText ? TextAlign.center : TextAlign.left,
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(fontSize: 18),
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          prefixText: prefixText,
          prefixStyle: TextStyle(fontSize: 18),
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14),
          border: enableBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                )
              : null,
          // filled: true,
        ),
      ),
    );
  }
}
