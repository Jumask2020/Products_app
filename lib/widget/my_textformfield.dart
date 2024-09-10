import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.hintText, this.validator, this.controller,this.obscureText=false, this.suffixIcon
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        
        
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            label: Text(hintText),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
