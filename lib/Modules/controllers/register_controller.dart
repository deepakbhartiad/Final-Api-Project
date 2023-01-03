import 'package:api_test/Modules/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Model/api_constant.dart';
import '../../Model/api_provider.dart';
import '../../Model/category_model.dart';
import '../../Model/widgets/toast_bar.dart';
import 'package:geolocator/geolocator.dart';

class RegisterController extends GetxController {
  // TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController storenameController = TextEditingController();
  TextEditingController vendorEmailController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? gstPhoto;
  XFile? shopPhoto;
  final gstImagePath = ''.obs;
  final shopImagePath = ''.obs;
  String long = '';
  String lat = '';
  final loading = false.obs;
  final categoryList = [];
  final categoryId = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getLocation();
    getCategory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        print("'Location permissions are permanently denied");
      } else {
        print("GPS Location service is granted");
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        long = position.longitude.toString();
        lat = position.latitude.toString();
        print(long);
        print(lat);
        update();
      }
    } else {
      print("GPS Location permission granted.");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      long = position.longitude.toString();
      lat = position.latitude.toString();
      print(long);
      print(lat);
      update();
    }
  }

  registerApi() async {
    print("object");
    LocationPermission permission = await Geolocator.checkPermission();
    if (formKey.currentState!.validate()) {
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return getLocation();
      } else if (gstPhoto!.path.isEmpty) {
        errorSnackBar(
            title: 'Gst Photo', description: 'Please select gst photo');
      } else if (shopPhoto!.path.isEmpty) {
        errorSnackBar(
            title: 'Shop Photo', description: 'Please select Shop photo');
      } else {
        var d = FormData({
          'name': nameController.text.trim(),
          'mobileno': mobileController.text.trim(),
          'emailid': emailController.text.trim(),
          'gender': genderController.text.trim(),
          'lat': lat,
          'lon': long,
          'vendor_email': vendorEmailController.text.trim(),
          'storename': storenameController.text.trim(),
          'file1': MultipartFile(gstPhoto!.path, filename: 'gstPhoto'),
          'file2': MultipartFile(shopPhoto!.path, filename: 'gstPhoto'),
          'shop_category': categoryId,
        });
        print(d);

        try {
          var res = await ApiProvider()
              .postRequest(apiUrl: ApiConstant.vendor_register, data: d);
          print(res);
          toast('Welcome To The Home Page', Toast.LENGTH_LONG,
              ToastGravity.BOTTOM);
          Get.to(() => HomePage());
          // customSnackBar(title: res['messages'], description: '');
          // Get.defaultDialog(
          //   title: 'Your profile under\n verification ',   ///<= THIS IS THE SNACKBAR AREAS
          //   titlePadding: EdgeInsets.all(15),
          //   // custom: const CircularProgressIndicator(),
          //   content: Text("We will verify soon"),
          //   barrierDismissible: false,
          //   onWillPop: () async {
          //     Get.offAll(() => LoginView());
          //     return true;
          //   },
          // );
          // sna(res['messages'].toString());
        } catch (e) {
          print(e.toString());
        }
      }
    } else {
      print('hello2');
    }
  }

  getCategory() async {
    loading.value = true;
    try {
      var res = await ApiProvider().getRequest(apiUrl: ApiConstant.category);
      List<CategoryModel> finalres = (res['data'] as List)
          .map((item) => CategoryModel.fromJson(item))
          .toList();
      categoryList.clear();
      categoryList.addAll(finalres);
      print(res);
    } catch (e) {
      print(e.toString());
    }
    loading.value = false;
  }
}
