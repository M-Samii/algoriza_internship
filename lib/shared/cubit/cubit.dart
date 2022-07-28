import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:intern_program/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../Component/Constants.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());



  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  Database? database;

  void createDatabase()
  {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version)
      {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,startTime TEXT,endTime TEXT,Reminder TEXT, repeate TEXT)').then((value) {
          print('table created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });

      },
      onOpen: (database)
      {
        print('database opend');
        getDataFromDatabase(database);
        emit(AppgetDataFromDatabaseState());

      },

    ).then((value){
      database=value;
      emit(AppcreateDatabaseState());
    });
  }

  Future insertToDatabase({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required String Reminder,
    required String repeate,
  })
  async {
    /* await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("first task","0022","12","1","yes","daily")').then((value){print('$value inserted successfully');}).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });*/
    return await database!.transaction((txn) async {
      int? id1 = await txn.rawInsert(
          'INSERT INTO tasks(title, date, startTime, endTime, Reminder, repeate) VALUES("$title","$date","$startTime","$endTime","$Reminder","$repeate")').then((value){
            print('$value inserted successfully');
            emit(AppinsertToDatabaseState());
            getDataFromDatabase(database);
          }).catchError((error){
        print('error when insertion new record  ${error.toString()}');
      });

    });


  }
  Future<List<Map>> getDataFromDatabase(database)async{
    // List<Map> list = await database!.rawQuery('SELECT * FROM tasks WHERE ID = 21');
    list = await database!.rawQuery('SELECT * FROM tasks');
    print(list);
    return list;

  }


  ///////////reminder
  String? selectedRemindItems;
  void reminderselectionstate( @required String va ){
    selectedRemindItems=va;
    emit(AppDateSelctionState());
  }
  ///////////Repeat
  String? selectedRepeatItems;
  void Repeatselectionstate( @required String za ){
    selectedRepeatItems=za;
    emit(AppDateSelctionRState());
  }
}