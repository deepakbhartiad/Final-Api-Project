import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../constant/app_colors.dart';

const widthSpace5 = SizedBox(width: 5);
const widthSpace10 = SizedBox(width: 10);
const widthSpace20 = SizedBox(width: 20);
const widthSpace15 = SizedBox(width: 15);
const heightSpace5 = SizedBox(height: 5);
const heightSpace10 = SizedBox(height: 10);
const heightSpace20 = SizedBox(height: 20);
const heightSpace30 = SizedBox(height: 30);
const heightSpace40 = SizedBox(height: 40);
const heightSpace50 = SizedBox(height: 50);
const heightSpace100 = SizedBox(height: 100);

class CustomWidgets {
  GestureDetector backButton() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.centerRight,
        // margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(8),
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  BoxDecoration containerDecoration({color, double? radius}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 15),
      boxShadow: [
        BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            color: Colors.grey.shade300,
            offset: Offset(2, 3))
      ],
    );
  }

  cachedImage({required image, double? height, double? width}) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width ?? Get.width,
      fit: BoxFit.contain,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
