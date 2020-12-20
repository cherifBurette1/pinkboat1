import 'package:flutter/material.dart';
import 'package:flutterapp/AwarenessDetails.dart';
import 'package:flutterapp/DrawerDetails.dart';
import 'AwarenessByLocation.dart';
import 'common/apis.dart';
import 'package:flutterapp/Gallery/Notify.dart';
import 'package:flutterapp/Containers/signin.dart';
DateTime wow;
int count = 0;
class Awareness extends StatefulWidget {
  @override
  _Awareness createState() => _Awareness();
}

class _Awareness extends State<Awareness> {
  List<dynamic> awareness = [];
  List<dynamic> originalawareness = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     istate();
    });
  }

  Widget build(BuildContext context) {

      return Scaffold(
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
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'Awareness Campaigns',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),

          // actions: <Widget>[
          //   _searchBar(),
          // ],
        ),
        body: new RefreshIndicator(
           onRefresh: _handleRefresh,
      child:
            
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _searchBar(),
                    ...awareness.map<Widget>((item) {
                      return _listItem(
                        item,
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
      ),
          
        drawer: Ndrawer(),
      );
    
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for Awareness",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.pinkAccent,
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.filter_list),
              iconSize: 40,
              color: Colors.pink[400],
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.sort),
                          iconSize: 20,
                          color: Colors.pink[400],
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          'Sort By',
                          style:
                              TextStyle(fontSize: 20, color: Colors.pink[400]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                        title: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AwarenessSortedLocation()));
                          },
                          child: Text(
                            'Nearest Location',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide:
                BorderSide(color: Colors.pinkAccent.withOpacity(.2), width: 1),
          ),
        ),
        onChanged: (txt) {
          this.awareness = [];
          this.originalawareness.forEach((hospital) {
            if (hospital["title"]
                .toString()
                .toLowerCase()
                .contains(txt)) {
              this.awareness.add(hospital);
              debugPrint(awareness.toString());
            }
          });
          setState(() {
            this.awareness = this.awareness;
          });
        },
      ),
    ));
  }

  _listItem(
    dynamic item,
  ) {
    wow = DateTime.parse(item["dateTime"]);
    // String imgUrl, String hospitalTitle, String hosAddress) {
    return Card(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => AwarnessDetails(),
                settings: RouteSettings(
                  arguments: item,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100,
              width: 350,
              child: Image.network(
                item["imgUrl"],
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              item["title"] ?? 'null bygib null kda ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 8,),
            //  Text(
            //   item["description"] ?? 'null bygib null kda ',
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(
              height: 5,
            ),
            Text(
              wow.day.toString() +
                      "-" +
                      wow.month.toString() +
                      "-" +
                      wow.year.toString() ??
                  'null bygib null kda ',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item["street"]["name"] +
                      ", " +
                      item["street"]["area"]["name"] +
                      ", " +
                      item["street"]["area"]["city"]["name"] ??
                  'ay 7aga',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   item["place"] ?? 'ay 7aga',
            //   style: TextStyle(color: Colors.grey.shade600),
            // ),
          ],
        ),
      ),
    ));
  }
   Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    await istate();
    setState(() {
      count += 5;
    });

    return null;
  }
   istate() async {
      int camel = 0;
    count = count + camel;
    print(count);
     dynamic data = await Apis.getAwareness();
      this.originalawareness = data;
      setState(() {
        this.awareness = data;
      });
  }
}
