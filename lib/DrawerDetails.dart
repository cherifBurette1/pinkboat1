import 'package:flutter/material.dart';
import 'package:flutterapp/Gallery/Help.dart';
//import 'package:flutterapp/Gallery/reports.dart';
import 'common/apis.dart';
import 'Widgets/sharedpref.dart';
import 'Gallery/Notify.dart';
import 'MyReservation/my_res.dart';
import './Gallery/reports.dart';
import 'Gallery/settings_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Hospital/Medical_Profile.dart';
import 'Gallery/user_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:js_shims/js_shims.dart';
import 'package:flutterapp/Containers/signin.dart';
import './Gallery/imagepick.dart';

//import 'Gallery/reports.dart';
class Ndrawer extends StatefulWidget {
  @override
  _Ndrawer createState() => _Ndrawer();
}

class _Ndrawer extends State<Ndrawer> {
  var userData;
  var guest;
  getuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = await prefs.getString('userData');
    setState(() {
      userData = JSON.parse(user);
    });
    print('user ${user}');
    return userData;
  }

  @override
  void initState() {
    getuserdata();
    super.initState();

    // print('object ${getuserdata()['name']}');
  }

  dynamic userdetails;
  Widget build(BuildContext context) {
    dynamic userInstance = ModalRoute.of(context).settings.arguments;
    userdetails = userInstance;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            onDetailsPressed: () {
              Navigator.of(context).push(UserAccount(userData));
            },
            accountName: Text(_name()),

            //  (userData != null)
            //     ? new Text(userData['name'].toString())
            //     : Text('User Name'),
            accountEmail: Text(_mail()),

            //  (userData != null)
            //     ? new Text(userData['email'].toString())
            //     : Text('User email'),
            currentAccountPicture: GestureDetector(
              onTap: () {
                _handlechangepic();
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(_checkpicstate1()),

                // child: Icon(
                //   Icons.person,
                //   size: 60,
                //   color: Colors.white,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pink[400],
            ),
          ),
          ListTile(
              leading: Icon(Icons.content_paste),
              title: Text('Test results &Reports'),
              onTap: () {
                if (Apis.mytoken != "") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Reports()),
                  );
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => SignIn()));
                }
              }),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('My Reservations'),
            onTap: () {
              if (Apis.mytoken != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => MyReservation()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Medical Profile'),
            onTap: () {
              if (Apis.mytoken != "") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalProfile()),
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.add_alert),
            title: Text('Notifications'),
            onTap: () async{
              if (Apis.mytoken != "") {
                await checknot();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notify()),
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: ()async {
              if (Apis.mytoken != "") {
                await signingtoggle();
                await fingertoggle();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
                            Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => Help()));
            },
          ),
          _inout(),
        ],
      ),
    );
  }

  _checkpicstate1() {
    String pic;
    if (Apis.pic == "") {
      pic = "https://www.freeiconspng.com/uploads/female-icon-23.png";
    } else {
      pic = Apis.pic;
    }
    return pic;
  }

  _name() {
    if (Apis.mytoken != "") {
      return Apis.first_name + " " + Apis.middle_name + " " + Apis.last_name;
    } else {
      return "Guest Name";
    }
  }

  _mail() {
    if (Apis.mytoken != "") {
      return Apis.email;
    } else {
      return "Guest Email";
    }
  }

  _inout() {
    if (Apis.mytoken == "") {
      return ListTile(
        leading: Icon(Icons.power_settings_new),
        title: Text('Sign Up/In'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        },
      );
    } else {
      return ListTile(
        leading: Icon(Icons.power_settings_new),
        title: Text('Logout'),
        onTap: () async {
          //  SharedPreferences spref =
          //    await SharedPreferences.getInstance();
          //  setState(() {
          //   Apis.delete=1;
          //  });
          //   afterSignin();
          await removeshared();
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
        },
      );
    }
  }

  _handlechangepic() {
    if (Apis.mytoken == "") {
      return Fluttertoast.showToast(
          msg: "you must login to change your display picture");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Image_Pick()),
      );
    }
  }
}
