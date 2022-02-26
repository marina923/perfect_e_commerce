import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfect_e_commerce/cubit/app_cubit/app_cubit.dart';
import 'package:perfect_e_commerce/cubit/app_cubit/app_states.dart';
import 'package:perfect_e_commerce/cubit/bloc_observer.dart';
import 'package:perfect_e_commerce/modules/home_layout/home_screen.dart';
import 'package:perfect_e_commerce/modules/login_module/login_screen.dart';
import 'package:perfect_e_commerce/modules/onboarding_module/onboarding_screen.dart';
import 'package:perfect_e_commerce/shared/constants.dart';
import 'network/local/cashe_helper.dart';
import 'network/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.int();
  bool? onBoarding = CasheHelper.getData(key: 'onBoarding');
  token = CasheHelper.getData(key: 'token');
  Widget? startWidget;
  if (onBoarding != null) {
    if (token != null) {
      startWidget =  HomeScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget =  OnBoardingScreen();
  }
  runApp(
    MyApp(
      startWidget: startWidget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: () => MaterialApp(
              builder: (context, widget) {
                //add this line
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              debugShowCheckedModeBanner: false,
              title: 'Flutter E-commerce App',
              theme: KlightTheme,
              home: startWidget,
            ),
          );
        },
      ),
    );
  }
}