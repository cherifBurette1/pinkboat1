import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    
      return Scaffold(
        body: Center(
          child: AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader2,
            color: Colors.blue,
            
          ),
          
        ),
        
      );
    
  }
}