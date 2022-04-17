import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rutine/routines/habit_model.dart';
import 'routines/routineCircles.dart';

//Hive
const habitListBox = "habit_list_box";
void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Habit>(habitListBox);
  Hive.registerAdapter(HabitAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFf7f5fd),
          primaryColorDark: Color(0xFF180448),
          primaryColorLight: Color(0xFF440fc0),
          cardColor: Colors.white,
          accentColor: Color(0xFFffc946),
          colorScheme: ColorScheme.light(),
          textTheme: GoogleFonts.allertaStencilTextTheme(),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 32,
                fontWeight: FontWeight.bold),
          )),
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',

      //ROutes

      // initialRoute: MyHomePage.id,

      initialRoute: StreakTable.id,
      routes: {
        // MyHomePage.id: (context) => MyHomePage(),
        // RoutinesPage.id: (context) => RoutinesPage(),
        // NavDrawer.id: (context) => NavDrawer(),
        StreakTable.id: (context) => StreakTable(),
      },
    );
  }
}
