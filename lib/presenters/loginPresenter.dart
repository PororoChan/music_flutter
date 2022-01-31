import 'package:get/get.dart';
import 'package:music_flutter/contract/adminContract.dart';
import 'package:music_flutter/contract/loginContract.dart';
import 'package:music_flutter/services/loginService.dart';

class LoginPresenter extends GetxController {
  late LoginContract _loginContract;
  LoginService _loginService = LoginService();

  var isAuth = false.obs;
  var email = "".obs;
  var password = "".obs;

  void login(String email, String password) async {
    _loginService
        .login(email, password)
        .then((value) => _loginContract.onLoginSuccess(value))
        .catchError(
      (message) {
        _loginContract
            .onLoginFailed(message is String ? message : "Gagal autentikasi");
      },
    );
  }

  set logincontract(LoginContract loginContract) {
    _loginContract = loginContract;
  }
}
