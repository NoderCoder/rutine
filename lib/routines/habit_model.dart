import 'package:hive/hive.dart';

// import 'package:json_serializable/json_serializable.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  int nameId; //should be a number associated with name
  @HiveField(1)
  bool completed;
  @HiveField(2)
  DateTime timeStamp;
  // @HiveField(3)
  // Icon icon;

  Habit({
    required this.nameId,
    required this.completed,
    required this.timeStamp,
  });
}
