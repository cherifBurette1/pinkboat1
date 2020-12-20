import 'package:flutter/material.dart';
import 'Widgets/sharedpref.dart';
import 'Gallery/Gallery_page.dart';
import 'Hospital/hospital_list.dart';
import 'Awareness.dart';
import 'package:flutterapp/TestCenter/TestCenters.dart';
import 'main.dart';

String  cunt = "";
void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int _selectedPage = 0;

  final _pageOptions = [
    GalleryPage(),
    HospitalList(),
    TestCenter(),
    Awareness(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshared();
  }

  dynamic userdetails;
  Widget build(BuildContext context) {
    dynamic userInstance = ModalRoute.of(context).settings.arguments;
    userdetails = userInstance;
  
       return Scaffold(
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.pink[400],
            fixedColor: Colors.white,
            currentIndex: _selectedPage,
            onTap: (int index) {
              if (cunt == "") {
                setState(() {
                  _selectedPage = index;
                });
              }
            },

            // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.photo),
                title: new Text('Media Center'),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.add_alert),
                title: new Text('Hospital'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.airline_seat_flat_angled),
                  title: Text('Testing')),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_location),
                title: Text('Awareness'),
              )
            ],
          ),
        );
  }
}
