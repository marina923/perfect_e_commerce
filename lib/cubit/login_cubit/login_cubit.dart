import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_e_commerce/cubit/login_cubit/login_states.dart';
import 'package:perfect_e_commerce/models/ClientModel.dart';
import '../../network/network/dio_helper.dart';
import '../../shared/constants.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  IconData passwordIcon = Icons.visibility;
  bool isPasswordHidden = true;

  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    isPasswordHidden
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }
  ClientModel loginModel = ClientModel();

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
        'type':'login',
      },
    ).then((value) {
      loginModel = ClientModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
