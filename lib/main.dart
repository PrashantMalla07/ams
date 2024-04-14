import 'package:acamansys/page/dashboard/dashboard.dart';
import 'package:acamansys/page/student/student.dart';
import 'package:acamansys/page/student/student_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: "Academy Management System",
  theme: ThemeData(
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 130, 139, 139),
      primary: const Color.fromARGB(255, 130, 139, 139),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      )
    ),
  ),  
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/student': (context) => StudentUI(students: dummyStudentData),
    },);
}
}