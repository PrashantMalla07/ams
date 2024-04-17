import 'package:acamansys/model/course_card.dart';
import 'package:acamansys/model/global_variables.dart';
import 'package:acamansys/navigation_drawer/navigationDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
  ];

  bool isDrawerOpen = false;

  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    double cardRadius = MediaQuery.of(context).size.width / 5;
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: const NavDrawer(),
      mainScreen: Scaffold(
        backgroundColor: const Color.fromRGBO(233, 243, 245, 1),
        appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: const Color.fromRGBO(233, 243, 245, 1),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _drawerController.toggle!();
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.4,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.width * 0.4,
                      initialPage: 0,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                    ),
                    items: imgList.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Image.asset(
                              i,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Course',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return CourseCard(
                      title: course['title'] as String,
                      image: course['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromARGB(255, 130, 139, 139)
                          : const Color.fromARGB(255, 169, 178, 181),
                    );
                  },
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                    Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCard("100", "Student", cardRadius),
                        buildCard("20", "Teacher", cardRadius),
                        buildCard("5", "Section", cardRadius),
                      ],
                    ),
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                    Text(
                      'Seat Status',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCard("200", "Total", cardRadius),
                        buildCard("150", "Booked", cardRadius),
                        buildCard("50", "Available", cardRadius),
                      ],
                    ),
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                    Text(
                      'Thank You',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Divider(
                      height: 20,
                      indent: 20,
                      endIndent: 20,
                      thickness: 3,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      borderRadius: 24.0,
      showShadow: false,
      angle: -0,
      slideWidth: MediaQuery.of(context).size.width * 0.8, 
      openCurve: Curves.fastOutSlowIn, 
      closeCurve: Curves.easeInBack, 
    );
  }

  Widget buildCard(String text, String label, double cardRadius) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          elevation: 20.0,
          shape: CircleBorder(
            side: BorderSide(color: Colors.white70, width: 2),
          ),
          shadowColor: Colors.black,
          child: Container(
            alignment: Alignment.center,
            height: cardRadius,
            width: cardRadius,
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
