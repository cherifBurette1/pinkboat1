import 'package:flutter/material.dart';
import 'package:flutterapp/common/apis.dart';
import 'mobileDetails.dart';

class MobileBySortedAlphab extends StatefulWidget {
  @override
  _MobileBySortedAlphab createState() => _MobileBySortedAlphab();
}

class _MobileBySortedAlphab extends State<MobileBySortedAlphab> {
  List<dynamic> hospitals = [];
  List<dynamic> originalHospitals = [];
  List<dynamic> hospstandalone = [];
  List<dynamic> hospstandalone2 = [];
  bool loader=false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dynamic data = await Apis.getMobileSorted2();
      this.originalHospitals = data;
      this.hospstandalone = data[2]["mobileTestCenters"];
      setState(() {
        this.hospitals = data;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'mobile center List by Alphabetic',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for test center ",
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
            if (hospital['mobileCenter']['test_center']["medical_org"]["name"]
                .toString()
                .toLowerCase()
                .contains(txt)) {
              this.hospitals.add(hospital);
            }  else if(txt=='') {
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
    dynamic hospitalItemB,
  ) {
    String a;
    String b;
    String c;

    if (hospitalItemB["nearestSchedule"] != null) {
      a = hospitalItemB["nearestSchedule"]["street_id"]["name"] ??
          'lolololololo';
      b = hospitalItemB["nearestSchedule"]["street_id"]["area"]["name"] ??
          'lolololololo';
      c = hospitalItemB["nearestSchedule"]["street_id"]["area"]["city"]
              ["name"] ??
          'lolololololo';
    } else {
      a = "no street available ";
      b = ",no area available ";
      c = ",no city available";
    }

    return Card(
        child: new InkWell(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => MobileDetails(),
                settings: RouteSettings(
                  arguments: hospitalItemB,
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
                hospitalItemB["mobileCenter"]["test_center"]["medical_org"]
                        ["pic_url"] ??
                    'null bygib null kda ',
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              hospitalItemB["mobileCenter"]["test_center"]["medical_org"]
                      ["name"] ??
                  'null bygib null kda ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              a + b + c,
              // hospitalItemC["nearestSchedule"]["street_id"]["name"]+", "+hospitalItemC["nearestSchedule"]["street_id"]["area"]["name"]+", "+hospitalItemC["nearestSchedule"]["street_id"]["area"]["city"]["name"] ?? 'lolololololo',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    ));
  }
}
