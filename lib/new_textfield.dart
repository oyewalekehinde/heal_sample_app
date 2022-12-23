import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class HealaTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool? obscure;
  final bool? enabled;
  final TextInputType? textInputType;
  final Widget? icon;
  final bool? filled;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focus;
  const HealaTextField(
      {Key? key,
      this.label,
      this.controller,
      this.obscure = false,
      this.enabled = true,
      this.icon,
      this.filled = false,
      this.validator,
      this.inputFormatter,
      this.focus,
      this.onChanged,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      focusNode: focus,
      obscureText: obscure!,
      keyboardType: textInputType ?? TextInputType.text,
      cursorColor: AppColors.customBlue,
      validator: validator,
      inputFormatters: inputFormatter,
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: filled,
          fillColor: AppColors.solidGrey,
          labelText: label ?? "",
          labelStyle: TextStyle(
            fontSize: 14,
            height: 1.4,
            fontWeight: FontWeight.w400,
            fontFamily: 'Euclid',
            color: AppColors.blackText.withOpacity(0.5),
          ),
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [icon ?? SizedBox.shrink()],
          ),
          contentPadding: EdgeInsets.all(16),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.customBlue),
              borderRadius: BorderRadius.circular(12)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(12)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderGrey),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
