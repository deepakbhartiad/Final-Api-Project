import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Model/widgets/app_button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OtpController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 198, 83),
        title: Text('Please Verify OTP'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: PinCodeTextField(
              appContext: context,
              length: 4,
               controller: controller.otpController,
              obscureText: false,
              // textStyle: BaseStyles.blackMedium16,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                inactiveColor: Colors.grey,
                selectedColor: Colors.blue,
                activeColor: Colors.amber,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              // backgroundColor: Colors.white,
              enableActiveFill: true,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");

                return true;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10, right: 10),
            child: AppButton().buildMaterialBtn(
              round: 20,
              color: Colors.amber,
              textColor: Colors.white,
              text: 'Submit',
              onPressed: () {
                // Get.to(() => HomeView());
                controller.otp();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Don’t receive the OTP ? ',
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: 'Resend',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        controller.login();
                      }),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
