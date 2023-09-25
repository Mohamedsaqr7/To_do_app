import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/view/screens/other/addtaskscreen.dart';
import 'package:todo/view/screens/other/edittaskscreen.dart';
import 'package:todo/viewmodel/services/navigation.dart';

import '../../../model/task/sportmodel.dart';

class SportWidget extends StatelessWidget {
  Sportmodel?sport;
  
   SportWidget({ this.sport,super.key});
  @override
  
  Widget build(BuildContext context) {
    int a;

    return Container(color: Color.fromARGB(255, 255, 167, 4),
      padding: EdgeInsets.all(12.w),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ListTile(title:Text(
           sport?.title1??'' ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),subtitle:           Text(
            sport?.description1??'',
            style: TextStyle(
                fontSize: 15.sp,
                color: Color.fromARGB(255, 255, 254, 253)),
          ),trailing: Icon(Icons.notifications,color: Color.fromARGB(255, 200, 221, 11),),),
          
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(174, 4, 209, 55)),
                  child: Text(
                    sport?.startdate1??'',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromARGB(234, 20, 210, 235)),
                  child: Text(
                    sport?.enddate1??'',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

      // child: Column(
      //   children: [
      //     SizedBox(
      //       height: 150.h,
      //     ),
      //     Container(
      //       height: 300.h,
      //       width: 270.w,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(80.r)),
      //         color: Color.fromARGB(255, 150, 124, 124),
      //       ),
      //       child:Column(children: [
      //         Text('data'),
      //         Text('data'),
      //         Text('data'),
      //         Text('data'),
              
      //       ],),