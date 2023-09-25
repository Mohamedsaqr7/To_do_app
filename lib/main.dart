import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/view/screens/login.dart';
import 'package:todo/view/screens/singup.dart';
import 'firebase_options.dart';
import 'view/screens/home.dart';
import 'viewmodel/bloc/login/logcubit.dart';
import 'viewmodel/bloc/signup/singcubit.dart';
import 'viewmodel/bloc/sport/sportcubit.dart';
import 'viewmodel/bloc/tasks/taskcubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => taskcubit()),
        BlocProvider(create: (context) => Sportcubit()),
        BlocProvider(create: (context) => logcubit()),
        BlocProvider(create: (context) => signcubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignUp(),
          );
        },
      ),
    );
  }
}