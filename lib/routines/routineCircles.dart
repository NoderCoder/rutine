import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rutine/main.dart';
import './linepainters.dart';
import './dayroutinerows.dart';
import 'habit_model.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'boxholder.dart';

class StreakTable extends StatefulWidget {
  const StreakTable({Key? key}) : super(key: key);
  static String id = "StreakTable";

  @override
  State<StreakTable> createState() => _StreakTableState();
}

class _StreakTableState extends State<StreakTable> {
  final itemKey = GlobalKey();
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomPaint(
              painter: DrawHorizontallStraightLine(),
            ),
            miniHabitIconRow,
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: ListView(
                  controller: scrollController,
                  //TODO1: currebntly betwen some months will need to make ist dynamic
                  children: dayRoutineRowList(
                      DateTime.utc(2022, 03), DateTime.utc(2022, 05))),
            ),
          ],
        ),
      ),
    );
  }
}

//--------------------------
//lIST OF HABITS T
// List<Habit> habitList = List.empty(growable: true);
List<Habit> habitList = [
  //firstlistitem kept due to error. Will need to omit this date
  Habit(nameId: 1, completed: false, timeStamp: DateTime.utc(1989, 11, 9))
];

//-------------------------
//when moved to seperate file thsi creates error : gotta fix it
// the circle whic is tapped, lowesat in the widget tree
class TappableCircle extends StatefulWidget {
  // id will be used to define the number linked ot the daily habit
  final int id;
  TappableCircle({Key? key, required this.id}) : super(key: key);

  @override
  _TappableCircleState createState() => _TappableCircleState();
}

class _TappableCircleState extends State<TappableCircle> {
  Color tappableCircleColor = Colors.white;
  bool isCircleTapped = false;

  //New Code for hive
  late Box<Habit> stampedHabitListBox;
  @override
  void initState() {
    super.initState();
    stampedHabitListBox = Hive.box(habitListBox);
  }

  Color getColour(bool isCompleted) {
    Color tempColor = Colors.white;
    if (isCompleted == true) {
      if (widget.id == 1) {
        tempColor = Color.fromRGBO(255, 59, 48, 1);
      } else if (widget.id == 2) {
        tempColor = Color.fromRGBO(255, 150, 1, 1);
      } else if (widget.id == 3) {
        tempColor = Color.fromRGBO(255, 204, 0, 1);
      } else if (widget.id == 4) {
        tempColor = Color.fromRGBO(52, 198, 90, 1);
      } else if (widget.id == 5) {
        tempColor = Color.fromRGBO(1, 122, 255, 1);
      } else if (widget.id == 6) {
        tempColor = Color.fromRGBO(89, 86, 212, 1);
      }
    } else {
      tempColor = Colors.white;
    }
    return tempColor;
  }

//

  void onButtonTap() {
    isCircleTapped = !isCircleTapped;
    tappableCircleColor = getColour(isCircleTapped);
    Habit tempHabit = Habit(
        nameId: widget.id,
        completed: isCircleTapped,
        timeStamp: DateTime.now());
    habitList.add(tempHabit);
    stampedHabitListBox.add(tempHabit);

    //printing objects
    print("Values of the box : ${stampedHabitListBox.values}");
    print("Lenght of the box : ${stampedHabitListBox.length}");
    print("Keys of the box : ${stampedHabitListBox.keys}");
  }

  // Color onCircleTap(Color color, int id) {
  //   // int tempcounter = 1;
  //   Habit tempHabit = Habit(
  //       nameId: id, completed: !isCircleTapped, timeStamp: DateTime.now());
  //   if (color == Colors.white) {
  //     if (id == 1) {
  //       habitList.add(tempHabit);
  //       //to remove the first item in a list
  //       // tempcounter == 1
  //       //     ? habitList.removeAt(0)
  //       //     : tempcounter = tempcounter + 1;
  //       return Color.fromRGBO(255, 59, 48, 1);
  //     } else if (id == 2) {
  //       habitList.add(tempHabit);
  //       return Color.fromRGBO(255, 150, 1, 1);
  //     } else if (id == 3) {
  //       habitList.add(tempHabit);
  //       return Color.fromRGBO(255, 204, 0, 1);
  //     } else if (id == 4) {
  //       habitList.add(tempHabit);
  //       return Color.fromRGBO(52, 198, 90, 1);
  //     } else if (id == 5) {
  //       habitList.add(tempHabit);
  //       return Color.fromRGBO(1, 122, 255, 1);
  //     } else if (id == 6) {
  //       habitList.add(tempHabit);
  //       return Color.fromRGBO(89, 86, 212, 1);
  //     }
  //   } else {
  //     habitList.add(tempHabit);
  //     return Colors.white;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double cRadius = 15;
    return InkWell(
      onTap: () => setState(() {
        onButtonTap();
        // tappableCircleColor = onCircleTap(tappableCircleColor, widget.id);
        // isCircleTapped = !isCircleTapped;

        for (var habit in habitList) {
          // habitListBox.add(habit.nameId);
          print(
              " List lenght : ${habitList.length}  Name id : ${habit.nameId} Completed : ${habit.completed} + datestamp : ${habit.timeStamp} ");
        }

        print("another one, DJ Kjhaleed");
      }),
      child: CircleAvatar(
        radius: cRadius,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          backgroundColor: tappableCircleColor,
          radius: cRadius - 2,
        ),
      ),
    );
  }
}

//Date time returner : this will gove me the list of dates to be displayed inbetween the streakz app
//TODO1: currebntly betwen some months will need to make ist dynamic


//Widget hirarchary
// Tappable circle < StreakBoxholder < StreakBOXholder ROw < DayRoutineROw <