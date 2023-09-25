import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/view/screens/other/others.dart';
import 'package:todo/view/screens/sport/sports.dart';
import 'package:todo/viewmodel/services/navigation.dart';

class HOME extends StatelessWidget {
  const HOME({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Stack(children: [
            //  Image.asset('images/1.jpg',fit: BoxFit.cover,
            //  height: double.infinity,width: double.infinity,),
            Positioned(
              child: CircleAvatar(
                radius: 112,
                backgroundColor: Color.fromARGB(125, 202, 194, 170),
                child: InkWell(
                  onTap: () {
                    Navigatioon.gopush(context, (Sport()));
                  },
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundImage: AssetImage('images/15.jpg'),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              left: 20.w,
              top: 150.h,
            ),
            Positioned(
              child: CircleAvatar(
                radius: 112,
                backgroundColor: Color.fromARGB(125, 202, 194, 170),
                child: InkWell(
                  onTap: () {
                    Navigatioon.gopush(context, Others());
                  },
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundImage: AssetImage('images/1.jpg'),
                    child: Container(
                      child: Text(
                        'OTHERS',
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              left: 100.w,
              top: 400.h,
            )
          ]),
        ));
  }
}
