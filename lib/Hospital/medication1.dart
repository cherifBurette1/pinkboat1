// import 'package:blog/item_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../common/apis.dart';
import 'package:unicorndial/unicorndial.dart';
import '../iconmed_icons.dart' as wow;
import 'package:fluttertoast/fluttertoast.dart';

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

int index1 = 0;
int index2 = 0;
int index3 = 0;
int index4 = 0;
int count = 1;
BuildContext comain;
FocusNode namefocus;
FocusNode name1focus;
FocusNode name2focus;
FocusNode name3focus;
TextEditingController allergy;
TextEditingController disease;
TextEditingController surgery;
TextEditingController immunization;
String allname;
String all1name;
String all2name;
String all3name;
List hm41 = [];
int c = 0;
DateTime start = DateTime.parse("1960-01-01 00:00:00Z");
DateTime end = DateTime.now();
DateTime select;
DateTime select1;
DateTime select2;
DateTime select3;

class BodyModel {
  String answer;
  Widget quantity;
  BodyModel({this.answer, this.quantity});
}

class MedicalHistory extends StatefulWidget {
  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      iastate();
    });
  }

  dynamic history;
  dynamic originialhistory;
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add allergie",
        currentButton: FloatingActionButton(
          heroTag: "allergy",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(
            wow.Iconmed.allergy1,
            color: Colors.white,
          ),
          onPressed: () {
            allergiebox(context);
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add disease",
        currentButton: FloatingActionButton(
          heroTag: "disease",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(wow.Iconmed.disease, color: Colors.white),
          onPressed: () {
            diseasebox(context);
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add surgery",
        currentButton: FloatingActionButton(
          heroTag: "surgery",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(wow.Iconmed.surgery, color: Colors.white),
          onPressed: () {
            surgerybox(context);
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add immunizations",
        currentButton: FloatingActionButton(
          heroTag: "immunizations",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(wow.Iconmed.vaccine, color: Colors.white),
          onPressed: () {
            immunizationbox(context);
          },
        )));

    // Add Children here

    return Scaffold(
      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.blue[500],
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: childButtons,
      ),
      appBar: AppBar(
        title: Text(
          "Medical history",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: new RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(

            itemCount: prepareData.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionPanelList(
                animationDuration: Duration(seconds: 1),
                children: [
                  ExpansionPanel(
                    body: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${prepareData[index].bodyModel.answer}',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                            ),
                          ),
                            
                          Container(
                            
                            //child:index==0?_allergies():index==1?_diseases():index==2?_surgeries():index==3?_immunizations(): Text("df")
                            child: checkbody(index),
                          ),
                        
                        ],
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(40),
                        child: Text(
                          prepareData[index].header,
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: prepareData[index].isExpanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    prepareData[index].isExpanded =
                        !prepareData[index].isExpanded;
                  });
                },
              );
            },
            
          ),
          
        ),
      ),
    );
  }

  checkbody(index) {
    if (index == 0) {
      if (prepareData[index].isExpanded == true) {
        return _allergies();
      } else {
        return prepareData[index].bodyModel.quantity;
      }
    } else if (index == 1) {
      if (prepareData[index].isExpanded == true) {
        return _diseases();
      } else {
        return prepareData[index].bodyModel.quantity;
      }
    } else if (index == 2) {
      if (prepareData[index].isExpanded == true) {
        return _surgeries();
      } else {
        return prepareData[index].bodyModel.quantity;
      }
    } else if (index == 3) {
      if (prepareData[index].isExpanded == true) {
        return _immunizations();
      } else {
        return prepareData[index].bodyModel.quantity;
      }
    }
  }

  Future<Null> _handleRefresh() async {
    await new Future.delayed(new Duration(seconds: 2));
    await iastate();
    setState(() {
      count += 5;
    });

    return null;
  }

  iastate() async {
    int camel = 0;
    count = count + camel;
    print(count);
    var data = {"token": Apis.mytoken, "citizen_id": Apis.id};
    debugPrint(Apis.id);
    dynamic response = await Apis.showmedhistory(data);
    this.originialhistory = response;
    setState(() {
      this.history = response;
    });
  }

  _allergies() {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          history != null
              ? history["allergies"].length != 0
                  ? Column(children: <Widget>[
                      ...history["allergies"].map((item) {
                        return allergiescard(
                          item,
                        );
                      }).toList(),
                    ])
                  : Center(
                      child: Text(
                        "Nothing here to show",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    )
              : Center(
                  child: Text(
                    "Nothing here to show",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                )
        ]),
      ),
    );
  }

  _diseases() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            history != null
                ? history["diseases"].length != 0
                    ? Column(children: <Widget>[
                        ...history["diseases"].map((item) {
                          return diseasecard(
                            item,
                          );
                        }).toList(),
                      ])
                    : Center(
                        child: Text(
                          "Nothing here to show",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )
                : nothing(),
          ],
        ),
      ),
    );
  }

  _surgeries() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            history != null
                ? history["surgeries"].length != 0
                    ? Column(children: <Widget>[
                        ...history["surgeries"].map((item) {
                          return surgerycard(
                            item,
                          );
                        }).toList(),
                      ])
                    : Center(
                        child: Text(
                          "Nothing here to show",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )
                : Center(
                    child: Text(
                      "Nothing here to show",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  _immunizations() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            history != null
                ? history["immunizations"].length != 0
                    ? Column(children: [
                        ...history["immunizations"].map((item) {
                          return vaccinecard(
                            item,
                          );
                        }).toList(),
                        SizedBox(height: 40,)
                      ])
                    : Center(
                        child: Text(
                          "Nothing here to show",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      )
                : Center(
                    child: Text(
                      "Nothing here to show",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<ItemModel> prepareData = <ItemModel>[
    ItemModel(
        header: 'Allergies',
        bodyModel: BodyModel(
            answer: 'here are your allergies that you have entered',
            quantity: Text("nothing here"))),
    // no video
    ItemModel(
        header: 'Diseases ',
        bodyModel: BodyModel(
            answer: 'here are your diseases that you have entered',
            quantity: Text("nothing here"))),
    ItemModel(
        header: 'Surgeries',
        bodyModel: BodyModel(
            answer: 'here are your surgeries that you have entered',
            quantity: Text("nothing here"))),
    ItemModel(
        header: 'Immunizations',
        bodyModel: BodyModel(
            answer: 'here are your immunizations that you have entered',
            quantity: Text("nothing here"))),
  ];
}

allergiescard(dynamic wow) {
  return new Slidable(
    delegate: new SlidableDrawerDelegate(),
    actionExtentRatio: 0.25,
    child: new Container(
      color: Colors.white,
      child: new ListTile(
        title: new Text(wow["name"]),
        subtitle: new Text(wow["date"]),
      ),
    ),
    secondaryActions: <Widget>[
      new IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () async {
          await delallergy(wow["_id"]);
        },
      ),
    ],
  );
}

diseasecard(dynamic wow1) {
  return new Slidable(
    delegate: new SlidableDrawerDelegate(),
    actionExtentRatio: 0.25,
    child: new Container(
      color: Colors.white,
      child: new ListTile(
        title: new Text(wow1["name"]),
        subtitle: new Text(wow1["date"]),
      ),
    ),
    secondaryActions: <Widget>[
      new IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () async {
          await deldisease(wow1["_id"]);
        },
      ),
    ],
  );
}

surgerycard(dynamic wow2) {
  return new Slidable(
    delegate: new SlidableDrawerDelegate(),
    actionExtentRatio: 0.25,
    child: new Container(
      color: Colors.white,
      child: new ListTile(
        title: new Text(wow2["name"]),
        subtitle: new Text(wow2["date"]),
      ),
    ),
    secondaryActions: <Widget>[
      new IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () async {
          await delsurgery(wow2["_id"]);
        },
      ),
    ],
  );
}

vaccinecard(dynamic wow3) {
  return new Slidable(
    delegate: new SlidableDrawerDelegate(),
    actionExtentRatio: 0.25,
    child: new Container(
      color: Colors.white,
      child: new ListTile(
        title: new Text(wow3["name"]),
        subtitle: new Text(wow3["date"]),
      ),
    ),
    secondaryActions: <Widget>[
      new IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () async {
          await delimmunization(wow3["_id"]);
        },
      ),
    ],
  );
}

Widget txtfield1 = TextField(
  controller: allergy,
  onChanged: (text) {
    allname = text;
  },
  focusNode: namefocus,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    fillColor: Colors.pink[400],
    prefixIcon: Icon(
      wow.Iconmed.allergy1,
      color: Colors.pink[400],
    ),
    labelText: "Allergie Name",
    hintText: "e.g strawberry allergy",
    // labelStyle: TextStyle(
    //   color:labelgrey
    // ),
    contentPadding: EdgeInsets.all(12.0), // Inside box padding
  ),
  textInputAction: TextInputAction.next,
);
Widget sub1 = new Container(
  // width: MediaQuery
  //     .of(context)
  //     .size
  //     .width * (4 / 5),
  // height: 45,
  // margin: EdgeInsets.only(top: 10, bottom: 10),
  child: RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      //side: BorderSide(color: Colors.red),
    ),
    child: Text(
      "Submit",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    color: Colors.pink[400],
    // color: Theme.of(context).primaryColor,
    onPressed: () async {
      debugPrint(allname);
      await addallergy();
      Navigator.pop(comain);
    },
  ),
);
Widget txtfield2 = TextField(
  onChanged: (text) {
    all1name = text;
  },
  focusNode: name1focus,
  controller: disease,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    fillColor: Colors.pink[400],
    prefixIcon: Icon(
      wow.Iconmed.disease,
      color: Colors.pink[400],
    ),
    labelText: "Disease Name",
    hintText: "e.g heart disease",
    // labelStyle: TextStyle(
    //   color:labelgrey
    // ),
    contentPadding: EdgeInsets.all(12.0), // Inside box padding
  ),
  textInputAction: TextInputAction.next,

  // onSaved: (disease){all1name=disease;}
);
Widget sub2 = new Container(
  // width: MediaQuery
  //     .of(context)
  //     .size
  //     .width * (4 / 5),
  // height: 45,02
  // margin: EdgeInsets.only(top: 10, bottom: 10),
  child: RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      //side: BorderSide(color: Colors.red),
    ),
    child: Text(
      "Submit",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    color: Colors.pink[400],
    // color: Theme.of(context).primaryColor,
    onPressed: () async {
      print(all1name);
      await adddisease();
      Navigator.pop(comain);
    },
  ),
);
Widget txtfield3 = TextFormField(
    onChanged: (text) {
      all2name = text;
    },
    focusNode: name2focus,
    controller: surgery,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      fillColor: Colors.pink[400],
      prefixIcon: Icon(
        wow.Iconmed.surgery,
        color: Colors.pink[400],
      ),
      labelText: "Surgery Name",
      hintText: "e.g Apendex surgery",
      // labelStyle: TextStyle(
      //   color:labelgrey
      // ),
      contentPadding: EdgeInsets.all(12.0), // Inside box padding
    ),
    textInputAction: TextInputAction.next,
    onSaved: (surgery) {
      all2name = surgery;
    });
Widget sub3 = new Container(
  // width: MediaQuery
  //     .of(context)
  //     .size
  //     .width * (4 / 5),
  // height: 45,
  // margin: EdgeInsets.only(top: 10, bottom: 10),
  child: RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      //side: BorderSide(color: Colors.red),
    ),
    child: Text(
      "Submit",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    color: Colors.pink[400],
    // color: Theme.of(context).primaryColor,
    onPressed: () async {
      print(all2name);
      await addsurgery();
      Navigator.pop(comain);
    },
  ),
);
Widget txtfield4 = TextFormField(
    onChanged: (text) {
      all3name = text;
    },
    focusNode: name3focus,
    controller: immunization,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      fillColor: Colors.pink[400],
      prefixIcon: Icon(
        wow.Iconmed.vaccine,
        color: Colors.pink[400],
      ),
      labelText: "Immunization Name",
      hintText: "e.g  Covid-19 Vaccine",
      // labelStyle: TextStyle(
      //   color:labelgrey
      // ),
      contentPadding: EdgeInsets.all(12.0), // Inside box padding
    ),
    textInputAction: TextInputAction.next,
    onSaved: (immunization) {
      all3name = immunization;
    });
Widget sub4 = new Container(
  // width: MediaQuery
  //     .of(context)
  //     .size
  //     .width * (4 / 5),
  // height: 45,
  // margin: EdgeInsets.only(top: 10, bottom: 10),
  child: RaisedButton(
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      //side: BorderSide(color: Colors.red),
    ),
    child: Text(
      "Submit",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    color: Colors.pink[400],
    // color: Theme.of(context).primaryColor,
    onPressed: () async {
      print(all3name);
      await addimmunization();
      Navigator.pop(comain);
    },
  ),
);
allergiebox(context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {},
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        // return alert dialog object
        comain = context;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Add Allergie",
                  style: TextStyle(
                    color: Colors.pink[400],
                  ),
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(children: <Widget>[
                  txtfield1,
                  Dat(),
                  SizedBox(
                    height: 30,
                  ),
                  sub1,
                ]),
              ),
            ),
          ),
        );
      });
}

diseasebox(context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {},
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        // return alert dialog object
        comain = context;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Add Disease",
                  style: TextStyle(
                    color: Colors.pink[400],
                  ),
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(children: <Widget>[
                  txtfield2,
                  Dat1(),
                  SizedBox(
                    height: 30,
                  ),
                  sub2,
                ]),
              ),
            ),
          ),
        );
      });
}

surgerybox(context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {},
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        // return alert dialog object
        comain = context;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Add Surgery",
                  style: TextStyle(
                    color: Colors.pink[400],
                  ),
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(children: <Widget>[
                  txtfield3,
                  Dat2(),
                  SizedBox(
                    height: 30,
                  ),
                  sub3,
                ]),
              ),
            ),
          ),
        );
      });
}

immunizationbox(context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {},
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        // return alert dialog object
        comain = context;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: Row(children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Add Immunziation",
                  style: TextStyle(
                    color: Colors.pink[400],
                  ),
                ),
              ]),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28.0))),
              content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(children: <Widget>[
                  txtfield4,
                  Dat3(),
                  SizedBox(
                    height: 30,
                  ),
                  sub4,
                ]),
              ),
            ),
          ),
        );
      });
}

class Dat extends StatefulWidget {
  @override
  _DatState createState() => _DatState();
}

class _DatState extends State<Dat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: end,
                            lastDate: end,
                            firstDate: start)
                        .then((date) {
                      setState(() {
                        select = date;
                      });
                    });
                  },
                  child: Container(
                    width: 100,
                    color: Colors.white,
                    child: Text(
                      checkdate(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                IconButton(
                    icon: Icon(Icons.date_range),
                    color: Colors.pink[400],
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: end,
                              lastDate: end,
                              firstDate: start)
                          .then((date) {
                        setState(() {
                          select = date;
                        });
                      });
                    }),
              ]),
            ]),
        Row(children: <Widget>[
          Text("_____________",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              )),
        ]),
      ]),
    );
  }
}

class Dat1 extends StatefulWidget {
  @override
  _Dat1State createState() => _Dat1State();
}

class _Dat1State extends State<Dat1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: end,
                          lastDate: end,
                          firstDate: start)
                      .then((date) {
                    setState(() {
                      select1 = date;
                    });
                  });
                },
                child: Container(
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    checkdate1(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(Icons.date_range),
                  color: Colors.pink[400],
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: end,
                            lastDate: end,
                            firstDate: start)
                        .then((date) {
                      setState(() {
                        select1 = date;
                      });
                    });
                  }),
            ]),
        Row(children: <Widget>[
          Text("_____________",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              )),
        ]),
      ]),
    );
  }
}

class Dat2 extends StatefulWidget {
  @override
  _Dat2State createState() => _Dat2State();
}

class _Dat2State extends State<Dat2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: end,
                          lastDate: end,
                          firstDate: start)
                      .then((date) {
                    setState(() {
                      select2 = date;
                    });
                  });
                },
                child: Container(
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    checkdate2(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(Icons.date_range),
                  color: Colors.pink[400],
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: end,
                            lastDate: end,
                            firstDate: start)
                        .then((date) {
                      setState(() {
                        select2 = date;
                      });
                    });
                  }),
            ]),
        Row(children: <Widget>[
          Text("_____________",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              )),
        ]),
      ]),
    );
  }
}

class Dat3 extends StatefulWidget {
  @override
  _Dat3State createState() => _Dat3State();
}

class _Dat3State extends State<Dat3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: end,
                          lastDate: end,
                          firstDate: start)
                      .then((date) {
                    setState(() {
                      select3 = date;
                    });
                  });
                },
                child: Container(
                  width: 100,
                  color: Colors.white,
                  child: Text(
                    checkdate3(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(Icons.date_range),
                  color: Colors.pink[400],
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: end,
                            lastDate: end,
                            firstDate: start)
                        .then((date) {
                      setState(() {
                        select3 = date;
                      });
                    });
                  }),
            ]),
        Row(children: <Widget>[
          Text("_____________",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
              )),
        ]),
      ]),
    );
  }
}

addallergy() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id,
    "name": allname,
    "date": select.year.toString() +
        "-" +
        select.month.toString() +
        "-" +
        select.day.toString()
  };
  String response = await Apis.addallergyapi(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "allergy is added successfully");
  } else {
    Fluttertoast.showToast(msg: "could not add the allergy, Please try again");
  }
}

adddisease() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id,
    "name": all1name,
    "date": select1.year.toString() +
        "-" +
        select1.month.toString() +
        "-" +
        select1.day.toString()
  };

  String response = await Apis.adddiseaseapi(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "disease is added successfully");
  } else {
    Fluttertoast.showToast(msg: "could not add the disease, Please try again");
  }
}

addsurgery() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id,
    "name": all2name,
    "date": select2.year.toString() +
        "-" +
        select2.month.toString() +
        "-" +
        select2.day.toString()
  };
  String response = await Apis.addsurgeryapi(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "surgery is added successfully");
  } else {
    Fluttertoast.showToast(msg: "could not add the surgery, Please try again");
  }
}

addimmunization() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id,
    "name": all3name,
    "date": select3.year.toString() +
        "-" +
        select3.month.toString() +
        "-" +
        select3.day.toString()
  };
  String response = await Apis.addimmunizationapi(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "immunzation is added successfully");
  } else {
    Fluttertoast.showToast(
        msg: "could not add the immunization, Please try again");
  }
}

delallergy(String id) async {
  var data = {"token": Apis.mytoken, "citizen_id": Apis.id, "allergy_code": id};
  String response = await Apis.delallergyapi(data);
  if (response == 'deleted') {
    Fluttertoast.showToast(msg: "allergy is deleted successfully");
  } else {
    Fluttertoast.showToast(
        msg: "could not delete the allergy, Please try again");
  }
}

deldisease(String id) async {
  var data = {"token": Apis.mytoken, "citizen_id": Apis.id, "disease_code": id};

  String response = await Apis.deldiseaseapi(data);
  if (response == 'deleted') {
    Fluttertoast.showToast(msg: "disease is deleted successfully");
  } else {
    Fluttertoast.showToast(
        msg: "could not delete the disease, Please try again");
  }
}

delsurgery(String id) async {
  var data = {"token": Apis.mytoken, "citizen_id": Apis.id, "surgery_code": id};
  String response = await Apis.delsurgeryapi(data);
  if (response == 'deleted') {
    Fluttertoast.showToast(msg: "surgery is deleted successfully");
  } else {
    Fluttertoast.showToast(
        msg: "could not delete the surgery, Please try again");
  }
}

delimmunization(String id) async {
  var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id,
    "immunization_code": id
  };
  String response = await Apis.delimmunizationapi(data);
  if (response == 'deleted') {
    Fluttertoast.showToast(msg: "immunzation is deleted successfully");
  } else {
    Fluttertoast.showToast(
        msg: "could not delete the immunization, Please try again");
  }
}

checkdate() {
  if (select != null) {
    return select.day.toString() +
        "/" +
        select.month.toString() +
        "/" +
        select.year.toString();
  } else {
    return "00/00/0000";
  }
}

checkdate1() {
  if (select1 != null) {
    return select1.day.toString() +
        "/" +
        select1.month.toString() +
        "/" +
        select1.year.toString();
  } else {
    return "00/00/0000";
  }
}

checkdate2() {
  if (select2 != null) {
    return select2.day.toString() +
        "/" +
        select2.month.toString() +
        "/" +
        select2.year.toString();
  } else {
    return "00/00/0000";
  }
}

checkdate3() {
  if (select3 != null) {
    return select3.day.toString() +
        "/" +
        select3.month.toString() +
        "/" +
        select3.year.toString();
  } else {
    return "00/00/0000";
  }
}

nothing() {
  return Center(
    child: Text(
      "Nothing here to show",
      style: TextStyle(fontSize: 20, color: Colors.blue),
    ),
  );
}

parsedate(String date) {
  DateTime newdate = DateTime.parse(date);
  return newdate.day.toString() +
      "/" +
      newdate.month.toString() +
      "/" +
      newdate.year.toString();
}
