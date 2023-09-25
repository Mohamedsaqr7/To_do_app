import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/viewmodel/bloc/login/logstate.dart';

class logcubit extends Cubit<logstate>{
  logcubit():super(loginitstate());
    static logcubit get(context) => BlocProvider.of<logcubit>(context);

bool obscure = true;

  TextEditingController email = TextEditingController();
  TextEditingController time = TextEditingController();

  TextEditingController password = TextEditingController();

  var formkey = GlobalKey<FormState>();
  void showpass(){
    obscure = !obscure;
    emit(showpassstate());
  
  }
  void loginfire() {
    emit(logloading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
      print(value.user?.email);

      emit(logsuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(logerror());
    });
  }
}