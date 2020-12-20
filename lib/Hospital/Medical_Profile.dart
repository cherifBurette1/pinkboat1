import 'package:flutter/material.dart';
import 'package:flutterapp/Hospital/family_history.dart';
import 'package:flutterapp/Hospital/medication.dart';
import 'medication.dart';
import 'sessions.dart';
import 'medication1.dart';
import '../common/apis.dart';

final endColor = Color(0xFFe46792);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);
int count=0;
class MedicalProfile extends StatefulWidget {
  @override
  _MedicalProfileState createState() => _MedicalProfileState();
}

class _MedicalProfileState extends State<MedicalProfile> {
  List<dynamic> treatmentplan;
  List<dynamic> originalTreatmentplan;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
   istate();
      
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          'Medical Profile',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            // fontFamily: Utils.ubuntuRegularFont
          ),
        ),
        centerTitle: true,
      ),
      body:new RefreshIndicator(
           onRefresh: _handleRefresh,
      child:
       ListView(children: <Widget>[
        _UserData(),
        _MedicalHistory(),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Treatment Plans',
                  style: TextStyle(color: Color(0xFF00B6F0), fontSize: 18),
                )
              ]),
        ),
            treatmentplan!=null?
          Column(children:<Widget>[ 
        ...treatmentplan.map<Widget>((item) {
          return _TreatPlan(
            item,
          );
        }).toList(),
          ]): Center(child: Text(" ",style: TextStyle(fontSize: 24,),),),
      ]),
      )
    );
  }

  _UserData() {
    return Container(
      height: 200,
      width: 130,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_checkpicstate()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(70),
                  border: Border.all(
                      color: Colors.pinkAccent.withOpacity(.2), width: 1)),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Center(
              child: Text(
            Apis.first_name + " " + Apis.middle_name + " " + Apis.last_name,
            style: TextStyle(color: titleColor, fontSize: 20),
          ))
        ],
      ),
    );
  }

  _MedicalHistory() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      width: 320,
      height: 110,
      decoration: BoxDecoration(
         
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalHistory()),
                ),
                child: Text(
                  'Medical History',
                  style: TextStyle(
                    color: Color(0xFF00B6F0),
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
            Row(children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FamilyHistory()),
                ),
                child: Text(
                  'Family History',
                  style: TextStyle(
                    color: Color(0xFF00B6F0),
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
          ]),
    );
  }

  _TreatPlan(dynamic treatmentplanItem) {
    _totimeformat() {
      var _totime = DateTime.parse(treatmentplanItem["to"]);
      var tomonth = _totime.month.toString();
      var toyear = _totime.year.toString();
      var today = _totime.day.toString();
      return Text(
        today + "/" + tomonth + "/" + toyear ?? 'no time added',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      );
    }
     _assigntimeformat() {
      var _totime = DateTime.parse(treatmentplanItem["treat_code"]["assign_date"]);
      var tomonth = _totime.month.toString();
      var toyear = _totime.year.toString();
      var today = _totime.day.toString();
      return Text(
        today + "/" + tomonth + "/" + toyear ?? 'no time added',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      );
    }

    _fromtimeformat() {
      var _fromtime = DateTime.parse(treatmentplanItem["from"]);
      var frommonth = _fromtime.month.toString();
      var fromyear = _fromtime.year.toString();
      var fromday = _fromtime.day.toString();
      return Text(
        fromday + "/" + frommonth + "/" + fromyear ?? 'no time added',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
          
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
        Text(
          'Treatment Plan' + '',
          style: TextStyle(color: Color(0xFF00B6F0), fontSize: 18),
        ),
        Row(
          children: <Widget>[
            Text(
              'Stage: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              treatmentplanItem["phase"].toString() ?? 'no phase assigned',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(children: <Widget>[
          Text(
            'Hospital Name: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Container(width:320, child:Text(
               treatmentplanItem["treat_code"]["hospital_code"]["medical_org"]["name"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),),
          ],
        ),
        SizedBox(
          height: 8,
        ),
          Row(children: <Widget>[
          Text(
            'Hospital Number: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Text(
               treatmentplanItem["treat_code"]["hospital_code"]["medical_org"]["phone"]["phone"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
         Row(children: <Widget>[
          Text(
            'Hospital Address: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Container(width:320, child:
            Text(
              treatmentplanItem["treat_code"]["hospital_code"]["medical_org"]["street"]["name"]+", "+treatmentplanItem["treat_code"]["hospital_code"]["medical_org"]["street"]["area"]["name"]+", "+treatmentplanItem["treat_code"]["hospital_code"]["medical_org"]["street"]["area"]["city"]["name"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(children: <Widget>[
          Text(
            'Treating Doctor: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Container(width:320, child:
            Text(
              'Dr.' + treatmentplanItem["treat_code"]["doctor_id"]["citizen"]["first_name"]+" "+treatmentplanItem["treat_code"]["doctor_id"]["citizen"]["middle_name"]+" "+treatmentplanItem["treat_code"]["doctor_id"]["citizen"]["last_name"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        
         
        Row(children: <Widget>[
          Text(
            'Doctor Phone: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Text(
              treatmentplanItem["treat_code"]["doctor_id"]["citizen"]["phone"]["phone"],
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(children: <Widget>[
          Text(
            'Issue Date: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          _assigntimeformat(),
        ]),
        SizedBox(
          height: 8,
        ),
        Row(
          children: <Widget>[
            Text(
              'Date From: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            _fromtimeformat(),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(children: <Widget>[
          Text(
            'Date To: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          _totimeformat(),
        ]),
        SizedBox(
          height: 8,
        ),
        Row(children: <Widget>[
          Container(
           
            width: 300,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("   Description",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                Container( padding: EdgeInsets.only(left:15.0),child:new Text(
                  treatmentplanItem["description"] ??
                      'there is no description found',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),),
              ],
            ),
          ),
        ]),
        SizedBox(
          height: 8,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => Session(),
                    settings: RouteSettings(
                      arguments: treatmentplanItem,
                    ))),
            child: Text(
              'Sessions',
              style: TextStyle(
                color: Color(0xFF00B6F0),
                fontSize: 16,
              ),
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => Medication(),
                    settings: RouteSettings(
                      arguments: treatmentplanItem,
                    ))),
            child: Text(
              'Medication',
              style: TextStyle(
                color: Color(0xFF00B6F0),
                fontSize: 16,
              ),
            ),
          ),
        ]),
        SizedBox(
          height: 8,
        ),
      ]),
    );
  }

  _checkpicstate() {
   
  String pic;
   if (Apis.pic==""){
   pic="https://www.freeiconspng.com/uploads/female-icon-23.png";
   }else{
     pic=Apis.pic;
   }
   return pic;
  }
     Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    await istate();
    setState(() {
      count += 5;
    });

    return null;
  }
   istate() async {
      int camel = 0;
    count = count + camel;
    print(count);
       var data = {
        "token": Apis.mytoken.toString(),
        "citizen_id": Apis.id};
      debugPrint(Apis.id);
   dynamic response = await Apis.showtreatmentplan(data);
      this.originalTreatmentplan = response;
      setState(() {
        this.treatmentplan = response;
      });
}
}