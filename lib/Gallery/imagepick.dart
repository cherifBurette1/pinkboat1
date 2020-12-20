import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'uploader.dart';
import 'package:image_picker/image_picker.dart';


class Image_Pick extends StatefulWidget {
  _image_PickState createState() => _image_PickState();

}

class _image_PickState extends State<Image_Pick> {
  File _imageFile;
  
Future<void> _pickimage(ImageSource source)async {
File selected = await ImagePicker.pickImage(source: source);
setState((){
  _imageFile=selected;
});
}
void _clear(){
  setState(() {
    _imageFile=null;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
        title: Text('Choose a way to upload image'),
         backgroundColor: Colors.pink[400],
         
      ) ,
      body: Container(
        child:  ListView(
            children:<Widget>[
              Card(
                child:
        Row(children: <Widget>[
          Container(child: FlatButton(onPressed: ()=>_pickimage(ImageSource.camera), child: Row(
            children: <Widget>[
              Icon(Icons.camera,color: Colors.pinkAccent),
              Text('Pick from camera',style: TextStyle(color: Color(0xFF00B6F0)),),
            ],
          ),),
          ),
           Container(child: FlatButton(onPressed: ()=>_pickimage(ImageSource.gallery), child: Row(
            children: <Widget>[
              Icon(Icons.photo,color: Colors.pinkAccent),
              Text('Pick from Library',style: TextStyle(color: Color(0xFF00B6F0)),),
            ],
          ),),
          ),
        ]),),
           
                if(_imageFile != null)...[
                  Image.file(_imageFile),
                  Row(
                    children: <Widget>[
                       Expanded(child: Container(child: Text("   "),),flex: 1,),
                      Expanded(child:  RaisedButton(onPressed: ()=>_clear(),color:Colors.pink[400],child:Text('clear Image',style: TextStyle(color: Colors.white)),
                     ),flex: 4, ),
                      Expanded(child: Container(child: Text("   "),),flex: 1,),]
                  ),
            Uploader(file: _imageFile)
            ]
                ]
        ),),
      
      
    );
  }
}
