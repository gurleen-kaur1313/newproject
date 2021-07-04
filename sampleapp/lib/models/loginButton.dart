import 'package:get/get.dart';

class LoginButton extends GetxController {
  /*
  Button codes
  1 -> is loading
  0 -> default
  2 -> success
  3 -> error
  */
  RxInt button = 0.obs;
}

class LoginFieldError extends GetxController {
  RxBool emailError = false.obs;
  RxBool passwordError = false.obs;
}
