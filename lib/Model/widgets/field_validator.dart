import 'package:flutter/material.dart';

class FieldValidator {
  BuildContext context;
  FieldValidator(this.context);

  String? emailValidate(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.toString());
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    } else if (!emailValid) {
      return 'Please enter valid email address';
    } else {
      return null;
    }
  }

  String? loginEmailMobileValidate(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.toString());
    bool isNumeric = RegExp(r'^-?[0-9]+$').hasMatch(value.toString());

    if (value == null || value.isEmpty) {
      return 'Please enter email address or mobile number';
    } else {
      if (isNumeric) {
        if (value.length < 10) {
          return 'Please enter valid mobile number';
        } else {
          return null;
        }
      } else {
        if (!emailValid) {
          return 'Please enter valid email address';
        } else {
          return null;
        }
      }
    }
  }

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    } else {
      return null;
    }
  }

  String? bankName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    } else {
      return null;
    }
  }

  String? userName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter userName';
    } else {
      return null;
    }
  }

  String? gender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select gender';
    } else {
      return null;
    }
  }

  String? shopCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select shop category';
    } else {
      return null;
    }
  }

  String? storename(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter storename';
    } else {
      return null;
    }
  }

  String? ifsc(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter ifsc no';
    } else {
      return null;
    }
  }

  String? accountNoValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter account number';
    } else if (value.length < 10) {
      return 'The account no must be at least 10 numbers.';
    } else {
      return null;
    }
  }

  String? mobileValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (value.length != 10) {
      return 'The mobile no must be at least 10 numbers.';
    } else {
      return null;
    }
  }
}
