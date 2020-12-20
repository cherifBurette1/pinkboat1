import 'package:flutter/material.dart';
import 'package:flutterapp/common/apis.dart';
import 'Medical_Profile.dart';

String _treatid;
int counter=-1;
class Session extends StatefulWidget {
  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
  List<dynamic> sessions;
  List<dynamic> originalSessions;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var data = {"treatmentPlan_id": _treatid};
      dynamic response = await Apis.showsession(data);
      this.originalSessions = response;
      setState(() {
        this.sessions = response;
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
    dynamic treatmentplanInstance = ModalRoute.of(context).settings.arguments;
    dynamic treatmentplanItem = treatmentplanInstance;
    _treatid = treatmentplanItem["_id"];
    }
    debugPrint(sessions.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          'Sessions',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            // fontFamily: Utils.ubuntuRegularFont
          ),
        ),
        centerTitle: true,
        leading: FlatButton(
          onPressed: () {
            counter=-1;
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Divider(
          color: Colors.black38,
        ),
        SizedBox(
          height: 1,
        ),
           sessions!=null?
          Column(children:<Widget>[    
              ...sessions.map<Widget>((item) {
                return (

                 _Sessionlist(item)
                  // item["medical_org"]["pic_url"],
                  // item["medical_org"]["name"],
                  // item["medical_org"]["address"],
                );
              }).toList(),
                    ]):
                      Center(child: Text("Loading...",style: TextStyle(fontSize: 24,),),),

                               ]),
    );
  }

  _Sessionlist(dynamic sessionItem) {
    _timeformat() {
      
      var _fromtime = DateTime.parse(sessionItem["date"]);
      var frommonth = _fromtime.month.toString();
      var fromyear = _fromtime.year.toString();
      var fromday = _fromtime.day.toString();
      return Text(
        fromday + "/" + frommonth + "/" + fromyear ?? 'no time added',
        style: TextStyle(
          color: Colors.grey,
        ),
        textAlign: TextAlign.right,
      );
    }

    _checkifattended() {
      String attention = "";
      if (sessionItem["attend"].toString() == "false") {
        attention = "didn't attend";
      } else {
        attention = "attended";
      }
      return Text(
        attention,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.grey),
      );
    }
counter=counter+1;
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Session '+counter.toString(),
              style: TextStyle(color: Color(0xFF00B6F0), fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Date of Session:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Dose:',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'attendance:',
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _timeformat(),
                    Text(
                      sessionItem["dose"].toString() ?? 'nnjj' + 'MG',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.grey),
                    ),
                    _checkifattended(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text("   Description",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                new Text(
                  "   " + sessionItem["description"] ??
                      'there is no description found',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black38,
          ),
          SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
