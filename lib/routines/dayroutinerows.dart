import 'package:flutter/material.dart';
import 'package:rutine/main.dart';
import 'package:rutine/routines/habit_model.dart';
import './boxholder.dart';
import './rutine_main.dart';

import './linepainters.dart';
import 'rutine_main.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class DayRoutineRow extends StatefulWidget {
  Widget boxRow;
  String day;
  String date;
  DayRoutineRow(
      {Key? key, required this.boxRow, required this.day, required this.date})
      : super(key: key);

  @override
  State<DayRoutineRow> createState() => _DayRoutineRowState();
}

class _DayRoutineRowState extends State<DayRoutineRow> {
  late Box<Habit> stampedHabitsBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stampedHabitsBox = Hive.box(habitListBox);
  }

  void printDebug() {
    for (var habit in stampedHabitsBox.values) {
      print(
          "${habit.key} : ${habit.nameId} ${habit.completed} + ${habit.timeStamp}");
    }
  }

  @override
  Widget build(BuildContext context) {
    printDebug();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          painter: DrawDottedhorizontalline(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.date,
                    style: GoogleFonts.allertaStencil(
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      widget.day,
                      style: GoogleFonts.allertaStencil(
                          textStyle: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.normal)),
                    ),
                  ),
                ],
              ),
            ),
            widget.boxRow,
          ],
        ),
        CustomPaint(
          painter: DrawDottedhorizontalline(),
        ),
      ],
    );
  }
}

DayRoutineRow miniHabitIconRow = DayRoutineRow(
  day: "",
  date: "",
  boxRow: RoutineBoxHolderRow(),
);

//ROutine box to hold the icons for the habit
class RoutineBoxHolderRow extends StatelessWidget {
  const RoutineBoxHolderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxHolder(boxHolderChildWidget: FaIcon(FontAwesomeIcons.dumbbell)),
        BoxHolder(
            boxHolderChildWidget: FaIcon(FontAwesomeIcons.bookJournalWhills)),
        BoxHolder(boxHolderChildWidget: FaIcon(FontAwesomeIcons.peace)),
        BoxHolder(
            boxHolderChildWidget: FaIcon(FontAwesomeIcons.bookOpenReader)),
        BoxHolder(boxHolderChildWidget: FaIcon(FontAwesomeIcons.laptopCode)),
        BoxHolder(
            boxHolderChildWidget: FaIcon(FontAwesomeIcons.moneyCheckDollar)),
      ],
    );
  }
}

//this is what is displayed for the habits streaks
List<DayRoutineRow> dayRoutineRowList(DateTime startDate, DateTime endDate) {
  List<DayRoutineRow> tempdayRoutineRowList = List.empty(growable: true);

  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    tempdayRoutineRowList.add(
      DayRoutineRow(
        date: DateFormat("d").format(startDate.add(Duration(days: i))),
        day: DateFormat("E")
            .format(startDate.add(Duration(days: i)))
            .toUpperCase(),
        boxRow: Row(children: streakBoxHolderRowList()),
      ),
    );
  }
  return tempdayRoutineRowList;
}

// DayRoutineRow InitialIconRoutineRow = DayRoutineRow(
//   day: "",
//   date: "X)",
//   boxRow: RoutineBoxHolderRow(),
// );

List<BoxHolder> streakBoxHolderRowList() {
  List<BoxHolder> tempstreakBoxHolderRowList = List.empty(growable: true);
  for (int i = 1; i <= 6; i++) {
    tempstreakBoxHolderRowList.add(
      BoxHolder(
        boxHolderChildWidget: TappableCircle(id: i),
      ),
    );
  }
  return tempstreakBoxHolderRowList;
}
