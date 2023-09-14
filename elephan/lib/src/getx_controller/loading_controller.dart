import 'dart:developer';

import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  void showLoading() {
    isLoading.value = true;
    log(isLoading.value.toString());
  }

  void hideLoading() {
    isLoading.value = false;
    log(isLoading.value.toString());
  }
}
