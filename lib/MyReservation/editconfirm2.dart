import 'package:flutter/material.dart';
import 'package:flutterapp/home.dart';
import 'package:flutterapp/common/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'my_res.dart';
import 'editres2.dart';
DateTime finaldate;
class Edithospconfirm extends StatefulWidget {
  @override
  _EditconfirmhospState createState() => _EditconfirmhospState();
}

class _EditconfirmhospState extends State<Edithospconfirm> {
  @override
  Widget build(BuildContext context) {
        DateTime  selectedDate = ModalRoute.of(context).settings.arguments;
    DateTime newdate = selectedDate;
    setState(() {
      finaldate=newdate;
    });
   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'Confirmation',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
        centerTitle: true,
           leading: FlatButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(  
            Icons.arrow_back,
            color: Colors.white
          ), ),
        ),
        body:ListView(
            children: <Widget>[
          _confirmWidget(),
            ]
        ),
  
    );
  }
  _confirmWidget(){
     return Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 20, right: 20, top: 8),
          height:550,
          
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
          child:
        Column(
          children: <Widget>[
           SizedBox(
                        height: 8,
                      ),
           Row(
          children:<Widget>[ 
            Text('hospital Name: ',style: TextStyle(color: Colors.black,fontSize: 24,),),]),
          Row(
              children: <Widget>[
                Container(width:300,
             child:Text(hosnameedit,style: TextStyle(color: Colors.grey,fontSize: 24,),),),
          ],),
               SizedBox(
                        height: 8,
                      ),
                      Row(
          children:<Widget>[ 
            Text('Date: ',style: TextStyle(color: Colors.black,fontSize: 24,),),]),
                      Row(
              children: <Widget>[
                 weekday(finaldate),
                 SizedBox(width: 7,),
             Text(finaldate.day.toString()+"/"+finaldate.month.toString()+"/"+finaldate.year.toString(),style: TextStyle(color: Colors.grey,fontSize: 24,),),
          ],),
                SizedBox(
                        height: 8,
                      ),
          Row(
          children:<Widget>[ 
            Text('Time: ',style: TextStyle(color: Colors.black,fontSize: 24,),),]),
          Row(
              children: <Widget>[
           _reformattime(finaldate),
],),
                SizedBox(
                        height: 8,
                      ),
    
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                     
                          FlatButton(onPressed:(){
                                Navigator.push(context,new MaterialPageRoute(builder: (context) => EdithospReservation(),));
                          },child: Text("Edit",style: TextStyle(color: Colors.pink[400],fontSize: 20,),),
                          ),
                        
                    
                        FlatButton(onPressed:(){},child: Text("Cancel",style: TextStyle(color: Colors.pink[400],fontSize: 20,),),
                        ),
                        ],
                      ),
                                SizedBox(
                        height: 190,
                      ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                        RaisedButton(onPressed:(){
                          _handlhedit();
                           Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
                        },color: Colors.pinkAccent,child: Text("          Submit         ",style: TextStyle(color: Colors.white,fontSize: 16,),),shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        ),
                      ],),
                       ]),
          );
 
        
  }
  _reformattime(DateTime fdate){
    String state="AM";
    int finall=fdate.hour;
    if(finall>12){
      finall=finall-12;
      setState(() {
        state="PM";
      });
    }else if(finall==12){
      setState(() {
        state="PM";
      });
    }
    return 
      Text(finall.toString()+":"+fdate.minute.toString()+" "+state,style: TextStyle(color: Colors.grey,fontSize: 24,),);
  }
  _handlhedit() async{
      var data=  {
"token":Apis.mytoken,
"reservation_id": xyz ,
"hospital_id": hosidedit,
"dateTime":finaldate.toString()+"Z"

};
       String response = await Apis.updatehreservation(data);
       debugPrint(response);
       if(response=="Reservation Updated"){
         return Fluttertoast.showToast(
        msg: "your reservation has been updated successfully" );
    }else{
      return   Fluttertoast.showToast(
        msg: response );
   
    }

  }
  weekday(DateTime fdate){
   switch (fdate.weekday.toString()) {
      case '1':
       return Text("Monday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;
        case '2':
       return Text("Tuesday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;
        case '3':
        return Text("Wednesday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;
        case '4':
        return Text("Thursday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);;
        break;
         case '5':
        return Text("Friday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;
         case '6':
        return Text("Saturday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;
        case '7':
        return Text("Sunday,",style: TextStyle(color: Colors.grey,fontSize: 24,),);
        break;

    }
    }
}
