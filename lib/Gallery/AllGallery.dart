// import 'package:flutter/material.dart';
// import 'package:flutterapp/home.dart';
// import 'dart:async';
// import 'Photos.dart';
// import 'package:flutterapp/Gallery/url_lauuncher.dart';


// var bannerItems = [
//   "Diagnosis and stages",
//   "Self Examination",
//   "Exercises",
//   "Awareness",
//   "About us"
// ];
// var textz = [
//   "check out the stages of breast cancer",
//   "here is a video that shows you how to perform the self examination",
//   "here is a video that shows you some exercises that you should perform while fighting breast cancer",
//   "Is breast cancer a hereditary disease?",
//   "here is a video that explains who are we"
// ];
// var bannerImage = [
//   "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fdiagnosis.jpg?alt=media&token=2c6fae3f-a479-46a0-9a84-f692f2f76c6c",
//   "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fself%20examination.jpg?alt=media&token=b264c404-bfb4-4e20-85c0-948c22e29cc1",
//   "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fexcercises.jpeg?alt=media&token=a976c407-7ed9-4e13-b243-ddb0e54eeb60",
//   "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fawarness.jpg?alt=media&token=ed92d93b-d845-45c5-9574-83ba9f07c580",
//   "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fabout%20us.jpg?alt=media&token=ef41d14b-0e8f-4dab-ac89-97253342aa08"
// ];
// var link = [
//   "https://www.cancer.net/cancer-types/breast-cancer/stages",
//   "https://youtu.be/biTZmXL0Nu8",
//   "https://www.youtube.com/watch?v=s7z0umtrC7k",
//   "https://ghr.nlm.nih.gov/condition/breast-cancer",
//   "https://www.youtube.com/watch?v=4euLdWN0n58"
// ];

// class AllGallery extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         child: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//             //               Text(
//             //   'Photos',
//             //   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,),
//             // ),
//               BannerWidgetArea(),

//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   child: new FittedBox(
//                     child: Material(
//                         color: Colors.white,
//                         elevation: 14.0,
//                         borderRadius: BorderRadius.circular(24.0),
//                         shadowColor: Color(0x802196F3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: new BorderRadius.circular(24.0),
//                                 child: Image(
//                                   fit: BoxFit.contain,
//                                   alignment: Alignment.topLeft,
//                                   image: NetworkImage(
//                                       'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2Fphotos.png?alt=media&token=b8e87708-a82d-41b5-a7a8-b5e467fca1e4'),
//                                 ),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.all(18)),
//                             Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 80),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: Container(
//                                           child: Text(
//                                         "Photo",
//                                         style: TextStyle(
//                                             color: Colors.pink[400],
//                                             fontSize: 30.0,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 60),
//                                       child: Container(
//                                           child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: <Widget>[],
//                                       )),
//                                     ),
//                                     Container(
//                                         child: Text(
//                                       "afsda affftwqy kokosfkojf",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     Container(
//                                         child: Text(
//                                       "adfaf l,klkl nbvsf aefv",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     RaisedButton(
//                                       child: Text('See All',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                                       onPressed: () {
//                                         Navigator.push(context,MaterialPageRoute(builder: (context) => Photo()),);
//                                       },
//                                       color: Colors.pink[300],
//                                       textColor: Colors.black,
//                                       padding:
//                                           EdgeInsets.fromLTRB(15, 8, 15, 15),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   child: new FittedBox(
//                     child: Material(
//                         color: Colors.white,
//                         elevation: 14.0,
//                         borderRadius: BorderRadius.circular(24.0),
//                         shadowColor: Color(0x802196F3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: new BorderRadius.circular(24.0),
//                                 child: Image(
//                                   fit: BoxFit.contain,
//                                   alignment: Alignment.topLeft,
//                                   image: NetworkImage(
//                                       'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2FVIDEOS.png?alt=media&token=e5e9bd35-0e23-441e-b2a2-dbbcb50f731a'),
//                                 ),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.all(18)),
//                             Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 80),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: Container(
//                                           child: Text(
//                                         "Videos",
//                                         style: TextStyle(
//                                             color: Colors.pink[400],
//                                             fontSize: 30.0,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 60),
//                                       child: Container(
//                                           child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: <Widget>[],
//                                       )),
//                                     ),
//                                     Container(
//                                         child: Text(
//                                       "afsda affftwqy kokosfkojf",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     Container(
//                                         child: Text(
//                                       "adfaf l,klkl nbvsf aefv",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     RaisedButton(
//                                       child: Text('See All'),
//                                       onPressed: () {
//                                         // Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
//                                       },
//                                       color: Colors.pink[300],
//                                       textColor: Colors.black,
//                                       padding:
//                                           EdgeInsets.fromLTRB(15, 8, 15, 15),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   child: new FittedBox(
//                     child: Material(
//                         color: Colors.white,
//                         elevation: 14.0,
//                         borderRadius: BorderRadius.circular(24.0),
//                         shadowColor: Color(0x802196F3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: new BorderRadius.circular(24.0),
//                                 child: Image(
//                                   fit: BoxFit.contain,
//                                   alignment: Alignment.topLeft,
//                                   image: NetworkImage(
//                                       'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2F6c05ea8b482b483df0fbe0371b82467e_1000-free-book-clipart-images-you-can-download-right-now_300-300.png?alt=media&token=e1ff373d-b773-46ce-9039-18c6998a51ff'),
//                                 ),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.all(18)),
//                             Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 80),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: Container(
//                                           child: Text(
//                                         "Books",
//                                         style: TextStyle(
//                                             color: Colors.pink[400],
//                                             fontSize: 30.0,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 60),
//                                       child: Container(
//                                           child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: <Widget>[],
//                                       )),
//                                     ),
//                                     Container(
//                                         child: Text(
//                                       "afsda affftwqy kokosfkojf",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     Container(
//                                         child: Text(
//                                       "adfaf l,klkl nbvsf aefv",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     RaisedButton(
//                                       child: Text('See All'),
//                                       onPressed: () {
//                                         // Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
//                                       },
//                                       color: Colors.pink[300],
//                                       textColor: Colors.black,
//                                       padding:
//                                           EdgeInsets.fromLTRB(15, 8, 15, 15),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   child: new FittedBox(
//                     child: Material(
//                         color: Colors.white,
//                         elevation: 14.0,
//                         borderRadius: BorderRadius.circular(24.0),
//                         shadowColor: Color(0x802196F3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: new BorderRadius.circular(24.0),
//                                 child: Image(
//                                   fit: BoxFit.contain,
//                                   alignment: Alignment.topLeft,
//                                   image: NetworkImage(
//                                       'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2FARTICLES.png?alt=media&token=f16463d8-f8b0-412a-9c5e-daa4cfbac28c'),
//                                 ),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.all(18)),
//                             Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 80),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: Container(
//                                           child: Text(
//                                         "Articles",
//                                         style: TextStyle(
//                                             color: Colors.pink[400],
//                                             fontSize: 30.0,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 60),
//                                       child: Container(
//                                           child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: <Widget>[],
//                                       )),
//                                     ),
//                                     Container(
//                                         child: Text(
//                                       "afsda affftwqy kokosfkojf",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     Container(
//                                         child: Text(
//                                       "adfaf l,klkl nbvsf aefv",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     RaisedButton(
//                                       child: Text('See All'),
//                                       onPressed: () {
//                                         // Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
//                                       },
//                                       color: Colors.pink[300],
//                                       textColor: Colors.black,
//                                       padding:
//                                           EdgeInsets.fromLTRB(15, 8, 15, 15),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Container(
//                   child: new FittedBox(
//                     child: Material(
//                         color: Colors.white,
//                         elevation: 14.0,
//                         borderRadius: BorderRadius.circular(24.0),
//                         shadowColor: Color(0x802196F3),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               height: 150,
//                               child: ClipRRect(
//                                 borderRadius: new BorderRadius.circular(24.0),
//                                 child: Image(
//                                   fit: BoxFit.contain,
//                                   alignment: Alignment.topLeft,
//                                   image: NetworkImage(
//                                       'https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Ficons%2FMOVIES.png?alt=media&token=2005d22d-155f-4e88-a5dd-7e2ca6b45a4b'),
//                                 ),
//                               ),
//                             ),
//                             Padding(padding: EdgeInsets.all(18)),
//                             Container(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 80),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                           const EdgeInsets.only(right: 8.0),
//                                       child: Container(
//                                           child: Text(
//                                         "Movies",
//                                         style: TextStyle(
//                                             color: Colors.pink[400],
//                                             fontSize: 30.0,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 60),
//                                       child: Container(
//                                           child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: <Widget>[],
//                                       )),
//                                     ),
//                                     Container(
//                                         child: Text(
//                                       "afsda affftwqy kokosfkojf",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     Container(
//                                         child: Text(
//                                       "adfaf l,klkl nbvsf aefv",
//                                       style: TextStyle(
//                                           color: Colors.black54,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     )),
//                                     RaisedButton(
//                                       child: Text('See All'),
//                                       onPressed: () {
//                                         // Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);
//                                       },
//                                       color: Colors.pink[300],
//                                       textColor: Colors.black,
//                                       padding:
//                                           EdgeInsets.fromLTRB(15, 8, 15, 15),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //     onPressed: () {},
//       //     backgroundColor: Colors.black,
//       //     child: Icon(
//       //       MdiIcons.food,
//       //       color: Colors.white,
//       //     )),
//     );
//   }
// }

// class BannerWidgetArea extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;

//     PageController controller =
//         PageController(viewportFraction: 0.8, initialPage: 1);

//     List<Widget> banners = new List<Widget>();

//     for (int x = 0; x < bannerItems.length; x++) {
//       var bannerView = Padding(
//         padding: EdgeInsets.all(10.0),
//         child: GestureDetector(
//           onTap: () {
//             launch(link[x]);
//           },
//           child: Container(
//             child: Stack(
//               fit: StackFit.expand,
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black38,
//                             offset: Offset(2.0, 2.0),
//                             blurRadius: 5.0,
//                             spreadRadius: 1.0)
//                       ]),
//                 ),
//                 ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     child: Image.network(
//                       bannerImage[x],
//                       fit: BoxFit.cover,
//                     )),
//                 Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [Colors.transparent, Colors.black])),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         bannerItems[x],
//                         style: TextStyle(fontSize: 25.0, color: Colors.white),
//                       ),
//                       Text(
//                         textz[x],
//                         style: TextStyle(fontSize: 12.0, color: Colors.white),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//       banners.add(bannerView);
//     }

//     return Container(
//       width: screenWidth,
//       height: screenWidth * 9 / 16,
//       child: PageView(
//         controller: controller,
//         scrollDirection: Axis.horizontal,
//         children: banners,
//       ),
//     );
//   }
// }
