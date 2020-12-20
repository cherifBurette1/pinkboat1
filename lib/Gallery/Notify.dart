import 'package:flutter/material.dart';

import '../common/apis.dart';
import '../Gallery/reports.dart';
import '../MyReservation/my_res.dart';
import '../Gallery/NotifySetting.dart';
import '../Hospital/sessions.dart';
import '../Hospital/medication.dart';
int count = 0;
class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List<dynamic> notification = [];
  List<dynamic> originalNotification = [];
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    istate();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[400],
      ),
      body:new RefreshIndicator(
           onRefresh: _handleRefresh,
      child:
       Container(
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          notification != null
              ? Column(children: <Widget>[
                  Center(
                    child: Text(
                      " ",
                      style: TextStyle(
                        fontSize: 5,
                      ),
                    ),
                  ),
                  ...notification.map<Widget>((item) {
                    return cardnotify(
                      item,
                    );
                  }).toList(),
                ])
              : Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
        ]),
      ),
      )
    );
  }

  cardnotify(dynamic notifyitem) {
    if(notifyitem["type"]==0){
if(not0==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    }else     if(notifyitem["type"]==1){
if(not1==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    }else     if(notifyitem["type"]==2){
if(not2==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    }else     if(notifyitem["type"]==3){
if(not3==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    }else     if(notifyitem["type"]==4){
if(not4==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    } else     if(notifyitem["type"]==5){
if(not5==true){
  return Card(
      child: new InkWell(
        onTap: () {
          checktype(notifyitem);
        },
        child: ListTile(
          leading: Icon(
            chooseicon(notifyitem["type"]),
            color: Colors.blue,
          ),

          title: Text(
            notifyitem["title"] ?? "not found",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.pink[400]),
          ),
          subtitle: Column(children: <Widget>[
            Text(
              notifyitem["Description"] ?? "desc",
              textAlign: TextAlign.start,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Text(
                notifyitem["notificationDate"],
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ]),
          // dense: true,
          // isThreeLine: false,
        ),
      ),
    );
}else{
  return SizedBox(height:0.2);
}
    }
    
  }

  checktype(dynamic item) {
    if (item["type"] == 0) {
      return Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Reports()));
    } else if (item["type"] == 1) {
      return Navigator.push(
          context, new MaterialPageRoute(builder: (context) => Reports()));
    } else if (item["type"] == 2) {
      return Navigator.push(context,
          new MaterialPageRoute(builder: (context) => MyReservation()));
    } else if (item["type"] == 3) {
      return Navigator.push(context,
          new MaterialPageRoute(builder: (context) => MyReservation()));
    } else if (item["type"] == 4) {
      return Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Session(),
              settings: RouteSettings(
                arguments: item["treatmentPlan_code"],
              )));
    } else if (item["type"] == 5) {
      return Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Medication(),
              settings: RouteSettings(
                arguments: item["treatmentPlan_code"],
              )));
    }
  }

  chooseicon(int type) {
    if (type == 0) {
      return Icons.description;
    } else if (type == 1) {
      return Icons.description;
    } else if (type == 2) {
      return Icons.date_range;
    } else if (type == 3) {
      return Icons.date_range;
    } else if (type == 4) {
      return Icons.assignment_late;
    } else if (type == 5) {
      return Icons.alarm;
    }
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
      var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
      dynamic response = await Apis.shownotification(data);
      this.originalNotification = response;
      setState(() {
        this.notification = response;
      });
  }
}
