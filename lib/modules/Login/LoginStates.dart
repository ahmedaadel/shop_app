import 'package:shop_app/models/Login_Model.dart';

abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel? loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginVisabilityState extends LoginStates {}
