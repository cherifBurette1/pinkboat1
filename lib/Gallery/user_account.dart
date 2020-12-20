import 'package:flutter/material.dart';
import 'imagepick.dart';
import '../common/apis.dart';
// import 'package:flutterapp/common/apis.dart';
// import 'package:js_shims/js_shims.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends MaterialPageRoute<Null> {
  final dynamic userData;

  UserAccount(this.userData)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Account'),
              backgroundColor: Colors.pink[400],
            ),
            body: Container(
                child: Column(
              children: <Widget>[
                Container(
                  child: UserAccountsDrawerHeader(
                    accountName: (userData != null)
                        ? new Text(Apis.first_name+" "+
                            Apis.middle_name +" "+
                            Apis.last_name)
                        : Text('User Name'),
                    accountEmail: (userData != null)
                        ? new Text(Apis.email)
                        : Text('User email'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                         _checkpicstate2()),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink[400],
                    ),
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: <Widget>[
                    ListTile(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Image_Pick()),
                      ),
                      leading: Icon(Icons.person),
                      title: Text('change display picture'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.book),
                      title: Text('My Wishlist'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.person_outline),
                      title: Text('Yours'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.bookmark),
                      title: Text('My address book'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.feedback),
                      title: Text('Leave feedback'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.star),
                      title: Text('Rate us on play store'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.av_timer),
                      title: Text('Communication prefrence'),
                    ),
                  ],
                ))
              ],
            )),
          );
        });
static _checkpicstate2() {
   
  String pic;
   if (Apis.pic==""){
   pic="https://www.freeiconspng.com/uploads/female-icon-23.png";
   }else{
     pic=Apis.pic;
   }
   return pic;
  }
}
