import 'dart:math';
import 'dart:math' show sqrt;
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:google_maps_utils/google_maps_utils.dart';

class GeoPoint {
  double lat, lng, diff;

  GeoPoint(lat, lng) {
    this.lat = lat;
    this.lng = lng;
  }

  @override
  String toString() {
    return "Location: ($this.lat, $this.lng)";
  }

  /*
    unit = the unit you desire for results              
      where: 'M' is statute miles (default) 
             'K' is kilometers            
             'N' is nautical miles*/
  double getDiff(GeoPoint point) {
    Point from = Point(point.lat, point.lng);
    Point to = Point(this.lat, this.lng);
    Point randomPoint = Point(-23.54545, -23.898098);

    double distance = SphericalUtils.computeDistanceBetween(from, to);
    double dist = distance / 1000;
    return dist;
    // print('Distance: $distance meters');

    //double heading = SphericalUtils.computeHeading(from, to);
    //print('Heading: $heading degrees');

    //double angle = SphericalUtils.computeAngleBetween(from, to);
    // print('Angle: $angle degrees');

    //double distanceToAB = PolyUtils.distanceToLine(randomPoint, from, to);
    //print('Distance to Line: $distanceToAB meters');

    //double distanceBetweenPoints = SphericalUtil.computeDistanceBetween(
    //    LatLng(this.lat, this.lng), LatLng(point.lat, point.lng));
    //double dist = distanceBetweenPoints / 1000;
    // return dist;
  }
}
// return diff between current point and this (hospital,testcenter,...)
// var gcd = new GreatCircleDistance.fromDegrees(
//   latitude1: point.lat,
//   longitude1: point.lng,
//   latitude2: this.lat,
//   longitude2: this.lng);

//print('Distance from location 1 to 2 using the Haversine formula is: ${gcd.haversineDistance()}');
//print('Distance from location 1 to 2 using the Spherical Law of Cosines is: ${gcd.sphericalLawOfCosinesDistance()}');
//print('Distance from location 1 to 2 using the Vicenty`s formula is: ${gcd.vincentyDistance()}');

// double dist = gcd.vincentyDistance();
//return dist;
// double theta = point.lng - this.lng;
//double dist = sin(deg2rad(this.lat)) * sin(deg2rad(point.lat)) +
//    cos(deg2rad(this.lat)) * cos(deg2rad(point.lat)) * cos(deg2rad(theta));
// dist = acos(dist);
// dist = rad2deg(dist);
// dist = dist * 60 * 1.1515; //m
// dist = dist * 1.609344;
// return dist;

//double deg2rad(double deg) {
// return (deg * 0.017453292519943295);
// }

// double rad2deg(double rad) {
//  return (rad * 0.017453292519943295);
//}

//void main() {
// double calculateDistance(lat1, lon1, lat2, lon2){
//   var p = 0.017453292519943295;
//   var c = cos;
//   var a = 0.5 - c((lat2 - lat1) * p)/2 +
//         c(lat1 * p) * c(lat2 * p) *
//         (1 - c((lon2 - lon1) * p))/2;
//   return 12742 * asin(sqrt(a));
// }

//point1 = new GeoPoint(point.lat, point.lng);
//  point2 = new GeoPoint(this.lat, this.lng);
// var dist = point1.distanceTo(point2, true);
//return dist;
