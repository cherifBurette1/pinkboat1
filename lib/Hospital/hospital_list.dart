import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/DrawerDetails.dart';
import 'package:flutterapp/Gallery/Notify.dart';
import 'hospital_details.dart';
import 'package:flutterapp/common/apis.dart';
import 'hospital_list_sorted_byAlphabetic.dart';
import 'package:flutterapp/Hospital/hospital_list_sorted_byLocation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/home.dart';

int count = 0;
bool loader=false;
class HospitalList extends StatefulWidget {
  @override
  _HospitalList createState() => _HospitalList();
}

class _HospitalList extends State<HospitalList> {
  List<dynamic> hospitals = [];
  List<dynamic> originalHospitals = [];
  List<dynamic> hospstandalone = [];
  List<dynamic> hospstandalone2 = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDefaultSnackbar(context);
      Getdata();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notify()),
                );
              },
            )
          ],
          // backgroundColor: Theme.of(context).colorScheme.test,
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'Hospitals List',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: Getdata(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          _searchBar(),
                         loader==false? hospstandalone != null
                              ? Column(children: <Widget>[
                                  ...hospstandalone.map<Widget>((item) {
                                    return _listItem(
                                      item,
                                    );
                                  }).toList(),
                                ])
                              : Center(
                                  child: Text(
                                    " ",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ):
                          hospstandalone2 != null
                              ? Column(children: <Widget>[
                                  ...hospstandalone2.map<Widget>((item) {
                                    return _listItem(
                                      item,
                                    );
                                  }).toList(),
                                ])
                              : Center(
                                  child: Text(
                                    " ",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Scaffold(
                    body: Center(
                        child: AwesomeLoader(
                  loaderType: AwesomeLoader.AwesomeLoader2,
                  color: Colors.pink,
                )));
              }

              drawer:
              Ndrawer();
            }));
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for hospital",
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
                                        HospitalListSortedAlphab()));
                          },
                          child: Text(
                            'Alphabetic order',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ListTile(
                        title: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HospitalListSortedLocation()));
                          },
                          child: Text(
                            'Nearest Location',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                            textAlign: TextAlign.left,
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
          this.hospitals = [];
          this.hospstandalone.forEach((hospital) {
            if (hospital["medical_org"]["name"]
                .toString()
                .toLowerCase()
                .contains(txt)) {
              this.hospitals.add(hospital);
            } else if(txt=='') {
            debugPrint(hospital);
            setState(() {
              loader=false;
            });
            }
          });
          if (hospitals != null) {
            setState(() {
              this.hospstandalone2 = this.hospitals;
              debugPrint(hospitals.toString());
              loader=true;
            });
          }else{
            setState(() {
              loader=false;
            });
          }
        },
      ),
    ));
  }

  _listItem(
    dynamic hospitalItem,
  ) {
    // String imgUrl, String hospitalTitle, String hosAddress) {
    return Card(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => HospitalDetails(),
                settings: RouteSettings(
                  arguments: hospitalItem,
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
                hospitalItem["medical_org"]["pic_url"],
                fit: BoxFit.fitWidth,
              ),
            ),
            // Text(
            //  hospitalItem["tip"]??
            //     'null bygib null kda ',
            // style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            // ),
            Text(
              hospitalItem["medical_org"]["name"] ?? 'null bygib null kda ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              hospitalItem["medical_org"]["street"]["name"] +
                      ", " +
                      hospitalItem["medical_org"]["street"]["area"]["name"] +
                      ", " +
                      hospitalItem["medical_org"]["street"]["area"]["city"]
                          ["name"] ??
                  'tony',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    ));
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    await mess();
    await Getdata();
    setState(() {
      count += 5;
    });

    return null;
  }

  Future<List<dynamic>> Getdata() async {
    dynamic data = await Apis.getHospitals2();
    this.originalHospitals = data;
    setState(() {
      this.hospitals = data;
      this.hospstandalone = data[2]["hospitals"];
    });
    return this.hospstandalone;
  }

  mess() async {
    dynamic data = await Apis.getHospitals2();
    this.originalHospitals = data;
    setState(() {
      this.hospitals = data;
    });
  }

  showDefaultSnackbar(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 8000));
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(hospitals[1]["tip"]),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {},
        ),
      ),
    );
  }
}
