import 'package:flutter/material.dart';
import '../common/apis.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
class FamilyHistory extends StatefulWidget {
  @override
  
  _FamilyHistoryState createState() => _FamilyHistoryState();
  
}

class _FamilyHistoryState extends State<FamilyHistory> {
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      iastate();
    });
  }
       List<dynamic> familyhistory = [];
  List<dynamic> originalFamilyhistory = [];
  int fam=0;
  int count = 1;
FocusNode mnamefocus;
FocusNode fnamefocus;
TextEditingController mothercontroller;
TextEditingController fathercontroller;
String fathername;
String mothername;
BuildContext comain;
  @override
  Widget build(BuildContext context) {
    
     var childButtons = List<UnicornButton>();
      childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add father",
        currentButton: FloatingActionButton(
          heroTag: "father",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(
            Icons.face,
            color: Colors.white,
          ),
          onPressed: () {
          fatherbox(context);
          },
        )));
              childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add Mother",
        currentButton: FloatingActionButton(
          heroTag: "Mother",
          backgroundColor: Colors.pink[400],
          mini: true,
          child: Icon(
            Icons.pregnant_woman,
            color: Colors.white,
          ),
          onPressed: () {
          motherbox(context); 
          },
        )));

      return Scaffold(
           floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.blue[500],
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: childButtons,
      ),
      appBar:  AppBar(
         title: Text( 
            "Family history",
            style: TextStyle(
              color: Colors.white
            ),),
        backgroundColor: Colors.pinkAccent,
          leading: FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(  
            Icons.arrow_back,
            color: Colors.white
          ), ), ),
          
      body:   new RefreshIndicator(
        onRefresh: _handleRefresh,
        child:  familyhistory!=null?ListView(
children: <Widget>[
  
         ...familyhistory.map<Widget>((item) {
                 return _listItem(
                   item,
                 );
               }).toList(),
         //_listItem(familyhistory),
],
    ):  
     Center(child: Text(" ",style: TextStyle(fontSize: 24,),),)

                               
    
    ),);
          
      
  }
  _listItem(dynamic familyhistoryItem){
    fam++;
    return       Container(
          margin: EdgeInsets.only(left:20,right:20,top: 30),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          width: 320,
          height: 150,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.pinkAccent.withOpacity(.2), width: 1),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 30,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Center(child:
                          Text(
                            
                        '                           Family History ',
                        style: TextStyle(
              color:Color(0xFF00B6F0)
            ),
                      ),
                      
                          ),
                          Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                        ]
                      ),
                       Text(
                        familyhistoryItem["name"]??"hmm",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      
                      Text(
                        familyhistoryItem["relationship"]??"hmm",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                       Divider(
                        color: Colors.black38,
                      ),
                      SizedBox(
                        height: 1,
                      ),  Text(
                        'Condition',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                     
                      Text(
                        cancerstate(familyhistoryItem["condition"]),
                        style: TextStyle(
                          color: Colors.grey,
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
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
  }
  motherbox(context) {
    Widget txtfield1 = TextFormField(
  controller: mothercontroller,
  onChanged: (text) {
   mothername = text;
  },
  
  focusNode: mnamefocus,
  keyboardType: TextInputType.number,
  maxLength: 14,
  decoration: InputDecoration(
    fillColor: Colors.pink[400],
    prefixIcon: Icon(
      Icons.pregnant_woman,
      color: Colors.pink[400],
    ),
    labelText: "Mother ID",
    hintText: "e.g 28012129856851",
    // labelStyle: TextStyle(
    //   color:labelgrey
    // ),
    contentPadding: EdgeInsets.all(12.0), // Inside box padding
  ),
  textInputAction: TextInputAction.next,
   validator: (nid) {
        if (nid.length < 1)
          return 'National ID is required';
        else if (nid.length < 14)
          return 'National ID should be 14 numbers';
        else if ((nid[0]) != "2" && (nid[0]) != "3") {
          print(nid[0]);
          return 'Invalid National ID';
        } else
          return null;
      },
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
     
     await addmother();
      Navigator.pop(comain);
    },
  ),
);
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
                  "Add Mother ID",
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
                  SizedBox(
                    height: 60,
                  ),
                  sub1,
                ]),
              ),
            ),
          ),
        );
      });

}
fatherbox(context) {
    Widget txtfield1 = TextFormField(
  controller: fathercontroller,
  onChanged: (text) {
    fathername = text;
  },
  focusNode: fnamefocus,
  keyboardType: TextInputType.number,
    maxLength: 14,
  decoration: InputDecoration(
    fillColor: Colors.pink[400],
    prefixIcon: Icon(
      Icons.face,
      color: Colors.pink[400],
    ),
    labelText: "Father ID",
    hintText: "e.g 28012129856851",
    // labelStyle: TextStyle(
    //   color:labelgrey
    // ),
    contentPadding: EdgeInsets.all(12.0), // Inside box padding
  ),
  textInputAction: TextInputAction.next,
   validator: (nid) {
        if (nid.length < 1)
          return 'National ID is required';
        else if (nid.length < 14)
          return 'National ID should be 14 numbers';
        else if ((nid[0]) != "2" && (nid[0]) != "3") {
          print(nid[0]);
          return 'Invalid National ID';
        } else
          return null;
      },
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
     
      await addfather();
      Navigator.pop(comain);
    },
  ),
);
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
                  "Add Father ID",
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
                  SizedBox(
                    height: 60,
                  ),
                  sub1,
                ]),
              ),
            ),
          ),
        );
      });

}
addmother() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_NID": Apis.national,
    "parent_NID": mothername,
    "relationship":"mother"
  };
  String response = await Apis.delimmunizationapi(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "mother is added successfully");
  } else {
    Fluttertoast.showToast(
        msg: response);
  }
}
addfather() async {
  var data = {
    "token": Apis.mytoken,
    "citizen_NID": Apis.national,
    "parent_NID": fathername,
    "relationship":"father"
  };
  String response = await Apis.familyadd(data);
  if (response == 'success') {
    Fluttertoast.showToast(msg: "father is added successfully");
  } else {
    Fluttertoast.showToast(
        msg: "father is not added");
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
     var data = {
    "token": Apis.mytoken,
    "citizen_id": Apis.id
  };
  dynamic response = await Apis.familyshow(data);
    this.originalFamilyhistory = response;
    
    setState(() {
      this.familyhistory = response;
    });
  }
cancerstate(var c){
  if(c==true){
     Fluttertoast.showToast(msg: "you are a potential patient please consider doing a test");
    return "has cancer"; 
    
    }
else if(c==true){
  return "cancer free";
} else{
return "did not do a screening result yet";
}
}
}
  