import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../home.dart';

class FingerScreen extends StatelessWidget {
  final LocalAuthentication localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: GestureDetector(
        onTap: () async {
          bool weCanCheckBiometrics = await localAuth.canCheckBiometrics;

          if (weCanCheckBiometrics) {
            bool authenticated = await localAuth.authenticateWithBiometrics(
              localizedReason: "Authenticate to see your App statement.",
            );

            if (authenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 124.0,
            ),
           SizedBox(

             height: 100,
           ),
            
            Text(
              "Touch to Login",
              style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),

              textAlign: TextAlign.center,
               
              
              ),
      
              
              
            
          ],
        ),
      ),
    );
  }
}