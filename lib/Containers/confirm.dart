import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Containers/signin.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _formKey = GlobalKey<FormState>();
FocusNode _passwordFocusNode = FocusNode();
FocusNode _repasswordFocusNode = FocusNode();
FocusNode _phoneFocusNode = FocusNode();
bool secured1 = true;
bool secured2 = true;
String _password;
String _re_password;
final myController1 = TextEditingController();
final myController2 = TextEditingController();
String password;

class Confirm extends StatefulWidget {
  @override
  _Confirm createState() => _Confirm();
}

class _Confirm extends State<Confirm> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            'change password',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Form(
                  key: _formKey,
                  child: Container(
                      child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Image(
                        image: AssetImage('assets/images/signIn.png'),
                        height: 200,
                        width: 400,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    PasswordInput(),
                    SizedBox(
                      height: 20,
                    ),
                    RepasswordInput(),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 45.0,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.white)),
                        onPressed: () {
                          password = myController2.text;
                          print(password);
                          if (password != null) {
                            handlepassword();
                          }
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            // toastMessage(
                            //     "Welcome $_first_name $_middle_name\nYou have been signed up");
                          }
                        },
                        child: const Text(' confirm ',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ])))
            ])));
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        fontSize: 16.0);
  }

  Widget PasswordInput() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      keyboardType: TextInputType.text,
      obscureText: secured1,
      controller: myController1,
      decoration: InputDecoration(
          labelText: "Password",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28.0)),
            borderSide:
                BorderSide(color: Colors.pinkAccent.withOpacity(.2), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1)),
          fillColor: Colors.pink,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                secured1 = !secured1;
              });
            },
            child: Icon(secured1 ? Icons.visibility_off : Icons.visibility),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.pink,
          )),
      textInputAction: TextInputAction.next,
      validator: (password) {
        //Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
        Pattern pattern =
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password)) {
          toastMessage(
              "Password should be:\nMinimum six characters\nAt least one uppercase letter,\nOne lowercase letter\n one number\n and one secial char");
          return 'Invalid password Format';
        } else {
          _password = password;
          return null;
        }
      },
      onSaved: (password) => _password = password,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _passwordFocusNode, _repasswordFocusNode);
      },
    );
  }

  Widget RepasswordInput() {
    return TextFormField(
      focusNode: _repasswordFocusNode,
      keyboardType: TextInputType.text,
      obscureText: secured2,
      controller: myController2,
      decoration: InputDecoration(
          labelText: "Re-Password",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28.0)),
            borderSide:
                BorderSide(color: Colors.pinkAccent.withOpacity(.2), width: 1),
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1)),
          fillColor: Colors.pink,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                secured2 = !secured2;
              });
            },
            child: Icon(secured2 ? Icons.visibility_off : Icons.visibility),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.pink,
          )),
      textInputAction: TextInputAction.next,
      validator: (repassword) {
        Pattern pattern =
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(repassword))
          return 'Invalid password Format';
        else if (repassword != _password) {
          return 'Re-password doesn\'t match password';
        } else
          return null;
      },
      onSaved: (repassword) => _re_password = repassword,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _repasswordFocusNode, _phoneFocusNode);
      },
    );
  }

  handlepassword() async {
    String rep;
    var data = {"email": Apis.fmail, "newPassword": password};
    var response = await Apis.changepassword(data);
    rep = response["message"];
    if (rep == "success") {
      Fluttertoast.showToast(msg: "Password updated successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      Fluttertoast.showToast(msg: "failed updated password");
    }
  }
}
