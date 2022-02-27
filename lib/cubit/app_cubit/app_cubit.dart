import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_e_commerce/modules/home_layout/home_screen.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List screens = const [
    HomeScreen(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }





  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();


}
