
import 'package:flutter/material.dart';

//import 'package:pdf/widgets.dart' as prefix0;
import 'report_details.dart';
import '../common/apis.dart';
import 'report_details copy.dart';
import 'package:fluttertoast/fluttertoast.dart';
int counter=0;
class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}


class _ReportsState extends State<Reports> {
  List<dynamic> originalReports;
  List<dynamic> resultreports;
    List<dynamic> originalReports1;
  List<dynamic> resultreports1;
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var data = {
        "token":Apis.mytoken,
        "citizen_id" : Apis.id};
     
      dynamic response = await Apis.getscreenresult(data);
   if(Apis.screenresult!="success"){
    Fluttertoast.showToast(msg: Apis.screenresult);
   }
      this.originalReports = response;
      setState(() {
        this.resultreports = response;
      
      });
      
       dynamic response1 = await Apis.getsampleresult(data);
         if(Apis.sampleresult!="success"){
    Fluttertoast.showToast(msg: Apis.sampleresult);
   }
    
      this.originalReports1 = response1;
      setState(() {
        this.resultreports1 = response1;
      });
   
    });
  }
     
    
  

  Widget build(BuildContext context) {
return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'Test Results and Reports',
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
           Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                             resultreports!=null?
          Column(children:<Widget>[ 
        ...resultreports.map<Widget>((item) {
          return _screeningreportcard(
            item,
          );
        }).toList(),
          ]): Center(child: Text(" ",style: TextStyle(fontSize: 5,),),),
         resultreports1 != null   
                      ? Column(children: <Widget>[
                  ...resultreports1.map<Widget>((item) {
                    return _samplereportcard(
                      item,
                      // item["medical_org"]["pic_url"],
                      // item["medical_org"]["name"],
                      // item["medical_org"]["address"],
                    );
                  }).toList(),
                ])
              : Column(children: <Widget>[
                  SizedBox(
                    height: 250,
                  ),
                  Text(
                    " ",
                    style: TextStyle(fontSize: 5),
                  ),
                 
                ]),
        ]),
     
    );
  }



_screeningreportcard(dynamic screeningreportItem){
 DateTime issuedate=DateTime.parse(screeningreportItem["dateTime"]);
 DateTime screeningdate=DateTime.parse(screeningreportItem["screeningReservation"]["dateTime"]);
  return Card(
child: new InkWell(
      onTap: (){
      Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ReportDetails(),
                settings: RouteSettings(
                  arguments: screeningreportItem,
                )));
      },
      
              child:Column(children: <Widget>[
                
                Center(child:Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
                  Text(
                screeningreportItem["testCenter_code"]["medical_org"]["name"]+" Report"
              ,style: TextStyle(color: Color(0xFF00B6F0),fontSize: 18),), 
              SizedBox(height:8),
                ],),
                ),
                Row(
                  children: <Widget>[ 
             

                Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Text(
                'Result issue date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
               Text(
                'Screening date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
               Text(
                'Result: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                'Type: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
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
                issuedate.day.toString()+"-"+issuedate.month.toString()+"-"+issuedate.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
                Text(
                 screeningdate.day.toString()+"-"+screeningdate.month.toString()+"-"+screeningdate.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18)
              ),
               Text(
                _findresult(screeningreportItem["result"]), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
               Text(
                "Screening result", textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
              ],
            ),
                ),
              ],
              ),
         
           SizedBox(
                        height: 8,
                      ),
          
            ],
                ),
                
                    ),
          
            );
            
}
_samplereportcard(dynamic screeningreportItem){
 DateTime issuedate=DateTime.parse(screeningreportItem["dateTime"]);
 DateTime screeningdate=DateTime.parse(screeningreportItem["screeningReservation"]["dateTime"]);
  return Card(
child: new InkWell(
      onTap: (){
      Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ReportDetails1(),
                settings: RouteSettings(
                  arguments: screeningreportItem,
                )));
      },
      
              child:Column(children: <Widget>[
                
                Center(child:Row(mainAxisAlignment: MainAxisAlignment.center,children:<Widget>[
                  Text(
                screeningreportItem["medicalAnalysisLab_code"]["medical_org"]["name"]+" Report"
              ,style: TextStyle(color: Color(0xFF00B6F0),fontSize: 18),), 
              SizedBox(height:8),
                ],),
                ),
                Row(
                  children: <Widget>[ 
             

                Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               Text(
                'Result issue date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
               Text(
                'Screening date: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
               Text(
                'Result: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                'Type: ', textAlign:TextAlign.left,style:TextStyle(
                  fontSize: 18
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
                issuedate.day.toString()+"-"+issuedate.month.toString()+"-"+issuedate.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
                Text(
                 screeningdate.day.toString()+"-"+screeningdate.month.toString()+"-"+screeningdate.year.toString(), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18)
              ),
               Text(
                _findresult(screeningreportItem["result"]), textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
               Text(
                "Sample result", textAlign:TextAlign.right, style: TextStyle(color: Colors.grey,fontSize: 18),
              ),
              ],
            ),
                ),
              ],
              ),
         
           SizedBox(
                        height: 8,
                      ),
          
            ],
                ),
                
                    ),
          
            );
            
}
_findresult(bool result){
  if (result==true){
    return "Positive";
  }else{
    return"negative";
  }

}
_findresult1(int result){
  if (result==0){
    return "Positive";
  }else if (result==1){
    return"negative";
  }else{
    return "un-determined";
  }

}
}