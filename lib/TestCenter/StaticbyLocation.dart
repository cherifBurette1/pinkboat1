import 'package:flutter/material.dart';
import 'package:flutterapp/GeoPoint.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:location/location.dart';
import 'StaticTestDetails.dart';

class TestListSortedLocation extends StatefulWidget {
  @override
  _TestListSortedLocation createState() => _TestListSortedLocation();
}

class _TestListSortedLocation extends State<TestListSortedLocation> {
  List<dynamic> hospitals = [];
    List<dynamic> hospitalstand = [];
  List<dynamic> originalHospitals = [];
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

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

      dynamic data = await Apis.getTestCenterStatic();
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
        backgroundColor: Colors.pink[400],
        title: Text(
          'test center List by location',
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
              ...hospitals.map<Widget>((item) {
                return _listItem(
                  item,
                  // item["medical_org"]["pic_url"],
                  // item["medical_org"]["name"],
                  // item["medical_org"]["address"],
                );
              }).toList(),
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
            color: Colors.pink[400],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide:
                BorderSide(color: Colors.pink[400].withOpacity(.2), width: 1),
          ),
        ),
        onChanged: (txt) {
          this.hospitalstand = [];
          
          this.originalHospitals.forEach((hospital) {
            if (hospital['test_center']['medical_org']["name"].toString().toLowerCase().contains(txt)) {
              this.hospitalstand.add(hospital);
            }
          });
          if(hospitalstand!=null){
            if(txt!=''){
          setState(() {
            this.hospitals = this.hospitalstand;
          });
            }
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
