
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perfect_e_commerce/cubit/login_cubit/login_cubit.dart';
import 'package:perfect_e_commerce/cubit/login_cubit/login_states.dart';
import 'package:perfect_e_commerce/modules/home_layout/home_screen.dart';
import 'package:perfect_e_commerce/modules/register_module/register_screen.dart';

import '../../network/local/cashe_helper.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_text_field.dart';
import '../../shared/constants.dart';
var formKey = GlobalKey<FormState>();
var emailController = TextEditingController();
var passwordController = TextEditingController();
class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
              // CasheHelper.saveData(
              //     key: 'token', value: state.loginModel.data!.token)
              //     .then((value) {
              //   token = state.loginModel.data!.token;
              //   Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(
              //       builder: (context) =>  HomeScreen(),
              //     ),
              //   );
              //   LoginCubit.get(context).emailController.clear();
              //   LoginCubit.get(context).passwordController.clear();
              // });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>  HomeScreen(),
                ),
              );
          }else {
            emailController.clear();
           passwordController.clear();
            Fluttertoast.showToast(
              msg: 'We were unable to login, Please! check the entered data',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0.sp,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 20.w,
                end: 20.w,
                top:10.h,
                bottom:10.h,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:0.12.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height:100.h,
                      ),
                      Text(
                        'Login to enjoy our hot offers',
                        style: TextStyle(
                          fontSize:30.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height:15.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start:1.w,
                          end: 1.w,
                        ),
                        child: CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'E-mail',
                          prefix: const Icon(Icons.mail_outline),
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'e-mail must not be empty';
                            } else if ((RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) ==
                                false) {
                              return 'Please! enter valid e-mail. EX: john@gmail.com';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height:10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start:1.w,
                          end:1.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                          passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword: LoginCubit.get(context).isPasswordHidden,
                          prefix: const Icon(Icons.lock),
                          suffix: LoginCubit.get(context).passwordIcon,
                          validationMode: AutovalidateMode.onUserInteraction,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController
                                    .text,
                                password: passwordController
                                    .text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 letters';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height:4.h,
                      ),
                      state is! LoginLoadingState
                          ? CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController
                                  .text,
                              password: passwordController
                                  .text,
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize:16.sp,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        ),
                        color:Colors.black,
                        height:50.h,
                        borderRadius: 10.r,
                      )
                          : const Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height:3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize:17.sp,
                            ),
                          ),
                          SizedBox(
                            width:0.01.w,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 17.sp,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}