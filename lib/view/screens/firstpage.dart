import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/screens/login.dart';
import 'package:todo/view/screens/singup.dart';
import 'package:todo/viewmodel/services/navigation.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
         
         Image.asset('images/1.jpg',fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
         Positioned.fill(top: 50.h,
          left: 60.w,
          child: Text('Welcome to our APP',style: TextStyle(
            color: Color.fromARGB(255, 24, 47, 68),
            fontSize: 25.sp,fontWeight: FontWeight.bold),)),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
              height: 530.h,
            ),
              MaterialButton(
            
              clipBehavior: Clip.antiAliasWithSaveLayer,
                 onPressed: 
                 () => Navigatioon.gopush(context, SignUp()),
                child: Container(width: 300.w,height: 40.h,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 24, 47, 68),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Text(textAlign: TextAlign.center,
                    'SIGN UP',
                    style: TextStyle(fontSize: 18.sp, height: 1.8.h,color: Color.fromARGB(255, 255, 230, 0)),
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
         Text(
             'Already a member?',
             style: TextStyle(fontSize: 12.sp,
               color: Color.fromARGB(255, 24, 47, 68),
             ),
         ),
         TextButton(
               onPressed: () => Navigatioon.gopush(context, loginscreen()),
               child: Text(
                 'Sign In',
                 style: TextStyle(color: Color.fromARGB(255, 255, 230, 0),
                 fontWeight: FontWeight.bold,fontSize: 15.sp),
                 
               ),
               ),],),
          )
        ]),
      ),
    );
  }
}
