import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/view/screens/other/addtaskscreen.dart';
import 'package:todo/view/screens/other/edittaskscreen.dart';
import 'package:todo/viewmodel/services/navigation.dart';

import '../../../model/task/taskmodel.dart';

class homewidget extends StatelessWidget {
  taskmodel ?task;
   homewidget({ this.task,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ListTile(title:Text(
           task?.title??'' ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),subtitle:           Text(
            task?.description??'',
            style: TextStyle(
                fontSize: 15.sp,
                color: Color.fromARGB(255, 129, 122, 122)),
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
                    task?.startdate??'',
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
                    task?.enddate??'',
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
