import 'package:flutter/material.dart';
import 'package:flutterapp/GeoPoint.dart';
import 'package:flutterapp/Hospital/hospital_details.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:location/location.dart';
bool loader=false;
class HospitalListSortedLocation extends StatefulWidget {
  @override
  _HospitalListSortedLocation createState() => _HospitalListSortedLocation();
}

class _HospitalListSortedLocation extends State<HospitalListSortedLocation> {
  List<dynamic> hospitals = [];
  List<dynamic> originalHospitals = [];
  List<dynamic> olHospitals = [];
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  List<dynamic> hospstandalone = [];
  List<dynamic> hospstandalone2 = [];
  void onLocationChanged(LocationData currentLocation) {
    // print(currentLocation.latitude);
    // print(currentLocation.longitude);
    // print("Location changed");
  }

  void formatOriginalHospitals() {
    if (_locationData == null) {
      print("Location service error");
      return;
    }
    // get current position
    GeoPoint location =
        new GeoPoint(_locationData.latitude, _locationData.longitude);
    this.originalHospitals.forEach((hospital) {
      GeoPoint geoHospital = new GeoPoint(hospital['lat'], hospital['lng']);
      hospital['diff'] = geoHospital.getDiff(location).round();
    });
    this.originalHospitals.sort((a, b) => a['diff'].compareTo(b['diff']));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _locationData = await location.getLocation();
      location.onLocationChanged.listen(this.onLocationChanged);

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      dynamic data = await Apis.getHospitals();
      this.originalHospitals = data;
      formatOriginalHospitals();
      setState(() {
        this.hospitals = this.originalHospitals;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Hospitals List by location',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            // fontFamily: Utils.ubuntuRegularFont
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _searchBar(),
                 loader==false? hospitals!= null
                              ? Column(children: <Widget>[
                                  ...hospitals.map<Widget>((item) {
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
            
          this.hospitals.forEach((hospital) {

            if (hospital["medical_org"]["name"]
                .toString()
                .toLowerCase()
                .contains(txt)) {
              this.olHospitals.add(hospital);
            } else if(txt=='') {
            debugPrint(hospital);
            setState(() {
              loader=false;
            });
            }
          });
          if (olHospitals != null) {
            setState(() {
              this.hospstandalone2 = this.olHospitals;
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
    print(hospitalItem['diff']);
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
                  'tony',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'Distance' + ':' + hospitalItem['diff'].toString() + 'Km',
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    ));
  }
}
