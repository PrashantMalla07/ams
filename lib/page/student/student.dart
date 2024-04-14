import 'package:acamansys/page/student/student_data.dart';
import 'package:acamansys/page/student/student_detail.dart';
import 'package:flutter/material.dart';



class StudentUI extends StatelessWidget {
  final List<StudentData> students;

  const StudentUI({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(students[index].imagePath),
            ),
            title: Text('${students[index].firstName} ${students[index].lastName}'),
            subtitle: Text('Roll: ${students[index].roll}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailScreen(student: students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
