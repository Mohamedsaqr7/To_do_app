import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../viewmodel/bloc/tasks/taskcubit.dart';
import '../../../viewmodel/bloc/tasks/taskstate.dart';

class addtask extends StatelessWidget {
  const addtask({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('add your task'),
        ),
        body: BlocConsumer<taskcubit, taskstate>(
            listener: (context, state) {
              if(state is addsuccess){
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
                        Container(
                          decoration: BoxDecoration(
                      color: Colors.grey,
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
                        SizedBox(
                          width: double.infinity,
                          height: 40.h,
                          child: ElevatedButton(
                              onPressed: () {
                                if (cubit.keyy.currentState!.validate()) {
                                  cubit.addtasks();
                                }
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16.r)))),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
