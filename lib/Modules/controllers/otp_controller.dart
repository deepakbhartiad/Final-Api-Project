import 'package:api_test/Modules/views/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Model/api_constant.dart';
import '../../Model/api_provider.dart';
import '../../Model/widgets/toast_bar.dart';
import '../views/home.dart';
import '../views/register.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  var mobile = Get.arguments;
  var box = GetStorage();
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

  otp() async {
    print(otpController.text.trim().length);
    if (otpController.text.trim().length != 4) {
      errorSnackBar(title: 'Otp Error', description: 'Enter 4 Digit Otp');
    } else {
      try {
        var res = await ApiProvider().postRequest(
            apiUrl: ApiConstant.checkotp,
            data: FormData(
                {'mobileno': mobile, 'otp': otpController.text.trim()}));
        print(res);

        if (res['status'].toString() == '500') {
          errorSnackBar(title: res['messages'], description: '');

          return null;
        }
        if (res['data'] == null) {
          errorSnackBar(title: 'Please register first', description: '');

          Get.off(() => RegisterView());
        } else {
          //  toast(res['messages']);
          if (res['data']['isactive'].toString() == '1') {
            box.write('vendorId', res['data']['customerid']);
            box.write('name', res['data']['name']);
            box.write('mobileno', res['data']['mobileno']);
            box.write('emailid', res['data']['emailid']);
            box.write('gender', res['data']['gender']);
            box.write('storename', res['data']['storename']);
            box.write('shop_category', res['data']['shop_category']);
            Get.offAll(() => HomePage());
          } else {
            toast('Welcome To The Home Page', Toast.LENGTH_LONG,
                ToastGravity.BOTTOM);
            Get.to(() => HomePage());
            onWillPop:
            () async {
              Get.offAll(() => LoginView());
              return true;
            };
            // Get.defaultDialog(
            //   title: 'Your profile under\n verification ',
            //   titlePadding: EdgeInsets.all(15),
            //   content: Text("We will verify soon"),
            //   barrierDismissible: false,
            //   onWillPop: () async {
            //     Get.offAll(() => LoginView());
            //     return true;
            //   },
            // );
          }
        }
        print(res);
      } catch (e) {}
    }
  }

  login() async {
    try {
      var res = await ApiProvider().postRequest(
          apiUrl: ApiConstant.checkvendor,
          data: FormData({'mobileno': mobile}));
      if (res['status'] == 200) {
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
