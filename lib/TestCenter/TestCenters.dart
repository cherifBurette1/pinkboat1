import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/DrawerDetails.dart';
import 'MobileTest.dart';
import 'StaticTest.dart';
import 'package:flutterapp/Gallery/Notify.dart';
import 'package:flutterapp/Containers/signin.dart';
import 'package:flutterapp/common/apis.dart';
class TestCenter extends StatelessWidget {
  
  final List<Tab> tabs = <Tab>[
    Tab(child: Text('Static test Center'),
    // icon: Icon(Icons.local_hospital)
    ),
    Tab(child: Text('mobile test Center'),
    // icon: Icon(Icons.tablet_mac)
    ),
   
  ];

  final List<Widget> myWidget = <Widget>[
    StaticList(),
    MobileList(),
      
  ];

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
           actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {
          if (Apis.mytoken != "") {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Notify()),); 
                } else {
                   Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),); 
                }    
              },
            )
          ],
          // flexibleSpace: SafeArea(child:TabBar( ),minimum: EdgeInsets.all(20),top: true,),
          bottom: TabBar(
            isScrollable: true,
            tabs: tabs,
          ),
          title: Text("Test center",),
          
          backgroundColor: Colors.pink[400],
        ),


          body: TabBarView(
          children: myWidget.map((Widget data) {
            return data;
          }).toList(),
        ),
        

drawer: Ndrawer(),

      ),
    );
  }
}