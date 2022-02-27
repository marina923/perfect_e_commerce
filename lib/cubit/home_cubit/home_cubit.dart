import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_e_commerce/cubit/home_cubit/home_states.dart';
import 'package:perfect_e_commerce/models/HomeModel.dart';
import '../../network/network/dio_helper.dart';
import '../../shared/constants.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  HomeModel homeModel=HomeModel();
  void getHomeData(){
    emit(GetHomeDataLoadingState());
    DioHelper.getData(url: HOME,lang: 'ar').then((value) {
      homeModel=HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());
    }).catchError((e){
      emit(GetHomeDataErrorState(e.toString()));
    });
  }
}