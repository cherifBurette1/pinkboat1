import 'package:flutter/material.dart';
import 'package:flutterapp/Containers/signUp/pinbox.dart';
import 'package:flutterapp/TestCenter/TestCenters.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterapp/Hospital/hospital_list.dart';
import 'package:flutterapp/TestCenter/myresdetails copy.dart';
import 'package:flutterapp/TestCenter/myresdetails.dart';
import 'package:flutterapp/Hospital/myreshos.dart';
BuildContext dialogContext;
BuildContext dialogContext1;
BuildContext dialogContext2;
BuildContext dialogContext3;
DateTime resdate;
DateTime hospresdate;
String validate = "";
String validatehosp = "";
String abc;
String def;
String xyz;
String ghi;
int count = 0;

class MyReservation extends StatefulWidget {
  @override
  _MyReservationState createState() => _MyReservationState();
}

class _MyReservationState extends State<MyReservation> {
  List<dynamic> myreservation;
  List<dynamic> myreservation2;
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      istate();
    });
  }

  @override
  Widget build(BuildContext context) {
    /*  DateTime  selectedDate = ModalRoute.of(context).settings.arguments;
    DateTime newdate = selectedDate;
    setState(() {
      resdate=newdate;
    });*/
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'My Reservations',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        body: new RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            children: <Widget>[
              myreservation != null
                  ? Column(children: <Widget>[
                      ...myreservation.map<Widget>((item) {
                        return _confirmWidget(
                          item,
                          // item["medical_org"]["pic_url"],
                          // item["medical_org"]["name"],
                          // item["medical_org"]["address"],
                        );
                      }).toList(),
                    ])
                  : Text(
                      " ",
                      style: TextStyle(fontSize: 5),
                    ),
              myreservation2 != null
                  ? Column(children: <Widget>[
                      ...myreservation2.map<Widget>((item) {
                        return _hospconfirmWidget(
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
            ],
          ),
        ));
  }

  _confirmWidget(dynamic item) {
    setState(() {
      resdate = DateTime.parse(item["dateTime"]);
    });
    debugPrint(resdate.toString());

    return GestureDetector(
        onTap: () {
          if (item["testCenter_code"]["type"] == "static") {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MobileDetails1(),
                    settings: RouteSettings(
                        arguments: item["testCenter_code"]["medical_org"]
                            ["_id"])));
          } else {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MobileDetails(),
                    settings: RouteSettings(
                        arguments: item["testCenter_code"]["medical_org"]
                            ["_id"])));
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 30, right: 20, top: 8),
          height: 520,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.pink[400].withOpacity(0.5), width: 2),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 10)
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: <Widget>[
            SizedBox(
              height: 4,
            ),
            Row(children: <Widget>[
              Text(
                'Test Center Name: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                Text(
                  item["testCenter_code"]["medical_org"]["name"],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(children: <Widget>[
              Text(
                'Date: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                weekday(resdate),
                SizedBox(
                  width: 7,
                ),
                Text(
                  resdate.day.toString() +
                      "/" +
                      resdate.month.toString() +
                      "/" +
                      resdate.year.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(children: <Widget>[
              Text(
                'Time: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                _reformattime(resdate),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(children: <Widget>[
              Text(
                'Attendance: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                _attention(item["attendance"]),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    abc = item["_id"];
                    showAlertDialog1(context);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 15,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    def = item["_id"];
                    showAlertDialog(context);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              
                margin: new EdgeInsets.only(
                    left: 0.0, right:0.0, top: 5.0, bottom: 2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 8.0,
                child: new Padding(
                    padding: new EdgeInsets.all(12.0),
                    child: new Column(children: <Widget>[
                      Card(
                        
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          child: new Padding(
                            padding: new EdgeInsets.all(10.0),
                            child: Text(
                              'Before going to your screening appointment you should take the following precautions:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                      Container(
                        width: 400,
                        child: Text(
                          ' 1-dont take any kind of medicine in the last 24 hours before the test\n 2-dont eat any meals that is saturated with fats in the last 24 hours before the test\n 3-dont use any deodorant before the test\n 4-it is preferred to take any kind of painkiller before the test\n 5-notice that it is not preferred to do the test if you are pregnant',
                          style: TextStyle(color: Colors.grey[600],),
                        ),
                      ),
                    ]))),
          ]),
        ));
  }

  _hospconfirmWidget(dynamic item) {
    setState(() {
      hospresdate = DateTime.parse(item["dateTime"]);
    });
    debugPrint(resdate.toString());
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => HospitalDetailsAlph(),
                  settings: RouteSettings(
                      arguments: item["hospital_code"]["medical_org"]["_id"])));
        },
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 30, right: 20, top: 8),
          height: 280,
          decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.pink[400].withOpacity(.5), width: 2),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: <Widget>[
            SizedBox(
              height: 4,
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
                Container(
                  width: 300,
                  child: Text(
                    item["hospital_code"]["medical_org"]["name"] ?? "efe",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(children: <Widget>[
              Text(
                'Date: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                weekday(hospresdate),
                SizedBox(
                  width: 7,
                ),
                Text(
                  hospresdate.day.toString() +
                      "/" +
                      hospresdate.month.toString() +
                      "/" +
                      hospresdate.year.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(children: <Widget>[
              Text(
                'Time: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                _reformattimehosp(hospresdate),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(children: <Widget>[
              Text(
                'Attendance: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ]),
            Row(
              children: <Widget>[
                _attention(item["attendance"]),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            _notes(),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    xyz = item["_id"];
                    showAlertDialog3(context);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 15,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    ghi = item["_id"];
                    showAlertDialog2(context);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.pink[400],
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }

  _reformattime(DateTime fdate) {
    String state = "AM";
    int finall = fdate.hour;
    if (finall > 12) {
      finall = finall - 12;
      setState(() {
        state = "PM";
      });
    } else if (finall == 12) {
      setState(() {
        state = "PM";
      });
    }
    return Text(
      finall.toString() + ":" + resdate.minute.toString() + " " + state,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }

  _reformattimehosp(DateTime fdate) {
    String state = "AM";
    int finall = fdate.hour;
    if (finall > 12) {
      finall = finall - 12;
      setState(() {
        state = "PM";
      });
    } else if (finall == 12) {
      setState(() {
        state = "PM";
      });
    }
    return Text(
      finall.toString() + ":" + hospresdate.minute.toString() + " " + state,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }

  _attention(bool attend) {
    if (attend == false) {
      return Icon(
        Icons.cancel,
        color: Colors.grey,
        size: 19,
      );
    } else {
      return Icon(
        Icons.check_circle,
        color: Colors.grey,
        size: 19,
      );
    }
  }

  _cancelreservation() async {
    var data = {"token": Apis.mytoken, "reservation_id": def};

    String resp = await Apis.cancelreservation(data);
    debugPrint(resp);
    if (resp == "Reservation cancelled") {
      // Navigator.pop(context);
      return Fluttertoast.showToast(
          msg: "your reservation has been deleted successfully");
    } else {
      //Navigator.pop(context);
      return Fluttertoast.showToast(msg: resp);
    }
  }

  _cancelhospreservation() async {
    var data = {"token": Apis.mytoken, "reservation_id": ghi};

    String resp = await Apis.cancelhreservation(data);
    debugPrint(resp);
    if (resp == "Reservation cancelled") {
      // Navigator.pop(context);
      return Fluttertoast.showToast(
          msg: "your reservation has been deleted successfully");
    } else {
      // Navigator.pop(context);
      return Fluttertoast.showToast(msg: resp);
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Delete",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () {Navigator.pop(dialogContext); _cancelreservation();},
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () => Navigator.pop(dialogContext),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete Request",
        style: TextStyle(color: Colors.pink[400]),
      ),
      content: Text("Are you sure that you want to delete this reservation?"),
      actions: [
        cancelButton,
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

  showAlertDialog1(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
        child: Text(
          "Edit",
          style: TextStyle(
            color: Colors.pink[400],
            fontSize: 15,
          ),
        ),
        onPressed: () {
          setState(() {
            validate = "start";
          });
           Navigator.pop(dialogContext1);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => TestCenter()));
        });
    Widget continueButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () =>  Navigator.pop(dialogContext1),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Edit Reservation",
        style: TextStyle(color: Colors.pink[400]),
      ),
      content: Text("Are you sure that you want to edit this reservation?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
            dialogContext1 = context;
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text(
        "Delete",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () {  Navigator.pop(dialogContext2); _cancelhospreservation();}
    );
    Widget continueButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () =>   Navigator.pop(dialogContext2),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Delete Request",
        style: TextStyle(color: Colors.pink[400]),
      ),
      content: Text("Are you sure that you want to delete this reservation?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        dialogContext2 = context;
        return alert;
      },
    );
  }

  showAlertDialog3(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
        child: Text(
          "Edit",
          style: TextStyle(
            color: Colors.pink[400],
            fontSize: 15,
          ),
        ),
        onPressed: () {
          setState(() {
            validatehosp = "start";
          });
          Navigator.pop(dialogContext3);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => HospitalList()));
        });
    Widget continueButton = FlatButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.pink[400],
          fontSize: 15,
        ),
      ),
      onPressed: () => Navigator.pop(dialogContext3),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Edit Reservation",
        style: TextStyle(color: Colors.pink[400]),
      ),
      content: Text("Are you sure that you want to edit this reservation?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
         dialogContext3 = context;
        return alert;
      },
    );
  }

  weekday(DateTime fdate) {
    switch (fdate.weekday.toString()) {
      case '1':
        return Text(
          "Monday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
      case '2':
        return Text(
          "Tuesday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
      case '3':
        return Text(
          "Wednesday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
      case '4':
        return Text(
          "Thursday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        ;
        break;
      case '5':
        return Text(
          "Friday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
      case '6':
        return Text(
          "Saturday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
      case '7':
        return Text(
          "Sunday,",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        );
        break;
    }
  }

  _notes() {
    if (hospresdate.year < DateTime.now().year) {
      if (hospresdate.month < DateTime.now().month) {
        if (hospresdate.day < DateTime.now().day) {
          Row(children: <Widget>[
            Text(
              'Note: ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Text(
              'you can now make another reservation',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ]);
        }
      }
    } else
      return Text(
        " ",
        style: TextStyle(fontSize: 1),
      );
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
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    int camel = 0;
    count = count + camel;
    print(count);
    dynamic response = await Apis.myreservation(data);
    dynamic response2 = await Apis.myreservationhosp(data);
    setState(() {
      this.myreservation = response;
      this.myreservation2 = response2;
    });
  }
}
