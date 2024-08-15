import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {

  const CustomTextFormField ({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final  border = OutlineInputBorder(
      // borderSide: BorderSide( color: colors.primary, ),
      borderRadius: BorderRadius.circular(24)
    );
    return TextFormField(
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        if ( value == null ) return 'required field';
        if ( value.isEmpty ) return 'required field';
        if ( value.trim().isEmpty ) return 'required field';
        return null;  
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide( color: colors.primary,)
        ),
      ),

    );
  }
}