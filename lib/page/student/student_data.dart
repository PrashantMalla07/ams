class StudentData {
  final int id;
  final String firstName;
  final String lastName;
  final String roll;
  final String email;
  final String phone;
  final String imagePath;

  StudentData({required this.id, required this.firstName, required this.lastName, required this.roll,required this.email,required this.phone, required this.imagePath});
}

List<StudentData> dummyStudentData = [
  StudentData(
    id: 1,
    firstName: "Prashant",
    lastName: "Malla",
    roll: "001",
    email: "pm@gmail.com",
    phone: "123456789",
    imagePath: "assets/1.jpg",
  ),
  StudentData(
    id: 2,
    firstName: "Ashish",
    lastName: "Kunwar",
    roll: "002",
    email: "ak@gmail.com",
    phone: "023456789",
    imagePath: "assets/2.jpg",
  ),
  // Add more dummy data as needed
];
