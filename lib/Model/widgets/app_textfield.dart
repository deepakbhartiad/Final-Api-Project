import 'package:api_test/Model/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../constant/base_styles.dart';

class AppTextFields {
  TextFormField buildCheckoutTextFormField({
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? Function(String?)? change,
    String? labelText,
    String? hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType = TextInputType.text,
    bool enabled = true,
    bool filled = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      validator: validator,
      onChanged: change,
      obscureText: obscureText,
      keyboardType: keyboardType,
      enabled: enabled,
      maxLines: maxLines,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: BaseStyles.blackbold13.copyWith(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  buildTextFormFieldWithLabel1(
      {required String label,
      // required controller,
      required Function(dynamic value) validator,
      required TextInputType keyboardType,
      required Null Function() ontap,
      required bool readonly}) {}

  Widget dropdownTextField5({
    required List<DropdownMenuItem<String?>>? items,
    required Function(String?)? onChanged,
    required String? value,
    String? hintText,
    String? labelText,
    String? Function(String?)? validator,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 3,
            ),
          ],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String?>(
            value: value,
            hint: Text(hintText.toString()),
            items: items,
            onChanged: onChanged,
            validator: validator,
            isDense: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              // isCollapsed: true,
              // isDense: true,
              fillColor: AppColors.whiteColor,
              filled: true,
              hintText: hintText.toString(),
              labelText: labelText.toString(),
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      );
  buildTextFormField({
    TextEditingController? controller,
    String? Function(String?)? validator,
    Function()? ontap,
    String? labelText,
    Function(String)? onChanged,
    String? hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    Widget? prefixIcon,
    TextInputType? keyboardType = TextInputType.text,
    bool darkMode = false,
    bool enabled = true,
    bool filled = false,
    color,
    bool readOnly = false,
    int maxline = 1,
    double? height,
    double? radius,
  }) {
    return Container(
      height: height ?? 45,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          border: Border.all(color: Colors.black45),
          borderRadius: BorderRadius.circular(radius ?? 10)),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxline,
        onTap: ontap,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        enabled: enabled,
        style: darkMode
            ? const TextStyle(color: Colors.white, fontSize: 18)
            : const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          fillColor: AppColors.lightGrey,
          filled: filled,
          errorStyle: darkMode
              ? TextStyle(
                  color: ThemeData().errorColor, fontWeight: FontWeight.bold)
              : null,
          hintText: hintText,
          labelText: labelText,
          labelStyle: darkMode
              ? const TextStyle(color: Colors.white)
              : const TextStyle(color: Colors.black),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  ///
  buildTextFormFieldWithLabel(
      {TextEditingController? controller,
      String? Function(String?)? validator,
      String? labelText,
      Function(String)? onChanged,
      bool? readonly,
      Function()? ontap,
      String? hintText,
      bool obscureText = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      TextInputType? keyboardType = TextInputType.text,
      bool darkMode = false,
      bool enabled = true,
      bool filled = false,
      color,
      double? height,
      double? radius,
      String? label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: BaseStyles.blackMedium16.copyWith(color: Colors.black54),
        ),
        heightSpace5,
        Stack(
          children: [
            Container(
              height: height ?? 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: color ?? Colors.white,
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(radius ?? 10)),
            ),
            TextFormField(
              controller: controller,
              validator: validator,
              readOnly: readonly ?? false,
              onTap: ontap,
              obscureText: obscureText,
              keyboardType: keyboardType,
              onChanged: onChanged,
              enabled: enabled,
              style: darkMode
                  ? const TextStyle(color: Colors.white, fontSize: 18)
                  : const TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                fillColor: AppColors.lightGrey,
                filled: filled,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                errorStyle: darkMode
                    ? TextStyle(
                        color: ThemeData().errorColor,
                        fontWeight: FontWeight.bold)
                    : null,
                hintText: hintText,
                labelText: labelText,
                labelStyle: darkMode
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ],
    );
  }

//
  Widget buildAccountTextField({
    TextEditingController? controller,
    String? Function(String?)? validator,
    String? labelText,
    int? maxLines,
    String? hintText,
    bool obscureText = false,
    Widget? prefix,
    TextInputType? keyboardType = TextInputType.text,
    bool enabled = true,
    bool filled = false,
    String? initialValue,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : maxLines,
      obscureText: obscureText,
      initialValue: initialValue,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: filled,
        fillColor: AppColors.lightGrey,
        prefix: prefix,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
