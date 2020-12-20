import'package:flutter/material.dart';
import 'package:flutterapp/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/apis.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/home.dart';
import '../Containers/signin.dart';
import '../Gallery/settings_screen.dart';
import 'package:flutterapp/Gallery/NotifySetting.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:translator/translator.dart';

setshared(String email,String token,String password, String pic, String fname,
 String lname, String mname, String nid, String id , String street, String area , String city, String phone,
  String dob,bool nflag) async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();
prefzzz.setString('email', email);
prefzzz.setString('token', token);
prefzzz.setString('password', password);
prefzzz.setString('pic', pic);
prefzzz.setString('fname', fname);
prefzzz.setString('lname', lname);
prefzzz.setString('mname', mname);
prefzzz.setString('nid', nid);
prefzzz.setString('street', street);
prefzzz.setString('area', area);
prefzzz.setString('city', city);
prefzzz.setString('phone', phone);
prefzzz.setString('dob', dob);
prefzzz.setString('id', id);
prefzzz.setBool('flag', true);
prefzzz.setBool('flag1', nflag);
prefzzz.setBool('flag2', false);
prefzzz.setBool('flag3', true);
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag0', true);
prefzzz2.setBool('flag1', true);
prefzzz2.setBool('flag2', true);
prefzzz2.setBool('flag3', true);
prefzzz2.setBool('flag4', true);
prefzzz2.setBool('flag5', true);
}
setpic(String pic) async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();

prefzzz.setString('pic', pic);

  }
getshared()async{
  SharedPreferences prefzzz= await SharedPreferences.getInstance();
Apis.email=prefzzz.getString('email')??"";
Apis.mytoken=prefzzz.getString('token')??"";
Apis.password=prefzzz.getString('password')??"";
Apis.pic=prefzzz.getString('pic')??"";
Apis.first_name=prefzzz.getString('fname')??"";
Apis.last_name=prefzzz.getString('lname')??"";
Apis.middle_name=prefzzz.getString('mname')??"";
Apis.national=prefzzz.getString('nid')??"";
Apis.street=prefzzz.getString('street')??"";
Apis.area=prefzzz.getString('area')??"";
Apis.city=prefzzz.getString('city')??"";
Apis.phone=prefzzz.getString('phone')??"";
Apis.dob=prefzzz.getString('dob')??"";
Apis.id=prefzzz.getString('id')??"";
Apis.lang=prefzzz.getBool('flag')??"";
}

removeshared()async{
  SharedPreferences prefzzz= await SharedPreferences.getInstance();

prefzzz.remove('email');
prefzzz.remove('token');
prefzzz.remove('password');
prefzzz.remove('pic');
prefzzz.remove('fname');
prefzzz.remove('lname');
prefzzz.remove('mname');
prefzzz.remove('nid');
prefzzz.remove('street');
prefzzz.remove('area');
prefzzz.remove('city');
prefzzz.remove('phone');
prefzzz.remove('dob');
prefzzz.remove('id');
prefzzz.remove('flag');
prefzzz.remove('flag1');
prefzzz.remove('flag2');
                  Apis.mytoken ="";
                    Apis.id = "";
                    Apis.first_name = "";
                    Apis.middle_name ="";
                    Apis.pic="";
                    Apis.last_name ="";
                    Apis.phone ="";
                    Apis.email ="";
                    Apis.street ="";
                    Apis.national ="";
                    Apis.phone="";
                    Apis.area="";
                    Apis.city="";
                    Apis.dob="";
}

 

  checkshared()async {
SharedPreferences prefzzz= await SharedPreferences.getInstance();
dynamic  dec=prefzzz.getBool('flag')??false;
//if(dec=true){
  // Navigator.push(context,
  //                       MaterialPageRoute(
  //                           builder: (BuildContext ctx) => Home()));
//}else{
  // Navigator.push(context,
  //                       MaterialPageRoute(
  //                           builder: (BuildContext ctx) => SignIn())); 
//}
chk=dec;
return dec;
}
set2ndflag(bool value)async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();
prefzzz.setBool('flag1',value);
}    
 check2ndflag()async {
SharedPreferences prefzzz= await SharedPreferences.getInstance();
dynamic  dec=prefzzz.getBool('flag1')??false;
chk1=dec;
return dec;
}
 check2ndflag1()async {
SharedPreferences prefzzz= await SharedPreferences.getInstance();
bool  dec=prefzzz.getBool('flag1')??false;

keeptog=dec;
}
set3rdflag(bool value)async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();
prefzzz.setBool('flag2',value);
} 
 check3rdflag()async {
SharedPreferences prefzzz= await SharedPreferences.getInstance();
dynamic  dec=prefzzz.getBool('flag2')??false;
fingerchk=dec;
return dec;
}
 check3rdflag1()async {
SharedPreferences prefzzz= await SharedPreferences.getInstance();
bool  dec=prefzzz.getBool('flag2')??false;
fingertog=dec;

}
set4thflag(bool value)async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();
prefzzz.setBool('flag3',value);
Apis.lang=prefzzz.getBool('flag3');
} 
check4thflag()async{
SharedPreferences prefzzz= await SharedPreferences.getInstance();

Apis.lang=prefzzz.getBool('flag3');
} 
    
  
  

setboolnof0(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag0',value);

}
setboolnof1(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag1',value);
}
setboolnof2(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag2',value);
}
setboolnof3(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag3',value);
}
setboolnof4(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag4',value);
}
setboolnof5(bool value)async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();
prefzzz2.setBool('flag5',value);
}
checknot()async{
SharedPreferences prefzzz2= await SharedPreferences.getInstance();

not0=prefzzz2.getBool('flag0');
not1=prefzzz2.getBool('flag1');
not2=prefzzz2.getBool('flag2');
not3=prefzzz2.getBool('flag3');
not4=prefzzz2.getBool('flag4');
not5=prefzzz2.getBool('flag5');
} 


translate(String word) async{
  dynamic  trans=await GoogleTranslator().translate(word ,
  from: 'en',
  to:'ar'
  );
  return trans;
}