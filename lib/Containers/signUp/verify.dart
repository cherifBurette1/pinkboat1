import 'package:flutter/material.dart';
import 'pinbox.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import '../signin.dart';

String email;
String code;

class box2 extends StatefulWidget {
  box2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _box2 createState() => new _box2();
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      fontSize: 16.0);
}

class _box2 extends State<box2> {
  @override
  List<TextEditingController> controllers = <TextEditingController>[
    new TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'Verify',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: new Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 40, 50, 12),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Image(
                      image: AssetImage('assets/images/signIn.png'),
                      height: 200,
                      width: 400,
                    ),
                  ),
                ),
                Text(
                  "Enter verification code here",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pinBoxs(50.0, controllers, Colors.white,
                        Colors.black, context, false),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                SizedBox(
                  width: 200.0,
                  height: 45.0,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    onPressed: () {
                      String a;
                      String b;
                      String c;
                      String d;
                      a = controllers[0].value.text;
                      b = controllers[1].value.text;
                      c = controllers[2].value.text;
                      d = controllers[3].value.text;
                      code = a + b + c + d;
                      debugPrint(code);
                      /*   validator:
                  (code) {
                    if (controllers.isEmpty) {
                      return 'Please enter code';
                    }
                    if (code != true && controllers == handlecode()) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    }
                    return null;
                  };*/
                      handlecode();
                    },
                    child: const Text(' verify ',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  handlecode() async {
    var response = await Apis.verify(code);
    if (response.toString().contains("200")) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
      toastMessage("success");
    } else if (response.toString().contains("404")) {
      toastMessage("incorrect code!");
    }
  }
}
