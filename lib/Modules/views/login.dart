import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/widgets/app_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 225, 187, 73),
          title: Text('Please Login')),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: TextFormField(
              ///controllers heare
              controller: controller.mobileController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 0.8,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                  ),
                  enabled: true,
                  prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '+91  ',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 10, right: 10),
            child: AppButton().buildMaterialBtn(
              round: 20,
              color: Colors.amber,
              textColor: Colors.white,
              text: 'Continue',
              onPressed: () {
                controller.login();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
