
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/screens/home.dart';
import 'package:todo/view/screens/other/others.dart';
import 'package:todo/view/screens/singup.dart';
import 'package:todo/viewmodel/bloc/login/logcubit.dart';
import 'package:todo/viewmodel/bloc/login/logstate.dart';
import 'package:todo/viewmodel/services/navigation.dart';

import '../../viewmodel/bloc/tasks/taskcubit.dart';
import '../../viewmodel/bloc/tasks/taskstate.dart';

class loginscreen extends StatelessWidget {
  loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<logcubit, logstate>(listener: (context, state) {
        // if(state is loginisuccess){
        //   Navigatioon.gopushreplace(context, homee());
        // }
    }, 
    builder: (context, state) {
      var cubit = logcubit.get(context);
      return Stack(children: [
        Image.asset(
          'images/1.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Column(children: [SizedBox(height: 30,),IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),],),
        Center(
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90.h,
                  ),
                  Container(
                    height: 641,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 24, 47, 68),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(100))),
                    child: Padding(
                      padding:  EdgeInsets.only(left:10.w,right: 10.w,top: 10.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          Text(
                            'Sign in Now',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                         
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                              validator: (value) {
                              if (value!.trim().isEmpty)
                                return 'enter email';
                              return null;
                            },
                            controller: cubit.email,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(color: Colors.white),
                              label: Text(
                                'email',
                                style: TextStyle(color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 243, 33, 33))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: cubit.password,
                              validator: (value) {
                              if (value!.trim().isEmpty)
                                return 'enter password';
                              return null;
                            },
                            
                            obscureText: cubit.obscure,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              
                               errorStyle: TextStyle(color: Colors.white),
                              label: Text(
                                'password',
                                style: TextStyle(color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.showpass();
                                },
                                icon: Icon(cubit.obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 243, 33, 33))),
                            ),
                          ),SizedBox(height: 20.h,),
                         
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              onPressed: () {
                                 if (cubit.formkey.currentState!.validate()) {
                                  cubit.loginfire();
                                  Navigatioon.gopushreplace(context, HOME());
                                  print('welcome');
                                }
                                
                              },
                              child: Container(
                                width: 300.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'LOG IN',
                                  style: TextStyle(height: 1.8,
                                      fontSize: 18.sp,
                                      color: Color.fromARGB(255, 24, 47, 68)),
                                ),
                              )),
                          SizedBox(height: 30.h),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {   Navigator.pop(context);},
                               
                              child: Text(
                                'Sign up from here',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]);
    }));
  }
}

                // SizedBox(
                //   width: double.infinity,
                //   height: 50.h,
                //   child: ElevatedButton(
                //       onPressed: () {
                //         if (cubit.formkey.currentState!.validate()) {
                //           Navigatioon.gopushreplace(context, homee());
                //           print('welcome');
                //         }
                //       },
                //       child: Text(
                //         'Login',
                //         style: TextStyle(
                //             fontSize: 25.sp, fontWeight: FontWeight.bold),
                //       ),
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.red,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(25.r)))),
                // )