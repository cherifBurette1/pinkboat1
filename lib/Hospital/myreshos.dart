import 'dart:async';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutterapp/Hospital/hospital_list_sorted_byAlphabetic.dart';
import 'package:location/location.dart';
import 'package:flutterapp/Reservation/reservation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapp/MyReservation/editres.dart';
import 'package:flutterapp/MyReservation/my_res.dart';

String checkresponse;
String medicalorg;

const double CAMERA_ZOOM = 14;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class HospitalDetailsAlph extends StatefulWidget {
  _HospitalDetailsAlph createState() => _HospitalDetailsAlph();
}

class _HospitalDetailsAlph extends State<HospitalDetailsAlph> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dynamic response = await Apis.getHospitalsSortedDetails(medicalorg);

      setState(() {
        this.hospitalItemA = response;
      });
    });
  }

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
 
  LatLng cLocation;
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

    dynamic hospitalItemA;

  Widget build(BuildContext context) {
    String hospitalInstance = ModalRoute.of(context).settings.arguments;
     setState(() {
      medicalorg = hospitalInstance; 
     }); 
    DEST_LOCATION = LatLng(hospitalItemA!=null?hospitalItemA['lat']:30.23265556, hospitalItemA!=null?hospitalItemA['lng']:29.32565233);
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
        

          CameraPosition initialLocation = CameraPosition(
              zoom: CAMERA_ZOOM,
              bearing: CAMERA_BEARING,
              tilt: CAMERA_TILT,
              target: DEST_LOCATION);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pinkAccent,
              title: Text(
                hospitalItemA!=null?hospitalItemA["medical_org"]["name"] : "hold on",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // fontFamily: Utils.ubuntuRegularFont
                ),
              ),
              centerTitle: true,
            ),
            body:  hospitalItemA!=null?SafeArea(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                           hospitalItemA["medical_org"]["pic_url"] ?? "nf",
                            fit: BoxFit.fitWidth),
                        width: double.infinity,
                        height: 250,
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
            ):Column(children:<Widget>[
              SizedBox(height: 225,),
              Center(child:Text("Please Wait!",style: TextStyle(fontSize: 24,color: Colors.blueAccent),))])
          );
        });
  }

  _detailItem(BuildContext context, initialLocation) {
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
                    hospitalItemA["medical_org"]["name"] + " info" ?? "nf",
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
                          hospitalItemA["lat"].toString() +
                          "      Long: " +
                          hospitalItemA["lng"].toString()),
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
                      title: Text("Website"),
                      subtitle: Text(hospitalItemA["website"] ?? "d"),
                      leading: Icon(Icons.web),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("Phone"),
                      subtitle: Text(hospitalItemA["medical_org"]["phone"]
                              ["phone"] ??
                          "d"), //
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Text("Working Hours"),
                      subtitle: Text("From " +
                              hospitalItemA["medical_org"]["from"] +
                              " To " +
                              hospitalItemA["medical_org"]["to"] +
                              "\nEveryday Except Friday" ??
                          "fe"),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Address"),
                      subtitle: Text(
                        hospitalItemA["medical_org"]["street"]["name"] +
                                ", " +
                                hospitalItemA["medical_org"]["street"]["area"]
                                    ["name"] +
                                ", " +
                                hospitalItemA["medical_org"]["street"]["area"]
                                    ["city"]["name"] ??
                            'tony',
                      ),
                    ),
                    new SizedBox(
                      width: 300.0,
                      height: 40.0,
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
  _handlecheckv() async {
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    String response = await Apis.checkvtest(data);
    setState(() {
       checkresponse=response;
    });
  }
}
