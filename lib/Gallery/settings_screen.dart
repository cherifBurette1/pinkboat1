// import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Widgets/sharedpref.dart';
import 'package:flutterapp/theme_changer/theme_changer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/apis.dart';
//import 'package:flutterapp/Reservation/EditProfile.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Account_Details.dart';
// import 'package:oktoast/oktoast.dart';
import 'package:flutterapp/Widgets/fingerscreen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'NotifySetting.dart';
import 'package:flutterapp/Terms.dart';

String error = " ";
bool keeptog;
bool fingertog;
bool lang;
String error1 = " ";
String error2 = " ";
bool errorbool;
bool error1bool;
bool error2bool;
dynamic weCanCheckBiometrics;

signingtoggle() async {
  await check2ndflag1();
}

fingertoggle() async {
  await check3rdflag1();
}

noti() async {
  await checknot();
}



//  checkfinger()async{
//    final LocalAuthentication localAuth = LocalAuthentication();
//   dynamic weCanCheckBiometrics1 = await localAuth.canCheckBiometrics;
//   weCanCheckBiometrics=weCanCheckBiometrics1;
// }
// ifstate(){
//      if(checkfinger()){
//         bool toggle=true;
//         return toggle;
//                  } else{
//                    return false;
//                  }
// }
String id;
TextEditingController textEditingController = new TextEditingController();
int index;
final _formKey = GlobalKey<FormState>();

String phoneNum;
String _email;
String password;

final myController = TextEditingController(text: Apis.phone);

final myController1 = TextEditingController(text: Apis.email);

final myController2 = TextEditingController(text: Apis.password);

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool darkMode = false;
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings '),
        backgroundColor: Colors.pink[400],
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  // langbox(context);
                },
              ),
              SettingsTile.switchTile(
                  title: 'Dark Theme',
                  switchValue: darkMode,
                  onToggle: (bool value) {
                  
                    if(value){
                       _themeChanger.setTheme(ThemeData.dark());
                     print(_themeChanger.toString());
                    }else{
                     _themeChanger.setTheme(ThemeData.light());
                     print(_themeChanger.toString());
                    }
                      setState(() {
                      darkMode = value;
                    });

             
                  }),
              // SettingsTile.switchTile(
              //     title: 'Push Notification',
              //     onToggle: (bool value) {},
              //     switchValue: true),

              SettingsTile.switchTile(
                  title: 'Limit mobile data usage',
                  subtitle: 'Only stream videos on WiFi',
                  onToggle: (bool value) {},
                  switchValue: true),

              SettingsTile(
                title: 'Notification Setting',
                leading: Icon(Icons.notifications),
                onTap: () async {
                  await checknot();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) =>
                              Notification_Settings()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: ' Account',
            tiles: [
              SettingsTile(
                title: ' Edit Phone number',
                leading: Icon(Icons.phone),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: 400,
                          height: 600,
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                  leading: new Icon(Icons.notifications_active),
                                  title: new Text(
                                      ' you will change your phone number'),
                                  subtitle: new Text(
                                    'are you sure ?',
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () => {}),
                              editPhoneNumber(),
                            ],
                          ),
                        );
                      });
                  //Navigator.pushNamed(context, "/EditPhoneNumber");
                },
              ),
              SettingsTile(
                title: ' Edit Email',
                leading: Icon(Icons.email),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: 400,
                          height: 600,
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                  leading: new Icon(Icons.notifications_active),
                                  title:
                                      new Text(' you will change your Email'),
                                  subtitle: new Text(
                                    'are you sure ?',
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () => {}),
                              editEmail(),
                            ],
                          ),
                        );
                      });
                  //Navigator.pushNamed(context, "/EditPhoneNumber");
                },
              ),
              SettingsTile(
                title: ' Edit Password',
                leading: Icon(Icons.lock_open),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return Container(
                          width: 400,
                          height: 600,
                          child: new Wrap(
                            children: <Widget>[
                              new ListTile(
                                  leading: new Icon(Icons.notifications_active),
                                  title: new Text(
                                      ' you will change your Password'),
                                  subtitle: new Text(
                                    'are you sure ?',
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () => {}),
                              editPassword(),
                            ],
                          ),
                        );
                      });
                  //Navigator.pushNamed(context, "/EditPhoneNumber");
                },
              ),
              SettingsTile(
                title: 'Account details',
                leading: Icon(Icons.account_box),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => Details()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: Icon(Icons.phonelink_lock),
                switchValue: true,
                onToggle: (bool value) {
                  // setState(() {
                  //   lockInBackground = value;
                  // });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  onToggle: (bool value) {
                    if (value == true) {
                      Fluttertoast.showToast(
                          msg:
                              "please notice that if your device doesn't support fingerprint, this feature will not be working");

                      fingertog = false;
                      set3rdflag(true);
                    } else {
                      fingertog = true;
                      set3rdflag(false);
                    }
                  },
                  switchValue: fingertog),
              SettingsTile.switchTile(
                  title: 'Keep Signed In',
                  leading: Icon(Icons.lock_open),
                  switchValue: keeptog,
                  onToggle: (bool value) async {
                    if (value == true) {
                      keeptog = false;
                      await set2ndflag(value);
                    } else {
                      keeptog = true;
                      await set2ndflag(value);
                    }
                  }),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                title: 'Terms of Service',
                leading: Icon(Icons.description),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => TermsScreen()));
                },
              ),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
  // langbox(context) {
  //     showGeneralDialog(
  //         barrierColor: Colors.black.withOpacity(0.5),
  //         transitionDuration: Duration(milliseconds: 500),
  //         barrierDismissible: true,
  //         barrierLabel: '',
  //         context: context,
  //         pageBuilder: (context, animation1, animation2) {},
  //         transitionBuilder: (context, a1, a2, widget) {
  //           final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
  //           // return alert dialog object
  //           return Transform(
  //             transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
  //             child: Opacity(
  //               opacity: a1.value,
  //               child: AlertDialog(
  //                 title: Row(children: <Widget>[
  //                   IconButton(
  //                     icon: Icon(Icons.arrow_back),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                   Text(
  //                     "choose language",
  //                     style: TextStyle(
  //                       color: Colors.pink[400],
  //                     ),
  //                   ),
  //                 ]),
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(28.0))),
  //                 content: Container(
  //                   height: MediaQuery.of(context).size.height / 2.5,
  //                   child: Column(children: <Widget>[
  //                     FlatButton(
  //                         onPressed: () async {
  //                           await set4thflag(true);
  //                         },
  //                         child: Text(
  //                           "English",
  //                           style: TextStyle(color: Colors.blue[300]),
  //                         )),
  //                     FlatButton(
  //                         onPressed: () async {
  //                           await set4thflag(false);
  //                         },
  //                         child: Text(
  //                           "Arabic",
  //                           style: TextStyle(color: Colors.blue[300]),
  //                         )),
  //                   ]
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //   }

  validpass(String _password) {
    //Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
    Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,20}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(_password)) {
      Fluttertoast.showToast(
          msg:
              "Password should be:\nMinimum six characters\nAt least one uppercase letter,\nOne lowercase letter\nand one number");
      return null;
    } else {
      return true;
    }
  }

  handleemail() async {
    String rep;
    var data = {
      "token": Apis.mytoken,
      "citizen_id": Apis.id,
      "newEmail": _email
    };
    var response = await Apis.changeemail(data);

    rep = response["message"];
    if (rep == "success") {
      Fluttertoast.showToast(msg: "Email updated successfully");

      Apis.email = _email;
    } else {
      Fluttertoast.showToast(msg: rep);
    }
  }

  handlepassword() async {
    String rep;
    var data = {"email": Apis.email, "newPassword": password};
    var response = await Apis.changepassword(data);

    rep = response["message"];
    if (rep == "success") {
      Fluttertoast.showToast(msg: "Password updated successfully");
    } else {
      Fluttertoast.showToast(msg: rep);
    }
  }

  handlephone() async {
    String rep;
    var data = {
      "token": Apis.mytoken,
      "citizen_id": Apis.id,
      "newPhone": phoneNum
    };
    var response = await Apis.changephone(data);
    rep = response["message"];
    if (rep == "success") {
      Apis.phone = phoneNum;

      Fluttertoast.showToast(msg: "Phone updated successfully");
    } else {
      Fluttertoast.showToast(msg: rep);
    }
  }

  editEmail() {
    FocusNode _emailFocusNode = FocusNode();
    setState() {
      _email = null;
    }

    return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  focusNode: _emailFocusNode,
                  controller: myController1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pinkAccent, width: 1)),
                    fillColor: Colors.pinkAccent,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.pinkAccent,
                    ),
                    labelText: "Email",
                    hintText: "e.g abc@gmail.com",
                    // labelStyle: TextStyle(
                    //   color:labelgrey
                    // ),
                    contentPadding: EdgeInsets.all(12.0), // Inside box padding
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (EmailValidator.validate(value) != true) {
                      return 'not valid email';
                    } else
                      return null;
                  },

                  /**onFieldSubmitted: (_) {
                    fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                    }**/
                ),
                new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      //side: BorderSide(color: Colors.red),
                    ),
                    child: Text(
                      " update Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    color: Colors.pinkAccent,
                    // color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _email = myController1.text;
                      print(_email);
                      if (_formKey.currentState.validate()) {
                        handleemail();
                      }
                    }),
              ]))
        ]));
  }

  editPassword() {
    FocusNode _passwordFocusNode = FocusNode();
    return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  focusNode: _passwordFocusNode,
                  controller: myController2,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pinkAccent, width: 1)),
                    fillColor: Colors.pinkAccent,
                    prefixIcon: Icon(
                      Icons.lock_open,
                      color: Colors.pinkAccent,
                    ),
                    labelText: "password",
                    hintText: "atleast 6 char",
                    // labelStyle: TextStyle(
                    //   color:labelgrey
                    // ),
                    contentPadding: EdgeInsets.all(12.0), // Inside box padding
                  ),
                  textInputAction: TextInputAction.next,

                  /**onFieldSubmitted: (_) {
                                fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                                }**/
                ),
                Text(error1, style: TextStyle(color: Colors.red[400])),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    " update password",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  color: Colors.pinkAccent,
                  // color: Theme.of(context).primaryColor,
                  onPressed: () {
                    password = myController2.text;
                    print(password);
                    if (validpass(password) != null) {
                      handlepassword();
                    }
                  },
                )
              ]))
        ]));
  }

  editPhoneNumber() {
    return new Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: myController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.pinkAccent, width: 1)),
                    fillColor: Colors.pinkAccent,
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.pinkAccent,
                    ),
                    labelText: "Phone number",
                    hintText: "e.g 012344567897",
                    // labelStyle: TextStyle(
                    //   color:labelgrey
                    // ),
                    contentPadding: EdgeInsets.all(12.0), // Inside box padding
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    if (value.length < 11) {
                      return 'Please enter valid phone at least 11 char';
                    }
                    if (validatePhoneNumber(value) != null) {
                      return validatePassword(value);
                    }
                    return null;
                  },

                  /**onFieldSubmitted: (_) {
                                fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
                                }**/
                ),
                Text(error2, style: TextStyle(color: Colors.red[400])),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    //side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    " update phoneNumber",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  color: Colors.pinkAccent,
                  // color: Theme.of(context).primaryColor,
                  onPressed: () {
                    phoneNum = myController.text;
                    print(phoneNum);
                    if (_formKey.currentState.validate()) {
                      handlephone();
                    }
                  },
                )
              ]))
        ]));
  }
}

String validatEmail(String value) {
  if (EmailValidator.validate(value) == true) {
    return "valid";
  }
  return " not valid Email";
}

String validatePassword(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  print(value);
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value))
      return 'Enter valid password';
    else
      return null;
  }
}

String validatePhoneNumber(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
  validpass(String _password) {
    //Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
    Pattern pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,20}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(_password)) {
      Fluttertoast.showToast(
          msg:
              "Password should be:\nMinimum six characters\nAt least one uppercase letter,\nOne lowercase letter\nand one number");
      return null;
    } else {
      return true;
    }
  }

  handleemail() async {
    String rep;
    var data = {
      "token": Apis.mytoken,
      "citizen_id": Apis.id,
      "newEmail": _email
    };
    var response = await Apis.changeemail(data);

    rep = response["message"];
    if (rep == "success") {
      Fluttertoast.showToast(msg: "Email updated successfully");

      Apis.email = _email;
    } else {
      error = rep;
    }
  }
}
