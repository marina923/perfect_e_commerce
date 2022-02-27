


import 'package:perfect_e_commerce/models/ClientModel.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordVisibility extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final ClientModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}