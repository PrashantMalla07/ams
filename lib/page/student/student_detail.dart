// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:acamansys/page/student/student_data.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  final StudentData student;

  const StudentDetailScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${student.firstName} ${student.lastName}'),
      ),
     body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(student.imagePath),
                ),
              ),
            ),
            ListTile(
              title: Text('Roll: ${student.roll}'),
            ),
            ListTile(
              title: Text('Email: ${student.email}'),
            ),
            ListTile(
              title: Text('Phone: ${student.phone}'),
            ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Results',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Subject')),
                DataColumn(label: Text('Grade')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('WEB TECHNOLOGY')),
                  DataCell(Text('A')),
                ]),
                DataRow(cells: [
                  DataCell(Text('FLUTTER')),
                  DataCell(Text('B')),
                ]),
                DataRow(cells: [
                  DataCell(Text('DART')),
                  DataCell(Text('A+')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
