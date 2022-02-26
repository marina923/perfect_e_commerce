
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class ChangePasswordVisibility extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  // final RegisterModel registerModel;
  // RegisterSuccessState();
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}
