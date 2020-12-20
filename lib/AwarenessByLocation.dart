import 'package:flutter/material.dart';
import 'package:flutterapp/AwarenessDetails.dart';
import 'GeoPoint.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:location/location.dart';

DateTime wow;

int count = 0;

class AwarenessSortedLocation extends StatefulWidget {
  @override
  _AwarenessSortedLocation createState() => _AwarenessSortedLocation();
}

class _AwarenessSortedLocation extends State<AwarenessSortedLocation> {
  List<dynamic> awareness = [];
  List<dynamic> originalawareness = [];
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
    this.originalawareness.forEach((hospital) {
      GeoPoint geoHospital = new GeoPoint(hospital['lat'], hospital['lng']);
      hospital['diff'] = geoHospital.getDiff(location).round();
    });
    this.originalawareness.sort((a, b) => a['diff'].compareTo(b['diff']));
  }

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
          'Awareness Campaign List',
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
    );
  }

  _searchBar() {
    return (Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search for Awareness ",
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
          this.awareness = [];
          this.originalawareness.forEach((hospital) {
            if (hospital["name"].toString().toLowerCase().contains(txt)) {
              this.awareness.add(hospital);
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 8,
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
              height: 8,
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
              height: 8,
            ),
            // Text(
            //   item["place"] ?? 'null bygib null kda ',
            // //   style: TextStyle(fontSize: 20),
            // ),
            //        SizedBox(
            //   height: 8,
            // ),
            Text(
              'Distance' + ':' + item['diff'].toString() + 'Km',
              style: TextStyle(color: Colors.grey.shade800),
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

    dynamic data = await Apis.getAwareness();
    this.originalawareness = data;
    formatOriginalHospitals();
    setState(() {
      this.awareness = this.originalawareness;
    });
  }
}
