import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfect_e_commerce/cubit/home_cubit/home_cubit.dart';
import 'package:perfect_e_commerce/cubit/home_cubit/home_states.dart';
import 'package:perfect_e_commerce/models/HomeModel.dart';
import 'package:perfect_e_commerce/modules/login_module/login_screen.dart';
import 'package:perfect_e_commerce/network/local/cashe_helper.dart';
import 'package:perfect_e_commerce/shared/components/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              actions: [
                TextButton(
                  child: Text(
                    'تسجيل الخروج',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    CasheHelper.removeData(key: 'token').then((value) {
                      if (value) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    });
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: ConditionalBuilder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'التصنيفات',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Container(
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Center(
                                          child: Text(
                                              '${HomeCubit.get(context).homeModel.data!.categories![index].name}')),
                                    ),
                                separatorBuilder: (context, index) => Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                      width: 10.w,
                                    ),
                                itemCount: HomeCubit.get(context)
                                    .homeModel
                                    .data!
                                    .categories!
                                    .length),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'الاكثر مبيعاَ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 300.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CustomCard(
                                  url:
                                      'https://us.123rf.com/450wm/lkeskinen/lkeskinen1707/lkeskinen170701044/81349335-not-responding-rubber-stamp.jpg?ver=6',
                                  name:
                                      '${HomeCubit.get(context).homeModel.data!.mostSeller![index].name}',
                                  price:
                                      '${HomeCubit.get(context).homeModel.data!.mostSeller![index].price}',
                                  category:
                                      ' ${HomeCubit.get(context).homeModel.data!.mostSeller![index].categoriesName}'),
                              itemCount: HomeCubit.get(context)
                                  .homeModel
                                  .data!
                                  .mostSeller!
                                  .length,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'منتجات جديدهَ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 300.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CustomCard(
                                  url:
                                      'https://us.123rf.com/450wm/lkeskinen/lkeskinen1707/lkeskinen170701044/81349335-not-responding-rubber-stamp.jpg?ver=6',
                                  name:
                                      '${HomeCubit.get(context).homeModel.data!.newProducts![index].name}',
                                  price:
                                      '${HomeCubit.get(context).homeModel.data!.newProducts![index].price}',
                                  category:
                                      ' ${HomeCubit.get(context).homeModel.data!.newProducts![index].categoriesName}'),
                              itemCount: HomeCubit.get(context)
                                  .homeModel
                                  .data!
                                  .newProducts!
                                  .length,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'إنجازات السعادةَ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                          ),
                          SizedBox(
                            height: 300.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Card(
                                elevation: 10,
                                child: Image(
                                  image: NetworkImage(
                                      'https://us.123rf.com/450wm/lkeskinen/lkeskinen1707/lkeskinen170701044/81349335-not-responding-rubber-stamp.jpg?ver=6'),
                                ),
                              ),
                              itemCount: HomeCubit.get(context)
                                  .homeModel
                                  .data!
                                  .happinessAchievements!
                                  .length,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                condition: state is GetHomeDataSuccessState,
                fallback: (context) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.teal,
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
