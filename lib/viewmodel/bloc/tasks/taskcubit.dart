import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/viewmodel/bloc/tasks/taskstate.dart';

import '../../../model/task/taskmodel.dart';

class taskcubit extends Cubit<taskstate> {
  taskcubit() : super(taskinitstate());
  static taskcubit get(context) => BlocProvider.of<taskcubit>(context);

  List<taskmodel> taskss = [
   
  ];
  var title = TextEditingController();
  var description = TextEditingController();
  var startdate = TextEditingController();
  var enddate = TextEditingController();
  var keyy = GlobalKey<FormState>();

  void addtasks() {
    emit(addloading());
   try{ taskss.add(taskmodel(
        title: title.text,
        description: description.text,
        startdate: startdate.text,
        enddate: enddate.text));
        clearcontrollers();
        emit(addsuccess());
        }
        catch (e){
emit(adderror());
        }
  }

  void clearcontrollers(){
    title.clear();
    description.clear();
    startdate.clear();
    enddate.clear();
  }
  int currenttaskindex=0;
  void changecurrentindex(int index){
  currenttaskindex =index;
}

void initcontroller(){
  title.text=taskss[currenttaskindex].title??'';
  description.text=taskss[currenttaskindex].description??'';
  startdate.text=taskss[currenttaskindex].startdate??'';
  enddate.text=taskss[currenttaskindex].enddate??'';
}
void edittasks(){
  emit(editloading());
  taskss[currenttaskindex].title=title.text;
  taskss[currenttaskindex].description=description.text;
  taskss[currenttaskindex].startdate=startdate.text;
  taskss[currenttaskindex].enddate=enddate.text;
  emit(editsuccess());
}
void deletetasks(){
  emit(deleteloading());
  taskss.removeAt(currenttaskindex);
  emit(deletesuccess());
}
}
