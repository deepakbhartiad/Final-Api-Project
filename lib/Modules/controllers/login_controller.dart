import 'package:api_test/Model/api_constant.dart';
import 'package:api_test/Model/api_provider.dart';
import 'package:api_test/Modules/views/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Model/widgets/toast_bar.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    if (mobileController.text.trim().length != 10) {
      errorSnackBar(
          title: 'Mobile Number error',
          description: 'Please enter 10 digit mobile number');
    } else {
      try {
        var res = await ApiProvider().postRequest(
            apiUrl: ApiConstant.checkvendor,
            data: FormData({'mobileno': mobileController.text.trim()}));
        if (res['status'] == 200) {
          Get.to(() => OtpView(), arguments: mobileController.text);
          print(res);

          customSnackBar(title: res['messages'], description: '');
        } else {
          errorSnackBar(title: res['messages']['mobileno'], description: '');
        }
        print(res);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
