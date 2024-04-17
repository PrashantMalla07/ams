

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AssignmentScreen extends StatefulWidget {
  final zoomController;
  const AssignmentScreen({ Key? key, this.zoomController }) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<AssignmentScreen> {

  List science  =[
    'assets/images/Teaching-cuate.png',
    'assets/images/Teaching-bro.png',
    'assets/images/Teaching-amico.png'
  ];

  List math  =[
    'assets/images/Teaching-bro.png',
    'assets/images/Teaching-pana.png',
    'assets/images/Teaching-rafiki.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
       
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Today's Activity", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
              const SizedBox(height: 8,),
              const Text('12 new assignments uploaded', style: TextStyle(fontSize: 20, color: Colors.grey),),
              const SizedBox(height: 20,),
              overlapped(),
              const SizedBox(height: 20,),
              const Divider(thickness: 1,),
              const SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset('assets/icons/1.png'),
                ),
                title: const Text('Web Technology', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('3 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: science.length,
                  itemBuilder: (context, index){
                    return AspectRatio(
                      aspectRatio: 1.5,
                      child: Container(
                        height: 250,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(science[index]),
                            fit: BoxFit.contain
                          ),
                          color: Color.fromARGB(255, 180, 226, 239),
                        ),
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(height: 8,),
               ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset('assets/icons/2.png'),
                ),
                title: const Text('Flutter', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('4 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: math.length,
                  itemBuilder: (context, index){
                    return AspectRatio(
                      aspectRatio: 1.5,
                      child: Container(
                        height: 250,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(math[index]),
                            fit: BoxFit.contain
                          ),
                          color: Color.fromARGB(255, 180, 226, 239),
                        ),
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 180, 226, 239),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.home),
            label: '_'
          ),
         
          BottomNavigationBarItem(
            icon: Icon(IconlyBroken.notification),
            label: ''
          ),
          
        ],
        onTap: (index){
            // _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 128, 219, 231),
        onPressed:(){  },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

   Widget overlapped() {
      const overlap = 35.0;
      final items = [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            child: Image.asset('assets/icons/1.png'),
           
            )
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            child: Image.asset('assets/icons/2.png'),
            backgroundColor: Colors.green
            )
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            child: Image.asset('assets/icons/3.png'),
            
            )
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            child: Image.asset('assets/icons/6.png'),
            backgroundColor: Color.fromARGB(255, 128, 219, 231)
            )
        ),
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            child: Text('9', style: TextStyle(color: Colors.grey[600], fontSize: 20),),
            backgroundColor: Color.fromARGB(255, 128, 219, 231)
          )
        ),
      ];

      List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
          child: items[index],
        );
      });

      return Stack(children: stackLayers);
    }
}