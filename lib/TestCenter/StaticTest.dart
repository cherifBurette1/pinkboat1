import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/common/apis.dart';
import 'StaticByAlphabetic.dart';
import 'StaticTestDetails.dart';
import 'StaticbyLocation.dart';

int count = 0;
bool loader=false;
class StaticList extends StatefulWidget {
  @override
  _StaticList createState() => _StaticList();
}

class _StaticList extends State<StaticList> {
  List<dynamic> hospitals = [];
  List<dynamic> originalHospitals = [];
  List<dynamic> hospstandalone = [];
  List<dynamic> hospstandalone2 = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDefaultSnackbar(context);
      getdata();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<dynamic>>(
            future: getdata(),
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
            }));
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for test center ",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.pink[400],
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
                                        StaticListAlphabetic()));
                          },
                          child: Text(
                            'Alphabetic order',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[400]),
                            textAlign: TextAlign.center,
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
                                        TestListSortedLocation()));
                          },
                          child: Text(
                            'Nearset Location',
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
                BorderSide(color: Colors.pink[400].withOpacity(.2), width: 1),
          ),
        ),
    onChanged: (txt) {
          this.hospitals = [];
          this.hospstandalone.forEach((hospital) {
            if (hospital["test_center"]['medical_org']["name"]
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
    return Card(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => StaticDetails(),
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
                hospitalItem["test_center"]["medical_org"]["pic_url"],
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              hospitalItem["test_center"]["medical_org"]["name"] ??
                  'null bygib null kda ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              hospitalItem["test_center"]["medical_org"]["street"]["name"] +
                      ", " +
                      hospitalItem["test_center"]["medical_org"]["street"]
                          ["area"]["name"] +
                      ", " +
                      hospitalItem["test_center"]["medical_org"]["street"]
                          ["area"]["city"]["name"] ??
                  'lolololololo',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    ));
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    await getdata();
    await mess();
    setState(() {
      count += 5;
    });

    return null;
  }

  Future<List<dynamic>> getdata() async {
    dynamic data = await Apis.getStatic2();
    this.originalHospitals = data;

    setState(() {
      this.hospitals = data;
      this.hospstandalone = data[2]["staticTestCenters"];
    });
    return this.hospstandalone;
  }

  mess() async {
    dynamic data = await Apis.getStatic2();
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
