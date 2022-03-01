import 'package:eclipsdigital/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:eclipsdigital/style/theme.dart' as style;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eclips Digital",
      home: const MainScreen(),
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: "Nunito",
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: "Nunioto",
            ),
        scaffoldBackgroundColor: style.Colors.scaffoldDarkBack,
        primaryColorBrightness: Brightness.dark,
        splashColor: Colors.black.withOpacity(0.0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: style.Colors.mainColor,
          selectedIconTheme: IconThemeData(color: style.Colors.mainColor),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xff979797),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color(0xff979797),
            ),
          ),
        ),
        primaryColor: Colors.black,
        dividerColor: Colors.white54,
        iconTheme: const IconThemeData(color: Colors.white),
        primaryIconTheme: const IconThemeData(color: Colors.black87),
      ),
    );
  }
}
