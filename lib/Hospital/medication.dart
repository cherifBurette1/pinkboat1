import 'package:flutter/material.dart';
import 'package:flutterapp/common/apis.dart';

 String _treatid;
class Medication extends StatefulWidget {
  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
    List<dynamic> medication = [];
  List<dynamic> originalMedication = [];
@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
        var data = {
    "treatmentPlan_id" : _treatid
    };
     dynamic response = await Apis.showmedication(data);
      this.originalMedication = response;
      setState(() {
        this.medication = response;
      });
    });
  }
  
  Widget build(BuildContext context) {
   if(ModalRoute.of(context).settings.arguments is String){
      String instance = ModalRoute.of(context).settings.arguments;
      setState(() {
        _treatid=instance;
      });
    }
  else{
     dynamic  treatmentplanInstance = ModalRoute.of(context).settings.arguments;
    dynamic treatmentplanItem = treatmentplanInstance;
   _treatid=treatmentplanItem["_id"];
  }
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'Medication',
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
...medication.map<Widget>((item) {
              return _listItem(
                  item,
                );
              }).toList(),
                               ]),
        
      
    );
  }
  
           _listItem(dynamic medicationItem){
             _timeformat(){
  var _fromtime=DateTime.parse(medicationItem["date"]);
 var frommonth=_fromtime.month.toString();
  var fromyear=_fromtime.year.toString();
  var fromday=_fromtime.day.toString();
  return Text(fromday+"/"+frommonth+"/"+fromyear??'no time added'
             ,style: TextStyle(color: Colors.grey,),textAlign:TextAlign.right,);
  }
        return
               Card(
              child:Column(children: <Widget>[
                
                Center(child:
                  Text(
                 medicationItem["medicationCode"]["name"]
                 ,style:TextStyle(color: Color(0xFF00B6F0),fontSize: 18),
              ), 
                ),
                Row(
                  children: <Widget>[ 
             

                Expanded(flex:1,child: 
                
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
               Text(
                'Date of Addition:', textAlign:TextAlign.start,
              ),
               Text(
                'Category', textAlign:TextAlign.start,
              ),
               
              Text(
                'Dose', textAlign:TextAlign.start,
              ),
              Text(
                'Duration', textAlign:TextAlign.start,
              ),
              ],
            ),
                ),
                  Expanded(flex:1,child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(""),
              _timeformat(),
               Text(
                medicationItem["medicationCode"]["category"]["name"], 
                textAlign:TextAlign.right, style: TextStyle(color: Colors.grey),
              ),
               Text(
                medicationItem["dose"].toString(),
                 textAlign:TextAlign.right, style: TextStyle(color: Colors.grey),
              ),
              Container(width:120,child:Text(
                medicationItem["dailyRepeat"].toString()+
                " unit(s) each day for "+
                medicationItem["durationValue"].toString()+" "+
                medicationItem["durationType"],
                textAlign:TextAlign.center, style: TextStyle(color: Colors.grey),
              ),),
              ],
            ),
                ),
              ],
              ),
                    Container (
      width: 300,
      child: new Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text ("   Description",style: TextStyle(color: Colors.black,fontSize: 16)),
          new Text (medicationItem["description"]??"no description available",
          style: TextStyle(color: Colors.grey,fontSize: 16,),),
        ],
      ),
    ), 
           SizedBox(
                        height: 1,
                      ),
          
            ],
                ),
                
          
          
            );
                      
          
            
}
  } 