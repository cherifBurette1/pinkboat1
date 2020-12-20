import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Containers/signin.dart';
import '../Widgets/sharedpref.dart';
  dynamic _downloadURL;
  String _url;
  String rep;
class Uploader extends StatefulWidget {
  final File file;
  Uploader({Key key,this.file}): super(key:key);
 createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage=
  FirebaseStorage(storageBucket: 'gs://pinkboat-932f9.appspot.com/');
  StorageUploadTask _uploadTask;
String filepath;
  
  void _startUpload() async {
filepath = 'profile_pic/${DateTime.now()}.jpg';
 setState( () {
  
      _uploadTask=  _storage.ref().child(filepath).putFile(widget.file);
      sleep(Duration(milliseconds: 5000));
    });
   
    downloadImage();
    
    }
    Future downloadImage() async{
      _downloadURL= await _storage.ref().child(filepath).getDownloadURL() ;
        sleep(Duration(milliseconds: 5000));
      setState(() {
      _url=_downloadURL.toString();  
      });
      if(_url!=null){
handleprofileupload();
      }
    }
    
     handleprofileupload() async {
    var data = {
      "token": Apis.mytoken ,
      "citizen_id": Apis.id ,
      "picUrl": _url
    };
    var response = await Apis.uploadpropic(data);
    
    rep=response["message"];
    if(rep=="Profile Picture Updated"){
       Fluttertoast.showToast(msg:"Profile picture updated successfully");
       Apis.pic=_url;
setpic(_url);
    }
  }
  
    
    @override
    Widget build(BuildContext context) {
      if(_uploadTask !=null){
        return StreamBuilder<StorageTaskEvent>(stream:_uploadTask.events, 
        builder: (context,snapshot){
          var event=snapshot?.data?.snapshot;
          double progresspercent= event!=null
          ? event.bytesTransferred/event.totalByteCount
          :0;

            
          return Column(
            children:<Widget>[
           /*    if(_uploadTask.isComplete)
               Text("Image was Uploaded successfully"),
    
              
              

              
              FlatButton(onPressed: _uploadTask.resume, child: Icon(Icons.play_arrow)),
                if(_uploadTask.isInProgress)
              FlatButton(onPressed: _uploadTask.resume, child: Icon(Icons.pause)),
              LinearProgressIndicator(value: progresspercent),
              Text('${(progresspercent*100).toStringAsFixed(2)} %'),
             
              */
              SizedBox(height: 5,),
              prog(),
            ],
          );
        }
       
        );
         
    }else{
        return FlatButton.icon(onPressed: _startUpload, label: Text('Upload Image',style: TextStyle(color: Colors.white),),icon:Icon(Icons.cloud_upload,color: Colors.white,),color: Colors.pinkAccent);
     

      }
    }
prog(){
  Fluttertoast.showToast(msg:"Hold on! the picture is still uploading");
    return Text(" ");
  }
  

  
}
  
  
 
