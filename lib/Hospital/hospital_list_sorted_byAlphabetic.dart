import 'package:flutter/material.dart';
//import 'package:flutterapp/Hospital/hospital_details_sorted_byAlphabetict';
import 'hospital_details.dart';
import 'package:flutterapp/common/apis.dart';

int count = 0;
bool loader=false;
class HospitalListSortedAlphab extends StatefulWidget {
  @override
  _HospitalListSortedAlphab createState() => _HospitalListSortedAlphab();
}

class _HospitalListSortedAlphab extends State<HospitalListSortedAlphab> {
  List<dynamic> hospitals = [];
  List<dynamic> originalHospitals = [];
  List<dynamic> hospstandalone = [];
 List<dynamic> hospstandalone2 = [];
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
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'hospital List by Alphabetic',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
          centerTitle: true,
        ),
        body: new RefreshIndicator(
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
        ));
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for hospital ",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.pinkAccent,
          ),
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
                  'lolo9lololo',
              style: TextStyle(color: Colors.grey.shade600),
            ),
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
    dynamic data = await Apis.getHospitalsSorted2();
    this.originalHospitals = data;
    setState(() {
      this.hospitals = data;
      this.hospstandalone = data[2]["hospitals"];
    });
  }
}
