import 'package:perfect_e_commerce/models/ClientModel.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class ChangePasswordVisibility extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final ClientModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}
