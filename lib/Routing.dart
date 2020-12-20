import 'package:flutter/material.dart';

import 'package:flutterapp/home.dart';
import 'package:flutterapp/Containers/signUp/signup.dart';
import 'package:flutterapp/Containers/signin.dart';
import 'package:flutterapp/Gallery/reports.dart';
import 'main.dart';
import 'package:flutterapp/Reservation/ScreeningResult.dart';
import 'Widgets/fingerscreen.dart';

mainrr(BuildContext context) {
  if (nnnn == true) {
    if (fingerchk == true) {
      return FingerScreen();
    } else {
      return Home();
    }
  } else {
    return SignIn();
  }
}
//     Map<String, Widget Function(BuildContext)> createRoutes (BuildContext context) {
//   return {
//     "/": (context) =>mainrr(),
//     //"/signin": (context) => SignIn(),
//     "/signup": (context) => SignUp(),
//     "/sigin": (context) => SignIn(),
//     "/home": (context) => Home(),

//     // "/RtrivePassword": (context) => RetrivePassword(),
//     "/Reports": (context) => Reports(),
//     "/ScreeningResult": (context) => ScreeningResult(),

//     //"/signUp/validation": (context) => Temp(),
//   };
// }
