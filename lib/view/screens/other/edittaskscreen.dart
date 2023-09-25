import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../viewmodel/bloc/tasks/taskcubit.dart';
import '../../../viewmodel/bloc/tasks/taskstate.dart';

class edittask extends StatelessWidget {
  const edittask({super.key});

  @override
  Widget build(BuildContext context) {
    taskcubit.get(context).initcontroller();
    return Scaffold(
        appBar: AppBar(
          title: Text('edit your task'),
        ),
        body: BlocConsumer<taskcubit, taskstate>(
            listener: (context, state) {
              if(state is deletesuccess ||state is editsuccess){
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              var cubit = taskcubit.get(context);
              return Padding(
                padding: EdgeInsets.all(15.w),
                child: Form(
                  key: cubit.keyy,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        TextFormField(
                          controller: cubit.title,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "please enter your title ";
                            }
                            return null;
                          }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'decription',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        TextFormField(
                          controller: cubit.description,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'startdate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.none,
                          onTap: (() {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) =>
                                    cubit.startdate.text = value?.toString()??''
                                    );
                          }),
                          controller: cubit.startdate,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'enddate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        TextFormField(
                          controller: cubit.enddate,
                          keyboardType: TextInputType.none,
                          onTap: (() {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2024))
                                .then((value) =>
                                    cubit.enddate.text = value?.toString()??''
                                    );
                          }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.h,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (cubit.keyy.currentState!.validate()) {
                                        cubit.edittasks();
                                      }
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r)))),
                              ),
                            ),SizedBox(width: 10.w,),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40.h,
                                child: ElevatedButton(
                                    onPressed: () {
                                    cubit.deletetasks();
                                    },
                                    child: Text(
                                      'delete',
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r)))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
 
  }
}