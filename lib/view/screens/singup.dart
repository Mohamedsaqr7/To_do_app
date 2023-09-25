import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/screens/firstpage.dart';
import 'package:todo/view/screens/home.dart';
import 'package:todo/view/screens/other/others.dart';

import '../../viewmodel/bloc/signup/signstate.dart';
import '../../viewmodel/bloc/signup/singcubit.dart';
import '../../viewmodel/services/navigation.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<signcubit, signstate>(listener: (context, state) {
      
    }, builder: (context, state) {
      var cubit = signcubit.get(context);
      return Stack(children: [
        Image.asset(
          'images/1.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
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
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty) return'enter the user name';
                              return null;
                              
                            },
                            controller: cubit.username,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                               errorStyle: TextStyle(color: Colors.white),
                              label: Text(
                                'username',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 255, 0, 0))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty)
                                return 'enter your email';
                              return null;
                            },
                            controller: cubit.email,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                               errorStyle: TextStyle(color: Colors.white),
                              label: Text(
                                'email',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(Icons.email,
                                  color: Color.fromARGB(255, 24, 47, 68)),
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
                                      color: Color.fromARGB(255, 255, 0, 0))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty)
                                return 'enter password';
                              return null;
                            },
                            controller: cubit.password,
                            obscureText: cubit.obscure2,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                               errorStyle: TextStyle(color: Colors.white),
                              label: Text(
                                'password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.showpass2();
                                },
                                icon: Icon(cubit.obscure2
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
                                      color: Color.fromARGB(255, 255, 0, 0))),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.trim().isEmpty)
                              return'enter your password';
                                else if(cubit.password.text!=cubit.password3.text)
                                return 'not the same password';
                                else if(cubit.password.text==cubit.password3.text)
                              return null;
                            },
                            controller: cubit.password3,
                            cursorColor: Color.fromARGB(255, 24, 47, 68),
                            keyboardType: TextInputType.name,
                                                        obscureText: cubit.obscure3,

                            decoration: InputDecoration(
                               errorStyle: TextStyle(color: Colors.white),
                              
                              label: Text(
                                'password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 24, 47, 68)),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 24, 47, 68),
                              ),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.showpass3();
                                },
                                icon: Icon(cubit.obscure3
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
                                      color: Color.fromARGB(255, 252, 2, 2))),
                            ),
                          ),
                         
                          SizedBox(
                            height: 20,
                          ),
                         
                          MaterialButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              onPressed: () {
                                if (
                                  cubit.formkey.currentState!.validate()||cubit.password==cubit.password3) {
                                 cubit.register();
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
                                  'SIGN UP',
                                  style: TextStyle(
                                      height: 1.8,
                                      fontSize: 18.sp,
                                      color: Color.fromARGB(255, 24, 47, 68)),
                                ),
                              )),
                          SizedBox(height: 30.h),
                          Text(
                            'Already have an account',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                  Navigatioon.gopush(context, loginscreen());},
                              child: Text(
                                'Sign in from here',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white),
                              ))
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
