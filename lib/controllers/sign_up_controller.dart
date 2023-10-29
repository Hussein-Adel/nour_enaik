import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/response/user_response.dart';
import '../data/networks/model_response.dart';
import 'auth_controller.dart';

class SignUpController extends AuthController {
  String countryCode = '+966';
  List<String> countryCodeList = ['+20', '+966'];
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> formSignUpKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  changeCountryCode(value) {
    countryCode = value;
  }

  FormFieldValidator<String> checkPasswordsMatches(String errorMessage) {
    return (value) {
      //   print("valueee= $value // Password= ${passwordController.text}  ");
      if (value != passwordController.text) {
        return errorMessage;
      }
      return null;
    };
  }

  Future<bool> register(BuildContext context) async {
    if (formSignUpKey.currentState?.validate() != true) return false;
    isLoading.value = true;
    FocusScope.of(context).unfocus();
    // String? firebaseToken = await FirebaseMessaging.instance.getToken();
    var data = dio.FormData.fromMap({
      'name': fullNameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'c_password': confirmPasswordController.text,
      'doctor_name': doctorNameController.text,
      'fcm_token': '',
    });
    final result = await signUp(body: data);
    if (result is Success<UserData>) {
      isLoading.value = false;
      return true;
    } else {
      isLoading.value = false;
      print("xax= ${result}");

      return false;
    }
  }
}
