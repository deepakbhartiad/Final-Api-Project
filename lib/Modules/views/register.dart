import 'dart:io';
import 'package:api_test/Model/widgets/field_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/category_model.dart';
import '../../Model/widgets/app_button.dart';
import '../../Model/widgets/app_textfield.dart';
import '../../Model/widgets/custom_widgets.dart';
import '../../constant/base_styles.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => RegisterController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 236, 198, 83),
          title: Text('Please Rrgister')),
      backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  /////////////// texts fields

                  heightSpace50,
                  AppTextFields().buildTextFormFieldWithLabel(
                      label: 'Name',
                      controller: controller.nameController,
                      validator: (value) =>
                          FieldValidator(context).nameValidate(value)),
                  heightSpace10,
                  AppTextFields().buildTextFormFieldWithLabel(
                      label: 'Email',
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          FieldValidator(context).emailValidate(value)),
                  heightSpace10,
                  AppTextFields().buildTextFormFieldWithLabel(
                      label: 'Mobile Number',
                      controller: controller.mobileController,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          FieldValidator(context).mobileValidate(value)),
                  heightSpace10,
                  AppTextFields().buildTextFormFieldWithLabel(
                    label: 'Gender',
                    readonly: true,
                    validator: (value) => FieldValidator(context).gender(value),
                    controller: controller.genderController,
                    ontap: () {
                      List gender = ['Male', 'Female', 'Other'];
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: gender.length,
                                  itemBuilder: (context, index) {
                                    var item = gender[index];
                                    return ListTile(
                                      onTap: () {
                                        controller.genderController.text = item;
                                        Get.back();
                                      },
                                      title: Text(
                                        item,
                                        style: BaseStyles.blackMedium16,
                                      ),
                                    );
                                  }),
                            );
                          });
                    },
                    hintText: 'Gender',
                  ),
                  heightSpace10,
                  AppTextFields().buildTextFormFieldWithLabel(
                      label: 'Store Name',
                      validator: (value) =>
                          FieldValidator(context).storename(value),
                      controller: controller.storenameController),
                  heightSpace10,
                  AppTextFields().buildTextFormFieldWithLabel(
                    label: 'Vendor Email',
                    controller: controller.vendorEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        FieldValidator(context).emailValidate(value),
                  ),
                  heightSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'GST Photo',
                            style: BaseStyles.blackMedium16
                                .copyWith(color: Colors.black54),
                          ),
                          heightSpace5,
                          GestureDetector(
                            onTap: () async {
                              controller.gstPhoto =
                                  await controller.picker.pickImage(
                                source: ImageSource.camera,
                                maxHeight: 1280,
                                maxWidth: 720,
                              );
                              // setState(() {});
                              controller.gstImagePath.value =
                                  controller.gstPhoto!.path;
                              controller.update();
                            },
                            child: Container(
                              height: Get.width * 0.5,
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: controller.gstImagePath.value != ''
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        File(controller.gstImagePath.value),
                                        width: Get.width * 0.35,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            'Shop Photo',
                            style: BaseStyles.blackMedium16
                                .copyWith(color: Colors.black54),
                          ),
                          heightSpace5,
                          GestureDetector(
                            onTap: () async {
                              controller.shopPhoto =
                                  await controller.picker.pickImage(
                                source: ImageSource.camera,
                                maxHeight: 1280,
                                maxWidth: 720,
                              );

                              controller.shopImagePath.value =
                                  controller.shopPhoto!.path;
                              controller.update();
                            },
                            child: Container(
                              height: Get.width * 0.5,
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: controller.shopImagePath.value != ''
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.file(
                                        File(controller.shopImagePath.value),
                                        width: Get.width * 0.35,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  heightSpace20,
                  controller.loading.value
                      ? CircularProgressIndicator()
                      : AppTextFields().buildTextFormFieldWithLabel(
                          label: 'Shop Category',
                          readonly: true,
                          validator: (value) =>
                              FieldValidator(context).shopCategory(value),
                          controller: controller.categoryController,
                          ontap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 500,
                                    child: ListView.builder(
                                        itemCount:
                                            controller.categoryList.length,
                                        itemBuilder: (context, index) {
                                          CategoryModel item =
                                              controller.categoryList[index];
                                          return ListTile(
                                            onTap: () {
                                              controller.categoryController
                                                  .text = item.name!;
                                              controller.categoryId.value =
                                                  item.categoryid!;
                                              Get.back();
                                            },
                                            title: Text(
                                              item.name ?? '',
                                              style: BaseStyles.blackMedium16,
                                            ),
                                          );
                                        }),
                                  );
                                });
                          },
                          hintText: 'Grocery / General',
                        ),
                  heightSpace30,
                  AppButton().buildMaterialBtn(
                    round: 20,
                    color: Color.fromARGB(255, 215, 224, 49),
                    textColor: Colors.white,
                    text: 'Register',
                    onPressed: () {
                      controller.registerApi();
                    },
                  ),
                  heightSpace20,
                  heightSpace20
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container imageContainer(img) {
    return Container(
      height: Get.width * 0.5,
      width: Get.width * 0.35,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: img != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(img!.path),
                width: Get.width * 0.35,
                fit: BoxFit.fill,
              ),
            )
          : Container(),
    );
  }
}
