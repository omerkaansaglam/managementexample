import 'package:flutter/material.dart';

class LoginInputFormField extends TextFormField {
  LoginInputFormField(
      {Key? key,
      String? title,
      bool isSecure = false,
      Widget? suffixIcon,
      String? Function(String?)? validator,
      bool? filled,
      Color? filledColor,
      TextEditingController? controller,
      void Function(String?)? onSaved})
      : super(
          key: key,
          controller: controller,
          validator: validator,
          onSaved: onSaved,
          obscureText: isSecure,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.blue,
          decoration: InputDecoration(
              labelText: title,
              fillColor: Colors.white54,
              filled: true,
              errorStyle: const TextStyle(color: Colors.red),
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(color: Colors.white),
              )),
        );
}