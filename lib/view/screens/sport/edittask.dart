import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../viewmodel/bloc/sport/sportcubit.dart';
import '../../../viewmodel/bloc/sport/sportstate.dart';

class EddTask extends StatelessWidget {
  const EddTask({super.key});

  @override
  Widget build(BuildContext context) {
    Sportcubit.get(context).Initcontroller();

    return Scaffold(
        body: BlocConsumer<Sportcubit, sportstate>(
      listener: (context, state) {
        if (state is Deletesuccess || state is Editsuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = Sportcubit.get(context);
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ])),
          child: Form(
            key: cubit.keyy1,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                      size: 25.sp,
                    )),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 4),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'New Todo',
                        style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Task Title',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            letterSpacing: 0.2),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 60, 70),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: TextFormField(
                          controller: cubit.title1,
                          validator: ((value) {
                            if (value!.trim().isEmpty) {
                              return "please enter your title ";
                            }
                            return null;
                          }),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Task Title',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            letterSpacing: 0.2),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        height: 150.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 60, 70),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: TextFormField(
                          controller: cubit.description1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Task Description',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.sp,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Start Date',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            letterSpacing: 0.2),
                      ),
                      Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 60, 70),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: TextFormField(
                          controller: cubit.startdate1,
                          keyboardType: TextInputType.none,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: (() {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) => cubit.startdate1.text =
                                    value?.toString() ?? '');
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'End Date',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            letterSpacing: 0.2),
                      ),
                      Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 59, 60, 70),
                            borderRadius: BorderRadius.circular(15.r)),
                        child: TextFormField(
                          controller: cubit.enddate1,
                          keyboardType: TextInputType.none,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onTap: (() {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) => cubit.enddate1.text =
                                    value?.toString() ?? '');
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 45.w,
                          ),
                          InkWell(
                            onTap: () {
                              if (cubit.keyy1.currentState!.validate()) {
                                cubit.Edittasks();
                              }
                            },
                            child: Container(
                              height: 60.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 225, 225),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                              child: Center(
                                  child: Text(
                                'Edit',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1d1e26)),
                              )),
                            ),
                          ),
                          SizedBox(width: 50.w),
                          InkWell(
                            onTap: () {
                              if (cubit.keyy1.currentState!.validate()) {
                                cubit.Deletetasks();
                              }
                            },
                            child: Container(
                              height: 60.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 231, 225, 225),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                              child: Center(
                                  child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1d1e26)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        );
      },
    ));
  }
}
