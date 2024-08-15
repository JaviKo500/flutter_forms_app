import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {

  final  String? label;
  final  String? hintText;
  final  String? errorMessage;
  final  bool obscureText;
  final Function(String)? onChange;
  final IconData? prefixIcon;
  final  String? Function(String?)? validator;

  const CustomTextFormField ({
    super.key,
    this.label, 
    this.hintText, 
    this.errorMessage, 
    this.onChange, 
    this.validator, 
    this.prefixIcon, 
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final  border = OutlineInputBorder(
      // borderSide: BorderSide( color: colors.primary, ),
      borderRadius: BorderRadius.circular(24)
    );
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide( color: colors.primary,)
        ),
        label: label != null 
          ? Text(
              label ?? '',
              style: const TextStyle()
            )
          : null,
        hintText: hintText,
        focusColor: colors.primary,
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: colors.primary,) 
          : null,
        errorText: errorMessage,
        errorBorder: border.copyWith(
          borderSide: BorderSide( color: colors.error,)
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide( color: colors.error,)
        ),
      ),

    );
  }
}