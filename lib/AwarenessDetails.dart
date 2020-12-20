import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:awesome_loader/awesome_loader.dart';

DateTime wow;
const double CAMERA_ZOOM = 14;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);

class AwarnessDetails extends StatefulWidget {
  _AwarnessDetails createState() => _AwarnessDetails();
}

class _AwarnessDetails extends State<AwarnessDetails> {
  Completer<GoogleMapController> _controller = Completer();
// this set will hold my markers
  Set<Marker> _markers = {};
// this will hold the generated polylines
  Set<Polyline> _polylines = {};
// this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
// this is the key object - the PolylinePoints
// which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = "AIzaSyCdBOFrc8xB8mL1cdeGQEZySAAYxbl0yoo";
  dynamic hospitalInstance;
  LatLng  cLocation;
  LatLng DEST_LOCATION;
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<LocationData> getCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return location.getLocation();
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        cLocation.latitude,
        cLocation.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
        markerId: MarkerId("sourcePin"),
        position: cLocation,
        //  icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
        markerId: MarkerId("destPin"),
        position: DEST_LOCATION,
        //  icon: destinationIcon
      ));
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    //  setPolylines();
  }

  dynamic item;

  @override
  Widget build(BuildContext context) {
    dynamic hospitalInstance = ModalRoute.of(context).settings.arguments;
    DEST_LOCATION = LatLng(hospitalInstance["lat"], hospitalInstance['lng']);
    return FutureBuilder<LocationData>(
        future: getCurrentLocation(),
        builder: (context, AsyncSnapshot<LocationData> snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
                body: Center(
                    child: AwesomeLoader(
              loaderType: AwesomeLoader.AwesomeLoader2,
              color: Colors.pink,
            )));
          }

          cLocation = LatLng(snapshot.data.latitude, snapshot.data.longitude);
          item = hospitalInstance;

          CameraPosition initialLocation = CameraPosition(
              zoom: CAMERA_ZOOM,
              bearing: CAMERA_BEARING,
              tilt: CAMERA_TILT,
              target: DEST_LOCATION);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pinkAccent,
              title: Text(
                item["title"] ?? 'null bygib null kda ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: Utils.ubuntuRegularFont
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child:
                            Image.network(item["imgUrl"], fit: BoxFit.fitWidth),

                        width: double.infinity,
                        height: 250,
                        // color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[_detailItem(context, initialLocation)],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _detailItem(BuildContext context, initialLocation) {
    wow = DateTime.parse(item["dateTime"]);
    return Column(
      children: <Widget>[
        Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item["title"] + " info",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(
                  color: Colors.black38,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: Icon(Icons.location_on),
                      title: Text("location"),
                      subtitle: Text("Lat: " +
                          item["lat"].toString() +
                          "      Long: " +
                          item["lng"].toString()),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: GoogleMap(
                          zoomGesturesEnabled: true,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          tiltGesturesEnabled: false,
                          markers: _markers,
                          polylines: _polylines,
                          mapType: MapType.normal,
                          initialCameraPosition: initialLocation,
                          onMapCreated: onMapCreated),
                    ),
                    ListTile(
                      title: Text("Description"),
                      leading: Icon(Icons.description),
                      subtitle: Text(
                        item["description"] ?? 'null bygib null kda ',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Address"),
                      subtitle: Text(
                        item["street"]["name"] +
                                ", " +
                                item["street"]["area"]["name"] +
                                ", " +
                                item["street"]["area"]["city"]["name"] ??
                            'ay 7aga',
                      ),
                    ),
                    // ListTile(
                    //   title: Text("place"),
                    //   leading: Icon(Icons.place),
                    //   subtitle: Text(
                    //     item["place"] ?? 'null bygib null kda ',
                    //   ),
                    // ),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text("Date"),
                      subtitle: Text(
                        wow.day.toString() +
                                "-" +
                                wow.month.toString() +
                                "-" +
                                wow.year.toString() ??
                            'null bygib null kda ',
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.timer),
                      title: Text("Time"),
                      subtitle: Text(wow.timeZoneOffset.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.linear_scale),
                      title: Text("Distance"),
                      subtitle: Text(
                        'Distance' +
                            ':' +
                            item['diff'].toString() +
                            ' sort by location ',
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
