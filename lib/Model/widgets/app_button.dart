import 'package:flutter/material.dart';

class AppButton {
  Widget buildMaterialBtn({
    required String text,
    required Function()? onPressed,
    Color textColor = Colors.black,
    double? round,
    Color color = Colors.white,
  }) {
    return MaterialButton(
      height: 45,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(round ?? 4),
      ),
      elevation: 1,
      minWidth: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Acumin Pro',
          fontWeight: FontWeight.w700,
          color: color == Colors.accents ? Colors.amber : textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
