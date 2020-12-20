import 'dart:async';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapp/MyReservation/editres.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:flutterapp/Reservation/reservation.dart';
import 'package:flutterapp/MyReservation/my_res.dart';
String checkresponse;
const double CAMERA_ZOOM = 14;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class MobileDetails extends StatefulWidget {
  _MobileDetails createState() => _MobileDetails();
}

class _MobileDetails extends State<MobileDetails> {
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

  dynamic hospitalItemC;
   
    String yes;
    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
     var data = {"token": Apis.mytoken, "medicalOrg_id": yes};
var response = await Apis.myresttestdetails(data);
setState(() {
hospitalItemC=response;
});

    });
  }
  @override
 
  Widget build(BuildContext context) {
   
  
   String hospitalInstance = ModalRoute.of(context).settings.arguments;
    setState(() {
      yes =hospitalInstance;
    });
    
 double a4;
    double b4;if(hospitalItemC!=null){
       if (hospitalItemC[0]["nearestSchedule"] != false) {
      a4 = hospitalItemC[0]["nearestSchedule"]["lat"] ;
      b4 = hospitalItemC[0]["nearestSchedule"]["lng"] ;
       }
    } else {
      a4 = 30.23265556;
      b4= 29.32565233;

  }
    
    
    DEST_LOCATION = LatLng(a4, b4);
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
               hospitalItemC!=null? hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["name"]: 'hold on',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: hospitalItemC!=null?SafeArea(
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                            hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["pic_url"] ??
                                'null bygib null kda',
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

     double a;
    double b;
    String c;
    String x;

    String d;
    String e;
    String f;

    if (hospitalItemC[0]["nearestSchedule"] != null || false) {
      a = hospitalItemC[0]["nearestSchedule"]["lat"] ?? 'lolololololo';
      b = hospitalItemC[0]["nearestSchedule"]["lng"] ?? 'lolololololo';
      c = hospitalItemC[0]["nearestSchedule"]["from"] ?? 'lolololololo';
      x = hospitalItemC[0]["nearestSchedule"]["to"] ?? 'lolololololo';

      d = hospitalItemC[0]["nearestSchedule"]["street_id"]["name"] ??
          'lolololololo';
      e = hospitalItemC[0]["nearestSchedule"]["street_id"]["area"]["name"] ??
          'lolololololo';
      f = hospitalItemC[0]["nearestSchedule"]["street_id"]["area"]["city"]
              ["name"] ??
          'lolololololo';
    } else {
      a = 30.23265556;
      b = 29.32565233;
      c = ",no from available";
      x = ",no to available";

      d = ", no  street name available  ";
      e = ", no area available";
      f = ", no city available";
       
    }
    var newdate = DateTime.parse(c);
    var newdate2 = DateTime.parse(x);


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
                    hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["name"] ??"ffs"+ " info",
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
                          a.toString() +
                          "      Long: " +
                         b.toString()),
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
                      leading: Icon(Icons.phone),
                      title: Text("Phone"),
                      subtitle: Text(hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["phone"]["phone"]??"fdd"), //
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Text("Campaign days"),
                      subtitle: Text("From " +
                          newdate.year.toString() +
                          "-" +
                          newdate.month.toString() +
                          "-" +
                          newdate.day.toString() +
                          " To " +
                          newdate2.year.toString() +
                          "-" +
                          newdate2.month.toString() +
                          "-" +
                          newdate2.day.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.watch_later),
                      title: Text("Working Hours"),
                      subtitle: Text("From " +
                          hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["from"]??"1" +
                          " To " +
                          hospitalItemC[0]["mobileCenter"]["test_center"]["medical_org"]["to"]??"2" +
                          "\nEveryday Except Friday"),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Address"),
                      subtitle: Text(
                        d +
                                ", " +
                              e+
                                ", " +
                               f  ,
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
