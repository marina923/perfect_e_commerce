import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_e_commerce/cubit/register_cubit/register_states.dart';
import 'package:perfect_e_commerce/models/ClientModel.dart';

import '../../network/network/dio_helper.dart';
import '../../shared/constants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData passwordIcon = Icons.visibility;
  bool isPasswordHidden = true;

  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    isPasswordHidden
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  ClientModel registerModel = ClientModel();
  void registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'role': "3",
      },
    ).then((value) {

      registerModel = ClientModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      if (error is DioError) {
        emit(RegisterErrorState('${error.response!.data['message']}'));
      }
    });
  }
}
