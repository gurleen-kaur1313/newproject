import 'package:get/get.dart';

class RegisterButton extends GetxController {
  /*
  Button codes
  1 -> is loading
  0 -> default
  2 -> success
  3 -> error
  */
  RxInt button = 0.obs;
}

class RegisterFieldError extends GetxController {
  RxBool emailError = false.obs;
  RxBool passwordError = false.obs;
  RxBool nameError = false.obs;
}
