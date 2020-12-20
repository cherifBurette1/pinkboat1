
import 'dart:io';
import 'dart:async';
import'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart'as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:network_image_to_byte/network_image_to_byte.dart';
import 'dart:typed_data';
   BuildContext dialogContext; 
String scrday;
String scrmonth;
String scryear;
String issday;
String issmonth;
String issyear;
int counter=0;
var byteimagea;
var byteimageb;
var byteimagec;
var byteimaged;
pw.Document newpff;
class ReportDetails extends StatefulWidget {
  @override
  _ReportDetailsState createState() => _ReportDetailsState();
}


class _ReportDetailsState extends State<ReportDetails> {
  dynamic screeningresultdetails;
  @override
  
  Widget build(BuildContext context) {
     dynamic sresultInstance = ModalRoute.of(context).settings.arguments;
    screeningresultdetails= sresultInstance;
return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'Report details',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
          centerTitle: true,
           leading: FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(  
            Icons.arrow_back,
            color: Colors.white
          ), ),
        ),
        body:ListView(
                      scrollDirection: Axis.vertical,
        children: <Widget>[
    
                      _reportview1(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _networkImageToByte();
          await _pdf();
          setState(() {
            newpff=_pdf();
          });
          await savePdfFile(newpff);
          
        },child: Column(
          children: <Widget>[
            SizedBox(height: 4,),
            Icon(Icons.save),
            Text("Save"),
          ],
        ), 
        ),
    );
  }








  _reportview1(){
    DateTime screeningdaterep=DateTime.parse(screeningresultdetails["screeningReservation"]["dateTime"]);
    DateTime screeningdaterep1=DateTime.parse(screeningresultdetails["dateTime"]);
    setState(() {
       scrday=screeningdaterep.day.toString();
 scrmonth=screeningdaterep.month.toString();
 scryear=screeningdaterep.year.toString();
 issday=screeningdaterep1.day.toString();
 issmonth=screeningdaterep1.month.toString();
 issyear=screeningdaterep1.year.toString();
    });
    return Container(
      
      child: Column(
      children:<Widget>[  
           Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:<Widget>[
   
               Container(
    height: 70,
          width: 70,
              decoration: BoxDecoration(
    
                  image: DecorationImage(
    
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fhealthaa.png?alt=media&token=45fc7152-807e-413e-b5ff-8298f3b51ddf"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(70),
                  
                  ),
               ),
               SizedBox(width:130),
          Container(
    height: 70,
          width: 70,
              decoration: BoxDecoration(
    
                  image: DecorationImage(
    
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fmscma.png?alt=media&token=925e2b52-24d4-41c5-b6a4-d92870d5fdb0"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(70),
             
                  ),
               ),
      ]),
    
        Row(mainAxisAlignment:MainAxisAlignment.center,children:<Widget>[
   
               Container(
    height: 40,
          width: 40,
              decoration: BoxDecoration(
    
                  image: DecorationImage(
    
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fsmall-logo2.png?alt=media&token=9dd7d75e-fc1a-465f-af1d-9566c9cbc657"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20),
                  
                  ),
               ),
               SizedBox(width:10),
          Container(
    height: 40,
          width: 40,
              decoration: BoxDecoration(
    
                  image: DecorationImage(
    
                      image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fsmall-logo1.png?alt=media&token=989d16e3-13ae-4b61-912a-ef78bbbff034"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20),
             
                  ),
               ),
      ]),
        SizedBox(height: 5,),
      Row(children: <Widget>[
    Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Text(
                'Patient name:', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 12
                ),
              ),
               Text(
                'Age: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 12
                ),
               ),
               Text(
                'Screening date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 12
                ),
              ),
               Text(
                'Result Issue date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 12
                ),
              ),
                  Text(
                'National ID: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 12
                ),
              ),

              ],
            ),
                ),
                  Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              
               Text(
                screeningresultdetails["citizen_id"]["first_name"]+" "+screeningresultdetails["citizen_id"]["middle_name"]+" "+screeningresultdetails["citizen_id"]["last_name"], textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 12)
              ),
               Text(
                 screeningresultdetails["citizen_id"]["age"].toString()+"Y", textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
               Text(
                screeningdaterep1.day.toString()+"/"+screeningdaterep1.month.toString()
                +"/"+screeningdaterep1.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
               Text(
                 screeningdaterep.day.toString()+"/"+screeningdaterep.month.toString()
                +"/"+screeningdaterep.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
               Text(
                screeningresultdetails["citizen_id"]["national_id"], textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 12),
              ),
              ],
            ),
                ),
      ],),
      Divider(thickness: 1.0,
                        color: Colors.black38,
                      ),
    Row(mainAxisAlignment: MainAxisAlignment.center
    ,children: <Widget>[
  Text("Test Unit",style: TextStyle(fontSize:17,),),
    ],),
    SizedBox(height:20),
    Row(children: <Widget>[
Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Text(
                'Diagnosis:', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 15
                ),
              ),
               Text(
                'degree: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 15
                ),
               ),
               
              ],
            ),
                ),
                  Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              
               Text(
                _findresult(screeningresultdetails["result"]), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 15)
              ),
               Text(
                screeningresultdetails["degree"], textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 15),
              ),
              
              ],
            ),
                ),
    ],),
    SizedBox(height:15,),
       Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text ("   Comment",style: TextStyle(color: Colors.black,fontSize: 15)),
          new Text ("   "+screeningresultdetails["description"],style: TextStyle(color: Colors.grey,fontSize: 15,),),
        ],
      ),
      SizedBox(height:145,),
       Row(mainAxisAlignment: MainAxisAlignment.start,children:<Widget>[ Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text ("   Test Center Name:      ",style: TextStyle(color: Colors.black,fontSize: 14)),
          new Text ("   "+screeningresultdetails[ "testCenter_code"]["medical_org"]["name"]+"      ",style: TextStyle(color: Colors.grey,fontSize: 14,),),
        ],
      ),
        ]),
          Row(mainAxisAlignment: MainAxisAlignment.start,children:<Widget>[ Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text ("   Doctor Name:",style: TextStyle(color: Colors.black,fontSize: 14)),
          new Text ("   Dr. "+screeningresultdetails["doctor_id"]["citizen"]["first_name"]+" "+screeningresultdetails["doctor_id"]["citizen"]["middle_name"]+" "+screeningresultdetails["doctor_id"]["citizen"]["last_name"]??"doctor not found",style: TextStyle(color: Colors.grey,fontSize: 14,),),
        ],
      ),
        ]),
 /*         Row(mainAxisAlignment: MainAxisAlignment.start,children:<Widget>[ Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text ("   Signature:",style: TextStyle(color: Colors.black,fontSize: 14)),
         
        ],
      ),
        ]),
         Row(mainAxisAlignment: MainAxisAlignment.start,children:<Widget>[ Column (
           mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
         new Text ('   [                                       ]',style: TextStyle(color: Colors.grey,fontSize: 14,),),
     ],
      ),
        ]),*/
           
     
      ],),
    );
  }
_pdf(){ 

  final pdf=pw.Document();
 /* PdfImage imagea= PdfImage(pdf.document, image:image1, width: 90, height: 90);
   PdfImage imageb= PdfImage(pdf.document, image:image2, width: 90, height: 90);
   PdfImage imagec= PdfImage(pdf.document, image:image3, width: 90, height: 90);
 PdfImage imaged= PdfImage(pdf.document, image:image4, width: 90, height: 90);*/
 final image1 = PdfImage.file(
  pdf.document,
  bytes:byteimagea

 );
  final image2 = PdfImage.file(
  pdf.document,
  bytes:byteimageb
 );
  final image3 = PdfImage.file(
  pdf.document,
  bytes:byteimagec

 );
  final image4 = PdfImage.file(
  pdf.document,
  bytes:byteimaged
 );
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context){
return <pw.Widget>  [

   pw.Container(child: pw.Column(children: <pw.Widget>[
    
     pw.Row(mainAxisAlignment:pw.MainAxisAlignment.spaceEvenly ,children:<pw.Widget>[
  pw.Container(child: pw.Image(image1,height:70,width:70),),
       pw.SizedBox(width: 130),
  pw.Container(child: pw.Image(image2,height:70,width:70),),
       ]),
                                    pw.Row(mainAxisAlignment:pw.MainAxisAlignment.center ,children:<pw.Widget>[
  pw.Container(child: pw.Image(image3,height:20,width:20),),
       pw.SizedBox(width: 10),
  pw.Container(child: pw.Image(image4,height:20,width:20),),
       ]),
     pw.Row(children: <pw.Widget>[
  
    pw.Expanded(flex:1,child: 
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: <pw.Widget>[
              pw.Text(
                'Patient name:', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 12
                ),
              ),
               pw.Text(
                'Age: ', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 12
                ),
               ),
               pw.Text(
                'Screening date: ', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 12
                ),
              ),
               pw.Text(
                'Result Issue date: ', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 12
                ),
              ),
                  pw.Text(
                'National ID: ', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 12
                ),
              ),

              ],
            ),
                ),
                 pw.Expanded(flex:1,child: 
           pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: <pw.Widget>[
              
               pw.Text(
                 screeningresultdetails["citizen_id"]["first_name"]+" "+screeningresultdetails["citizen_id"]["middle_name"]+" "+screeningresultdetails["citizen_id"]["last_name"], textAlign:pw.TextAlign.right, style: pw.TextStyle(color:PdfColors.grey,fontSize: 12)
              ),
               pw.Text(
                  screeningresultdetails["citizen_id"]["age"].toString()+"Y", textAlign:pw.TextAlign.right, style: pw.TextStyle(color: PdfColors.grey,fontSize: 12),
              ),
               pw.Text(
                scrday+"/"+scrmonth+"/"+scryear, textAlign:pw.TextAlign.right, style: pw.TextStyle(color: PdfColors.grey,fontSize: 12),
              ),
               pw.Text(
                issday+"/"+issmonth+"/"+issyear, textAlign:pw.TextAlign.right, style: pw.TextStyle(color: PdfColors.grey,fontSize: 12),
              ),
               pw.Text(
                screeningresultdetails["citizen_id"]["national_id"], textAlign:pw.TextAlign.right, style: pw.TextStyle(color: PdfColors.grey,fontSize: 12),
              ),
              ],
            ),
                ),
      ],),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center
    ,children: <pw.Widget>[
  pw.Text("________________________________________________",style: pw.TextStyle(fontSize:17,),),
    ],),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center
    ,children: <pw.Widget>[
  pw.Text("Test Unit",style: pw.TextStyle(fontSize:17,),),
    ],),
    ])),
  pw.SizedBox(height:20),
    pw.Row(children: <pw.Widget>[
pw.Expanded(flex:1,child: 
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: <pw.Widget>[
               pw.Text(
                'Diagnosis:', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 15
                ),
              ),
               pw.Text(
                'degree: ', textAlign:pw.TextAlign.left,style:pw.TextStyle(
                  fontSize: 15
                ),
               ),
               
              ],
            ),
                ),
                  pw.Expanded(flex:1,child: 
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: <pw.Widget>[
              
               pw.Text(
                _findresult(screeningresultdetails["result"]), textAlign:pw.TextAlign.right, style:pw.TextStyle(color: PdfColors.grey,fontSize: 15)
              ),
               pw.Text(
                screeningresultdetails["degree"], textAlign:pw.TextAlign.right, style: pw.TextStyle(color: PdfColors.grey,fontSize: 15),
              ),
              
              ],
            ),
                ),
    ],),
     pw.SizedBox(height:50,),
       pw.Row (
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: <pw.Widget>[
          pw.Text ("Comment",style: pw.TextStyle(color: PdfColors.black,fontSize: 15)),
          
        ],
      ),
      pw.Row (
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: <pw.Widget>[
          pw.Text (screeningresultdetails["description"],style: pw.TextStyle(color: PdfColors.grey,fontSize: 15,),),
        ],
      ),
      pw.SizedBox(height:200,),
       pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start,children:<pw.Widget>[ pw.Column (
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: <pw.Widget>[
          pw.Text ("   Test Center Name:      ",style: pw.TextStyle(color: PdfColors.black,fontSize: 14)),
          pw.Text (screeningresultdetails[ "testCenter_code"]["medical_org"]["name"]+"      ",style: pw.TextStyle(color: PdfColors.grey,fontSize: 14,),),
        ],
      ),
        ]),
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start,children:<pw.Widget>[ pw.Column (
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: <pw.Widget>[
          pw.Text ("   Doctor Name:",style: pw.TextStyle(color: PdfColors.black,fontSize: 14)),
          pw.Text ("   "+"Dr. "+screeningresultdetails["doctor_id"]["citizen"]["first_name"]+" "+screeningresultdetails["doctor_id"]["citizen"]["middle_name"]+" "+screeningresultdetails["doctor_id"]["citizen"]["last_name"]??"doctor not found",style: pw.TextStyle(color: PdfColors.grey,fontSize: 14,),),
        ],
      ),
        ]),
           pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start,children:<pw.Widget>[ pw.Column (
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: <pw.Widget>[
          pw.Text ("              Signature:",style: pw.TextStyle(color: PdfColors.black,fontSize: 14)),
        ],
      ),
        ]),
      pw.SizedBox(height: 4),
           pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start,children:<pw.Widget>[ pw.Column (
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: <pw.Widget>[
          pw.Text ('   [                                       ]',style: pw.TextStyle(color: PdfColors.grey,fontSize: 14,),),
        ],
      ),
        ]),
  /*            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center
    ,children: <pw.Widget>[
  pw.Text("________________________________________________",style: pw.TextStyle(fontSize:17,),),
    ],),
    pw.Row(mainAxisAlignment:pw.MainAxisAlignment.center,children: <pw.Widget>[
                        pw.Text("Powered By"),
                      ],),*/
 
];
      }
    ),
   /* PdfImage header1 = await pdfImageFromImage(
  image: NetworkImage(""),*/
  );
 return pdf;
}
savePdfFile(pw.Document newpff)async{
  
  final dir = await getExternalStorageDirectory();     
  print("Directoryyyyyyyyy:${dir.path}"); 
      
  final String path = "${dir.path}/flutter$counter.pdf"; 
  counter++;    
  final file = File(path);     
  await file.writeAsBytes(newpff.save());
  
  showAlertDialog(context,path);
  
    }
  Future<Uint8List> _networkImageToByte() async {
  Uint8List byteImage1 = await networkImageToByte("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fhealth-small.png?alt=media&token=f89ad908-f921-44b5-af72-61a8fac691af");
  Uint8List byteImage2 = await networkImageToByte("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fmscmasmall.png?alt=media&token=6234b501-3dc7-48c4-a1e3-34d1a81e21c7");
  Uint8List byteImage3 = await networkImageToByte("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fsmall-logo2.png?alt=media&token=9dd7d75e-fc1a-465f-af1d-9566c9cbc657");
  Uint8List byteImage4 = await networkImageToByte("https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/logos%2Fsmall-logo1.png?alt=media&token=989d16e3-13ae-4b61-912a-ef78bbbff034");
  setState(() {
    byteimagea=byteImage1;
     byteimageb=byteImage2;
      byteimagec=byteImage3;
       byteimaged=byteImage4;
  });

}
  showAlertDialog(BuildContext context,String path) {

  Widget continueButton = FlatButton(
    child: Text("Ok",style: TextStyle(color: Colors.pink[400],fontSize: 15,),),
    onPressed:  ()=>  Navigator.pop(dialogContext),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Saved file",style: TextStyle(color: Colors.pink[400]),),
    content: Text("your reservation has been saved in "+path),
    actions: [
    
      continueButton,
      
      
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
       dialogContext = context;
      return alert;
    },
  );
}
_findresult(bool result){
  if (result==true){
    return "Positive";
  }else{
    return"negative";
  }

}
}