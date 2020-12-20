import 'package:flutter/material.dart';
import '../common/apis.dart';
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          'Account Details',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            // fontFamily: Utils.ubuntuRegularFont
          ),
        ),
        centerTitle: true,
      ),
       body:SingleChildScrollView(child: Column(children: <Widget>[ _UserData()
       ,_myListView(),
             
       ]),
    )
    );
  }
   _myListView() {
     DateTime dob=DateTime.parse(Apis.dob);
     return Container(
       height:500,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
        
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
     
   Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
        
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text(
            'National Id',
            style: TextStyle(
              color: Color(0xFF00B6F0),
              fontSize: 20,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Text(
              Apis.national,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
       SizedBox(height: 7,), ],),
   ),
   SizedBox(height:5),
     Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
      
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
          Row(children: <Widget>[
          Text(
            'Date of birth: ',
            style: TextStyle(
              color: Color(0xFF00B6F0),
              fontSize: 20,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
         Container(width:200,
           child:
            Text(
              dob.day.toString()+"/"+dob.month.toString()+"/"+dob.year.toString(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            ),
          
          ],
        ),
      SizedBox(height: 7,), ],),
   ),
          Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
       
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text(
            'Email',
            style: TextStyle(
              color: Color(0xFF00B6F0),
              fontSize: 20,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Container(width:200,
           child:
            Text(
             Apis.email,
              style: TextStyle(
                color: Colors.grey,
                fontSize:20,
              ),
            ),
            ),
      
          ],
        ),
          SizedBox(height: 7,),   ],),
   ),
        SizedBox(
          height: 5,
        ),    Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
     
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          Text(
            'Phone: ',
            style: TextStyle(
              color: Color(0xFF00B6F0),
              fontSize: 20,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
            Text(
              Apis.phone,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            
          ],
        ),   
          SizedBox(height: 7,), ],),
   ),
       SizedBox(
          height: 5,
        ),
    Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
      decoration: BoxDecoration(
        
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: <Widget>[
          Row(children: <Widget>[
          Text(
            'Address: ',
            style: TextStyle(
              color: Color(0xFF00B6F0),
              fontSize: 20,
            ),
          ),
        ]),
        Row(
          children: <Widget>[
         Container(width:200,
           child:
            Text(
              Apis.street+", "+Apis.area+", "+Apis.city??"no address available",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            ),
          
          ],
        ),
      SizedBox(height: 7,), ],),
   ),

        
       
    
      ]),
    );
         

    }
    _UserData() {
    return Container(
      height: 200,
      width: 250,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 130,
              width: 130,
             
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(_checkpicstate()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(70),
                  border: Border.all(
                      color: Colors.pinkAccent.withOpacity(.2), width: 1)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            Apis.first_name + " " + Apis.middle_name + " " + Apis.last_name,
            style: TextStyle(color: Color(0xFF00B6F0), fontSize: 20),
          ))
        ],
      ),
    );
  }
  
  _checkpicstate() {
   
  String pic;
   if (Apis.pic==""){
   pic="https://www.freeiconspng.com/uploads/female-icon-23.png";
   }else{
     pic=Apis.pic;
   }
   return pic;
  }
}





