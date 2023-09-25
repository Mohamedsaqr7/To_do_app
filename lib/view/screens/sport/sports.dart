import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/componnent/task/sportwidget.dart';
import 'package:todo/view/screens/sport/addtask.dart';
import 'package:todo/view/screens/sport/edittask.dart';
import 'package:lottie/lottie.dart';
import '../../../viewmodel/bloc/sport/sportcubit.dart';
import '../../../viewmodel/bloc/sport/sportstate.dart';
import '../../../viewmodel/services/navigation.dart';

class Sport extends StatelessWidget {
  const Sport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Color.fromARGB(211, 235, 231, 231),
      ),
      body: BlocConsumer<Sportcubit, sportstate>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = Sportcubit.get(context);
          return (cubit.sports ).isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_N6RcsC.json',
                        height: 400.h,
                        width: 350.w,
                      ),
                      // SizedBox(height: 20.h,),
                      Text(
                        'ADD TASK...!',
                        style: TextStyle(fontSize: 25.sp),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(12.w),
                  child: 
                      ListView.separated(
                            physics: BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemBuilder: (context, index) {
                              return Material(
                                 borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(255, 234, 239, 241),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                    onTap: () {
                                      cubit.changecurrentindex1(index);
                                      Navigatioon.gopush(context, EddTask());
                                    },
                                    child: Column(
                                      children: [
                                        
                                        SportWidget(
                                          sport: cubit.sports[index],
                                        ),
                                      ],
                                    )),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10.w,
                                ),
                            itemCount: cubit.sports.length),
                      
                    
                  );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigatioon.gopush(context, AddTask());
          },
          child: Icon(Icons.add)),
    );
  }
}
