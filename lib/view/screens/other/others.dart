import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/componnent/task/homewidget.dart';
import 'package:todo/view/screens/other/addtaskscreen.dart';
import 'package:todo/view/screens/other/edittaskscreen.dart';
import 'package:todo/viewmodel/bloc/tasks/taskcubit.dart';
import 'package:todo/model/task/taskmodel.dart';
import 'package:todo/viewmodel/services/navigation.dart';
import 'package:lottie/lottie.dart';

import '../../../viewmodel/bloc/tasks/taskstate.dart';

class Others extends StatelessWidget {
  const Others({super.key});

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
      body: BlocConsumer<taskcubit, taskstate>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = taskcubit.get(context);
          return 
    (cubit.taskss ).isEmpty ?Center(
      child: Column(
        children: [
          Lottie.network('https://assets8.lottiefiles.com/packages/lf20_z4cshyhf.json'
          ,height:400.h,width: 350.w ),
         // SizedBox(height: 20.h,),
          Text('ADD TASK...!',style: TextStyle(fontSize: 25.sp),)
        ],
      ),
    ):
          Padding(
            padding: EdgeInsets.all(12.w),
            child: ListView.separated(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  return Material(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(255, 234, 239, 241),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                          onTap: () {
                            cubit.changecurrentindex(index);
                            Navigatioon.gopush(context, edittask());
                          },
                          child: homewidget(
                            task: cubit.taskss[index],
                          )));
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: cubit.taskss.length),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigatioon.gopush(context, addtask());
          },
          child: Icon(Icons.add)),
    );
  }
}
