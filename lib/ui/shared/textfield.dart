import 'package:flutter/material.dart';
import 'package:weighty/ui/constants/_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.suffix,
    this.prefix,
    this.initialValue,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      cursorColor: AppColors.main,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      style: const TextStyle(
        color: AppColors.main,
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontFamily: 'GTWalsheimPro',
      ),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: true,
        fillColor:  AppColors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.main.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        labelStyle: const TextStyle(
          color: AppColors.main,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'GTWalsheimPro',
        ),
        hintStyle: const TextStyle(
          color: AppColors.main,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          fontFamily: 'GTWalsheimPro',
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.main,
            width: 2,
          ),
        ),
      ),
    );
  }
}
