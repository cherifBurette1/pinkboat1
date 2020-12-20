import 'package:flutter/material.dart';
import 'package:flutterapp/Containers/confirm.dart';
import 'package:flutterapp/Containers/signUp/pinbox.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';

String code;

class Box extends StatefulWidget {
  Box({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Box createState() => new _Box();
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 2,
      fontSize: 16.0);
}

class _Box extends State<Box> {
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
            'forget password',
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
                  Container(
                      child: Text(
                    "Enter verification code here",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pinBoxs(50.0, controllers, Colors.white,
                          Colors.black, context, false),
                    ),
                  ),
                  SizedBox(height: 40),
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
          ),
        ));
  }

  handlecode() async {
    var response = await Apis.verify1(code);
    if (response.toString().contains("200")) {
      toastMessage("success");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Confirm()));
    } else if (response.toString().contains("404")) {
      toastMessage("incorrect code!");
    }
  }
}
