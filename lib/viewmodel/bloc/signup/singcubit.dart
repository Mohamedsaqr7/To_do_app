import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/viewmodel/bloc/signup/signstate.dart';
import 'package:flutter/material.dart';

class signcubit extends Cubit<signstate>{
    signcubit():super(signinitstate());
        static signcubit get(context) => BlocProvider.of<signcubit>(context);
bool obscure2 = true;
bool obscure3 = true;
TextEditingController email = TextEditingController();
TextEditingController username = TextEditingController();
  TextEditingController time2 = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController password3 = TextEditingController();

  var formkey = GlobalKey<FormState>();
  void showpass2(){
    obscure2 = !obscure2;
    emit(showpass2state());
  }
  void showpass3(){
    obscure3 = !obscure3;
    emit(showpass3state());
  }
  void register() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text).then((value) {
          print(value.user?.email);
          print(value.user?.uid);
          print('succesfully');
        }).catchError((onError){
print(onError.toString());
        });
  }

}