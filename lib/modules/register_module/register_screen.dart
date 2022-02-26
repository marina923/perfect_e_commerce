import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perfect_e_commerce/cubit/register_cubit/register_cubit.dart';
import 'package:perfect_e_commerce/cubit/register_cubit/register_states.dart';

import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_text_field.dart';
import '../login_module/login_screen.dart';
var emailController = TextEditingController();
var passwordController = TextEditingController();
var nameController = TextEditingController();
var phoneController = TextEditingController();
var formKey = GlobalKey<FormState>();
class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
              Fluttertoast.showToast(
                msg: 'Registered Successifully',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 10.sp,
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
              emailController.clear();
              nameController.clear();
              phoneController.clear();
              passwordController.clear();

          } else if (state is RegisterErrorState) {

            Fluttertoast.showToast(
              //state.error
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.sp,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: const IconThemeData(
                color: Colors.teal,
              ),
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(
                start:20.w,
                end: 20.w,
                top: 20.h,
                bottom: 20.h,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height:20.h,
                      ),
                      Text(
                        'Register to enjoy our hot offers',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height:20.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 3.w,
                          end: 3.w,
                        ),
                        child: CustomTextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          label: 'Name',
                          prefix: const Icon(Icons.person),
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 3.w,
                          end: 3.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                          emailController,
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
                          start:3.w,
                          end: 3.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                          phoneController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone Number',
                          prefix: const Icon(Icons.phone),
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'phone must not be empty';
                            } else if (value.length < 11 ||
                                !value.startsWith('0')) {
                              return 'Please! Enter valid phone number';
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
                          start:3.w,
                          end: 3.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                          passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword:
                          RegisterCubit.get(context).isPasswordHidden,
                          prefix: const Icon(Icons.lock),
                          suffix: RegisterCubit.get(context).passwordIcon,
                          validationMode: AutovalidateMode.onUserInteraction,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            } else if (value.length < 6) {
                              return 'Password is too short';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height:4.h,
                      ),
                      state is! RegisterLoadingState
                          ? CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).registerUser(
                              email:emailController
                                  .text,
                              password: passwordController
                                  .text,
                              name: nameController
                                  .text,
                              phone: phoneController
                                  .text,
                            );
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize:16.sp,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        ),
                        color: Colors.black,
                        height:40.h,
                        borderRadius: 10.r,
                      )
                          : const Center(
                            child: CircularProgressIndicator(),
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