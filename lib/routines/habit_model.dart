import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import 'package:json_serializable/json_serializable.dart';

// // part 'habit_model.g.dart';
// part "habit_model.g.dart";

// part 'routines/habit_model.g.dart';

// @HiveType(typeId: 0)
class Habit {
  // @HiveField(0)
  int Nameid; //should be a number associated with name
  // @HiveField(1)
  bool completed;
  // @HiveField(2)
  DateTime timeStamp;
  // @HiveField(3)
  // Icon icon;

  Habit({
    required this.Nameid,
    required this.completed,
    required this.timeStamp,
  });
}
