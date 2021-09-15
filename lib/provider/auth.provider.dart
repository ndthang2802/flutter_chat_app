import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/services/auth.dart';

enum RegisterState {
  initial,
  loading,
  success,
  fail,
}

enum LoginState {
  initial,
  loading,
  success,
  fail,
}

class AuthProvider extends ChangeNotifier {
  AutheMethods autheMethods = new AutheMethods();

  RegisterState registerState = RegisterState.initial;
  LoginState loginState = LoginState.initial;

  Future<void> signUp(String email, String password) async {
    registerState = RegisterState.loading;
    try {
      await autheMethods.registerWithEmail(email, password);
      registerState = RegisterState.success;
    } catch (err) {
      registerState = RegisterState.fail;
      print('eror from register' + err.toString());
    }
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    loginState = LoginState.loading;
    try {
      await autheMethods.signInWithEmail(email, password);
      loginState = LoginState.success;
    } catch (err) {
      loginState = LoginState.fail;
      print('eror from login' + err.toString());
    }
    notifyListeners();
  }
}
