

import 'package:flutter/material.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapp/home.dart';
import '../Widgets/sharedpref.dart';
import 'package:flutterapp/introPage.dart';
import 'RetrivePassword.dart';
import 'signUp/signup.dart';
SharedPreferences a;
bool checkBoxValue=false;
 /* woah() async {s
 final SharedPreferences  spref=await SharedPreferences.getInstance();
  if(a!=null){
  final SharedPreferences  spref1= a;
  
  //spref=spref1;
   await spref.setString('email', spref1.getString('email'));
      await spref.setString('fname', spref1.getString('fname'));
      await spref.setString('mname', spref1.getString('mname'));
      await spref.setString('lname', spref1.getString('lname'));
      await spref.setString('token', spref1.getString('token'));
      await spref.setString('pic', spref1.getString('pic'));
      await spref.setString('password', spref1.getString('password'));
      await spref.setString('street', spref1.getString('street'));
      await spref.setString('city', spref1.getString('city'));
      await spref.setString('area', spref1.getString('area'));
      await spref.setString('national_id', spref1.getString('national_id'));
      await spref.setString('id', spref1.getString('ids'));
      await spref.setString('dob', spref1.getString('dOB'));
      await spref.setString('phone', spref1.getString('phone'));
      print(spref.getString('token'));
      return spref;
  }else {
    return spref;
  
  }

  


}*/


String resp;
bool error;
String resp1;
bool error1;
bool nnn=false;






class SignIn extends StatefulWidget {

  @override
  
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  Color pink = Colors.pinkAccent;
  Color grey = Colors.black87;
 
  String _email;
  String _password;

  final _formKey = GlobalKey<FormState>();
  bool secured1 = true;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _loginFocusnode = FocusNode();

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        fontSize: 16.0);
  }

  @override
  void initState()  {
    super.initState();
    //checkIsLogin();
    // print('object ${getuserdata()['name']}');
  }




// Future<Null> checkIsLogin() async {
//      String fname="";
//       String mname="";
//       String lname ="";
//       String ids ="";
//       String token ="";
//       String emails="";
//       String pic_url="";
//       String password="";
//       String phone="";
//       String city="";
//       String street="";
//       String area="";
//       String national="";
//     String dOB ="";
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     token = prefs.getString("token");
//     emails=prefs.getString("email");
//     if (token != "" && token != null) {
//       print("alreay login.");
//       //your home page is loaded
//     Navigator.push(context,
//                         MaterialPageRoute(
//                             builder: (BuildContext ctx) => Home()));

//     }
//     else
//     {
//       //replace it with the login page
      
//       Navigator.push(context,
//                         MaterialPageRoute(
//                             builder: (BuildContext ctx) => SignIn()));
      
//     }
//   }
  Future<void> tokenCheck() async {
    WidgetsFlutterBinding.ensureInitialized();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString('token');
    // var nid = prefs.getString('nid');

    //   print(token);

    //   if (token != "" && token != null && nid != "" && nid != null)
    //     Navigator.pushNamed(context, "/home");
    //   //runApp(MaterialApp(home: email == null ? Login() : Home()));
    // }
  }



  handleSignIn(BuildContext context) async {
    //map for sign data
    var data = {
      "email": this._email,
      "password": this._password,
    };
    var response = await Apis.userSignIn(data);
    if (response['message'] == 'success') {
      final SharedPreferences prefs= await SharedPreferences.getInstance();
      String fname;
      String mname;
      String lname ;
      String ids ;
      String token ;
      String emails;
      String pic_url;
      String password;
      String phone;
      String city;
      String street;
      String area;
      String national;
    String dOB ;
            
              fname=response['citizen']['first_name'];
        mname=response['citizen']['middle_name'];
        lname=response['citizen']['last_name'];
        ids= response['citizen']['_id'];
        token=response['token'];
         emails=response['citizen']['email'];
         pic_url=response['citizen']["pic_url"]??"";
         password=response['citizen']["password"];
         phone=response['citizen']['phone']['phone'];
       city=response['citizen']['street']["area"]["city"]["name"];
         street= response['citizen']['street']["name"];
         area= response['citizen']['street']["area"]["name"];
         national= response['citizen']["national_id"];
         dOB= response['citizen']["birth_date"];
setshared(emails, token, password, pic_url, fname, lname, mname, national, ids, street, area, city, phone, dOB,checkBoxValue);
          
      // await prefs.setString('email', emails);
      // await prefs.setString('fname', fname);
      // await prefs.setString('mname', mname);
      // await prefs.setString('lname', lname);
      // await prefs.setString('token', token);
      // await prefs.setString('pic', pic_url);
      // await prefs.setString('password', password);
      // await prefs.setString('street', street);
      // await prefs.setString('city', city);
      // await prefs.setString('area', area);
      // await prefs.setString('national_id', national);
      // await prefs.setString('id', ids);
      // await prefs.setString('dob', dOB);
      // await prefs.setString('phone', phone);
       //await prefs.setBool('bool', true);

  // setState(() {
  //   spref.setString('email', prefs.getString('email'));
  //      spref.setString('fname', prefs.getString('fname'));
  //      spref.setString('mname', prefs.getString('mname'));
  //      spref.setString('lname', prefs.getString('lname'));
  //      spref.setString('token', prefs.getString('token'));
  //      spref.setString('pic', prefs.getString('pic'));
  //      spref.setString('password', prefs.getString('password'));
  //      spref.setString('street', prefs.getString('street'));
  //      spref.setString('city', prefs.getString('city'));
  //      spref.setString('area', prefs.getString('area'));
  //      spref.setString('national_id', prefs.getString('national_id'));
  //      spref.setString('id', prefs.getString('ids'));
  //      spref.setString('dob', prefs.getString('dOB'));
  //      spref.setString('phone', prefs.getString('phone'));
  //     print(spref.getString('token'));
  // });

      Apis.mytoken = response['token'];
      Apis.id = response['citizen']['_id'];
      Apis.first_name = response['citizen']['first_name'];
      Apis.middle_name = response['citizen']['middle_name'];
      Apis.pic=response['citizen']["pic_url"]??"";
      Apis.last_name = response['citizen']['last_name'];
    Apis.phone = response['citizen']['phone']['phone'];
      Apis.email = response['citizen']['email'];
      Apis.street = response['citizen']['street']["name"];
       Apis.area = response['citizen']['street']["area"]["name"];
          Apis.city = response['citizen']['street']["area"]["city"]["name"];
    Apis.national = response['citizen']["national_id"];
    Apis.dob = response['citizen']["birth_date"];
     Apis.password = response['citizen']["password"];
      // saveToken(
      //     response['token'].toString(), response['national_id'].toString());
Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => OnBoardingPage()));
      return prefs;
    } else { 
      if(response["message"]=="email doesn't exist"){
  setState(() {
        error1=false;
        resp1=response["message"];
        });
    } else
     if(response["message"]=="email not verified"){
  setState(() {
        error1=false;
        resp1=response["message"];
        });
    } else
     if(response["message"]=="incorrect password"){
  setState(() {
        error=false;
        resp1=response["message"];
        });
    } else
     if(response["message"]=="error signing in, try again"){
  setState(() {
        error1=false;
        resp1=response["message"];
        });
    }
     
      
    }
    
  }

handleerror(){

  if(error!=false)
                {
   return Row( children:<Widget>[
                 Center(child:
                
                 Text(" "),
                 
                   
                 
                 ),
                ]);
}
else{
  return Row( mainAxisAlignment:MainAxisAlignment.start,children:<Widget>[
                 Center(child:
                
                 Text(resp1,style: TextStyle(color: Colors.red[800]),),
                 
                   
                 
                 ),
                ]);
}
}
handleerror1(){

  if(error1!=false)
                {
   return Row( children:<Widget>[
                 Center(child:
                
                 Text(" "),
                 
                   
                 
                 ),
                ]);
}
else{
  return Row( mainAxisAlignment:MainAxisAlignment.start,children:<Widget>[
                 Center(child:
                
                 Text(resp1,style: TextStyle(color: Colors.red[800]),),
                 
                   
                 
                 ),
                ]);
}
}
  //osama
//  handleSignIn(BuildContext context) async {
//     //map for sign data
//     var data = {
//       "email": this._email,
//       "password": this._password,
//     };
//     var response = await Apis.userSignIn(data);
//     if (response['message'] == 'success') {
//       Apis.mytoken = response['token'];
//       Apis.id = response['citizen']['_id'];
//       Apis.first_name = response['citizen']['first_name'];
//       Apis.middle_name = response['citizen']['middle_name'];
//       Apis.pic=response['citizen']["pic_url"]??"";
//       Apis.last_name = response['citizen']['last_name'];
//     Apis.phone = response['citizen']['phone']['phone'];
//       Apis.email = response['citizen']['email'];
//       Apis.street = response['citizen']['street']["name"];
//        Apis.area = response['citizen']['street']["area"]["name"];
//           Apis.city = response['citizen']['street']["area"]["city"]["name"];
//     Apis.national = response['citizen']["national_id"];
//     Apis.dob = response['citizen']["birth_date"];
//      Apis.password = response['citizen']["password"];
//      Navigator.pushNamed(context, "/home");
//       // saveToken(
//       //     response['token'].toString(), response['national_id'].toString());
//      // SharedPreferences prefs = await SharedPreferences.getInstance();
//       //await prefs.remove('userGuest');
      
//     } else { 
//       if(response["message"]=="email doesn't exist"){
//   setState(() {
//         error1=false;
//         resp1=response["message"];
//         });
//     } else
//      if(response["message"]=="email not verified"){
//   setState(() {
//         error1=false;
//         resp1=response["message"];
//         });
//     } else
//      if(response["message"]=="incorrect password"){
//   setState(() {
//         error=false;
//         resp1=response["message"];
//         });
//     } else
//      if(response["message"]=="error signing in, try again"){
//   setState(() {
//         error1=false;
//         resp1=response["message"];
//         });
//     }
     
      
//     }
    
//   }

  saveToken(String token, String nid) async {
    //after the login REST api call && response code ==200
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    // prefs.setString('nid', nid);
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (BuildContext ctx) => Home()));
  }

  void fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget EmailInput() {
    return TextFormField(
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: this.pink, width: 1)),
        fillColor: this.pink,
        prefixIcon: Icon(
          Icons.email,
          color: this.pink,
        ),
        labelText: "Email",
        hintText: "e.g abc@gmail.com",
        // labelStyle: TextStyle(
        //   color:labelgrey
        // ),
        contentPadding: EdgeInsets.all(12.0), // Inside box padding
      ),
      textInputAction: TextInputAction.next,
      validator:(email) =>
      EmailValidator.validate(email) ? null : "Invalid email address",
     
      onSaved: (email) => _email = email,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
      },
    );
  }

  Widget PasswordInput() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      keyboardType: TextInputType.text,
      obscureText: secured1,
      decoration: InputDecoration(
          labelText: "Password",
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: this.pink, width: 1)),
          fillColor: this.pink,
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
            color: this.pink,
          )),
      textInputAction: TextInputAction.done,
      onSaved: (password) => _password = password,
    );
  }

  Container SubmitButton() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * (4 / 5),
      height: 45,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: RaisedButton(
        focusNode: _loginFocusnode,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          //side: BorderSide(color: Colors.red),
        ),
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        color: pink,
        // color: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            error=true;
            error=true;
             resp="";
            resp1="";
          });
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            // toastMessage(
            //     "Welcome $_first_name $_middle_name\nYou have been signed up");
          }
          handleSignIn(context);
        },
      ),
    );
  }

  Container CreateSigninForm(BuildContext context) {
    return (Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  EmailInput(),
                   SizedBox(
                    height: 2,
                  ),
                  handleerror1(),
                  PasswordInput(),
                  SizedBox(
                    height: 4,
                  ),
                  handleerror(),
                  SizedBox(
                    height: 5,
                  ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
        
     new Checkbox(value: checkBoxValue,
          activeColor: Colors.pink[400],
          onChanged:(bool newValue){
        setState(() {
          checkBoxValue = newValue;
        });
    
          }),
           Text('Remember me',style: TextStyle(
                          color: Colors.blue,
                        ),),
    ],
  ),
                  InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      //widthFactor: 10,
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () {

                        Navigator.push(context,
                         MaterialPageRoute(
                             builder: (BuildContext ctx) => RetrivePassword()));
                    }
                    /**Fluttertoast.showToast(
                        msg: "معلش",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 3,
                        fontSize: 80.0,
                        backgroundColor: Colors.black38,
                        textColor: Colors.white)**/,
                    splashColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  
                  SubmitButton(),
               
                  SizedBox(
                    height: 7,
                  ),
                  InkWell(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        //widthFactor: 1,
                        child: Text(
                          'Don\'t have an account? Signup',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      onTap: () {
                           Navigator.push(context,
                         MaterialPageRoute(
                             builder: (BuildContext ctx) => SignUp()));
                      }
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  
 @override


  Widget build(BuildContext context) {
    
    
    
    tokenCheck();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: this.pink,
          title: Text("Sign In"),
          actions: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(0),
              textColor: Colors.white70,
              onPressed: () {
                  Navigator.push(context,
                         MaterialPageRoute(
                             builder: (BuildContext ctx) => Home()));
              },
              child: Row(
                children: <Widget>[
                  Text("Skip"),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    tooltip: 'Skip',
                    onPressed: () async {
                    SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setString('userGuest', "Guest");
                       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ],
              ),
            )
          ]),
      //CustomHeader("sign In", false, null, Colors.pink[200]),
      body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child:Image(
                      image: AssetImage('assets/images/signIn.png'),
                      height: 200,
                      width: 400,
                    ),
                  ),
                ),
                CreateSigninForm(context)
              ],
            ),
          )),
    );
  }


}
 /** class RetrivePassword extends StatelessWidget {
    FocusNode _emailFocusNode = FocusNode();
    FocusNode _passwordFocusNode = FocusNode();
    String _email;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Retrive new PassWord')
   ,
    backgroundColor: Colors.pinkAccent
    ,
  ),
  body: Center(
  child: TextFormField(
    focusNode: _emailFocusNode,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.pink, width: 1)),
      fillColor: Colors.pink,
      prefixIcon: Icon(
        Icons.email,
        color: Colors.pink,
      ),
      labelText: "Email",
      hintText: "e.g abc@gmail.com",
      // labelStyle: TextStyle(
      //   color:labelgrey
      // ),
      contentPadding: EdgeInsets.all(12.0), // Inside box padding
    ),
    textInputAction: TextInputAction.next,
    validator: (email) =>
    EmailValidator.validate(email) ? null : "Invalid email address",
    onSaved: (email) => _email = email,
    onFieldSubmitted: (_) {
      fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
    },
  )
    /**RaisedButton(
  child: Text('Open route'),
  onPressed: () {
  // Navigate to second route when tapped.
  },
  )**/,
  ),
  );
  }
    void fieldFocusChange(BuildContext context, FocusNode currentFocus,
        FocusNode nextFocus) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

  }**/


