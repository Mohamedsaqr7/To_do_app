import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/viewmodel/bloc/sport/sportstate.dart';

import '../../../model/task/sportmodel.dart';

class Sportcubit extends Cubit<sportstate> {
  Sportcubit() : super(Sportinitstate());
  static Sportcubit get(context) => BlocProvider.of<Sportcubit>(context);

  List<Sportmodel> sports = [
    Sportmodel(
        title1: 'learn c++ and oop',
        description1: 'fjlskflsk',
        startdate1: '12-02-2022',
        enddate1: '12-08-2022'),
    Sportmodel(
        title1: 'learn c++ and oop',
        description1: 'fjlskflsk',
        startdate1: '12-02-2022',
        enddate1: '12-08-2022'),
   
  ];
  
  var title1 = TextEditingController();
  var description1 = TextEditingController();
  var startdate1 = TextEditingController();
  var enddate1 = TextEditingController();
  var keyy1 = GlobalKey<FormState>();

  void Addtasks() {
    emit(Addloading());
   try{ sports.add(Sportmodel(
        title1: title1.text,
        description1: description1.text,
        startdate1: startdate1.text,
        enddate1: enddate1.text));
        clearcontrollers1();
        emit(
          Addsuccess());
        }
        catch (e){
emit(Adderror());
        }
  }

  void clearcontrollers1(){
    title1.clear();
    description1.clear();
    startdate1.clear();
    enddate1.clear();
  }
  int currenttaskindex1=0;
  void changecurrentindex1(int index){
  currenttaskindex1 =index;
}

void Initcontroller(){
  title1.text=sports[currenttaskindex1].title1??'';
  description1.text=sports[currenttaskindex1].description1??'';
  startdate1.text=sports[currenttaskindex1].startdate1??'';
  enddate1.text=sports[currenttaskindex1].enddate1??'';
}
void Edittasks(){
  emit(Editloading());
  sports[currenttaskindex1].title1=title1.text;
  sports[currenttaskindex1].description1=description1.text;
  sports[currenttaskindex1].startdate1=startdate1.text;
  sports[currenttaskindex1].enddate1=enddate1.text;
  emit(Editsuccess());
}
void Deletetasks(){
  emit(Deleteloading());
  sports.removeAt(currenttaskindex1);
  emit(Deletesuccess());
}
}
