
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'editconfirm2.dart';
import 'package:flutterapp/common/apis.dart';
var session;
int i=0;
DateTime lol;
DateTime abovedate;
Color button1 = Colors.green[200];
Color button2 = Colors.green[200];
Color button3 = Colors.green[200];
Color button4 = Colors.green[200];
Color button5 = Colors.green[200];
Color button6 = Colors.green[200];
Color button7 = Colors.green[200];
Color button8 = Colors.green[200];
Color button9 = Colors.green[200];
Color button10 = Colors.green[200];

class EditHospTime extends StatefulWidget {
  @override
  _EditHospTimeState createState() => _EditHospTimeState();
}

class _EditHospTimeState extends State<EditHospTime> {
  List <dynamic> showtest;
  List <dynamic> originalShowtest;
    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
 
 
 await _handlehospreq();
  
      });
    
  }

  @override

  Widget build(BuildContext context) {
    DateTime  selectedDate = ModalRoute.of(context).settings.arguments;
    DateTime newdatee = selectedDate;
        if(newdatee==null){
setState(() {
  lol=DateTime.now();
});
}else{
  setState(() {
      lol=newdatee;
    });

}

   return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[400],
          title: Text(
            'Pick a time',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              // fontFamily: Utils.ubuntuRegularFont
            ),
          ),
        centerTitle: true,
           leading: FlatButton(onPressed: (){
              _destructor();
            Navigator.pop(context);
          }, child: Icon(  
            Icons.arrow_back,
            color: Colors.white
          ), ),
        ),
             body:ListView(
          
          children:<Widget>[
                Column(
                  children: <Widget>[
                    Container(
                     child: SingleChildScrollView(
                    child:Column(
                      children: <Widget>[
                        SizedBox(height:20),
                          Container(child: 
                       Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Text("Not Available"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Text('Available ')
              ],
            ),
                ),
               SizedBox(height:100),
           
              showtest!=null?
               Column(children:<Widget>[
     ...showtest.map<Widget>((item) {
   
  
                return _checkstate (
                  item,
                  // item["medical_org"]["pic_url"],
                  // item["medical_org"]["name"],
                  // item["medical_org"]["address"],
                );
              }).toList(),
                ]):
                Center(child: Text(" "),),
              
             
 
                 
          
              
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
       FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button1),
    child: Center(
      child:Text("9:00 AM"),
    ),
  ),onPressed: (){
     if(button1==Colors.green[200]){
       _destructor();
      setState(() {
      
        abovedate=new DateTime (lol.year,lol.month,lol.day,9,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
     FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button2),
    child: Center(
      child:Text("10:00 AM"),
    ),
  ),onPressed: (){ if(button2==Colors.green[200]){
     _destructor();
      setState(() {
        
        abovedate=new DateTime (lol.year,lol.month,lol.day,10,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }},),
       FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button3),
    child: Center(
      child:Text("11:00 AM"),
    ),
  ),onPressed: (){if(button3==Colors.green[200]){
       _destructor();
      setState(() {
       
        abovedate=new DateTime (lol.year,lol.month,lol.day,11,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }},),
     
    ]),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
       FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button4),
    child: Center(
      child:Text("12:00 PM"),
    ),
  ),onPressed: (){
    if(button4==Colors.green[200]){
      _destructor();
      setState(() {
       
        abovedate=new DateTime (lol.year,lol.month,lol.day,12,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) => Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
  
       FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button5),
    child: Center(
      child:Text("1:00 PM"),
    ),
  ),onPressed: (){
    if(button5==Colors.green[200]){
      _destructor();
      setState(() {
       
        abovedate=new DateTime (lol.year,lol.month,lol.day,13,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
      FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button6),
    child: Center(
      child:Text("2:00 PM"),
    ),
  ),onPressed: (){
    if(button6==Colors.green[200]){
      _destructor();
      setState(() {
        abovedate=new DateTime (lol.year,lol.month,lol.day,14,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
    ]),
    
    
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
   
        FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button7),
    child: Center(
      child:Text("3:00 PM"),
    ),
  ),onPressed: (){
    if(button7==Colors.green[200]){
        _destructor();
      setState(() {
         
        abovedate=new DateTime (lol.year,lol.month,lol.day,15,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) =>Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
        FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button8),
    child: Center(
      child:Text("4:00 PM"),
    ),
  ),onPressed: (){
    if(button8==Colors.green[200]){
       _destructor();
      setState(() {
          
        abovedate=new DateTime (lol.year,lol.month,lol.day,16,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) => Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
     FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button9),
    child: Center(
      child:Text("5:00 PM"),
    ),
  ),onPressed: (){
    if(button9==Colors.green[200]){
           _destructor();
      setState(() {
      
        abovedate=new DateTime (lol.year,lol.month,lol.day,17,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) => Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
    ]),
 Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children:<Widget>[
    
    
      FlatButton(child:Container(
    height:30,
    width:70,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(8.0),
    color: button10),
    child: Center(
      child:Text("6:00 PM"),
    ),
  ),onPressed: (){
    if(button10==Colors.green[200]){
        _destructor();
      setState(() {
        
        abovedate=new DateTime (lol.year,lol.month,lol.day,18,00);
              Navigator.push(
            context,new MaterialPageRoute(
                builder: (context) => Edithospconfirm(),settings: RouteSettings(arguments: abovedate,)));});
    
    }else{
        Fluttertoast.showToast(
        msg: "This is a reserved time slot you cant choose it" );
    }
  },),
     
    ]),
  
  ],
                    ),
                     ),
                    ),
                    
  
                  ],
                )
          ]),
            
        );
        
        
  
  }
    _checkstate(dynamic testitem){
      String time;
      if(testitem=="A"){
        time="A";
      }else{

  var _fromtime=DateTime.parse(testitem);
 var fromhour=_fromtime.hour.toString();
var fromminute=_fromtime.minute.toString();
time=fromhour+"-"+fromminute;
      }
debugPrint(time);

      switch (time) {
         case 'A':
          break;
        case '9-0':
        setState(() {
          button1=Colors.grey[400];
        });
          break;
   case '10-0':
        setState(() {
          button2=Colors.grey[400];
        });
          break;
   case '11-0':
        setState(() {
          button3=Colors.grey[400];
        });
          break;
            case '12-0':
        setState(() {
          button4=Colors.grey[400];
        });
          break;
            case '13-0':
        setState(() {
          button5=Colors.grey[400];
        });
          break;
                      case '14-0':
        setState(() {
          button6=Colors.grey[400];
        });
          break;
                      case '15-0':
        setState(() {
          button7=Colors.grey[400];
        });
          break;
                       case '16-0':
        setState(() {
          button8=Colors.grey[400];
        });
          break;
                       case '17-0':
        setState(() {
          button9=Colors.grey[400];
        });
          break;
                          case '18-0':
        setState(() {
          button10=Colors.grey[400];
        });
          break;
                        
      }
      
      return SizedBox(
   
      );
    }
  /*  _handletest() async{
      var data=  {
"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaXRpemVuIjoiY2l0aXplbiIsImlhdCI6MTU4NTk1MjQ0MH0.JQrEWk-NKo5a-B6n78GeypjZeQy8NfcTutYG85rsGTo",
"testCenter_id": "5e73ee7fd340f50017ad1cd3",
"date":aa.year.toString()+"-"+aa.month.toString()+"-"+aa.day.toString()
};
       dynamic response = await Apis.showrtest(data);
      this.originalShowtest = response;
      setState(() {
        this.showtest= response;
      });
    }*/
_handlehospreq() async {
       var data=  {
"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaXRpemVuIjoiY2l0aXplbiIsImlhdCI6MTU4NjE5NTU3N30.prTfdQWh0N8jmJUtijUsKdTOgR5cYGQhS2nFb2HI7Wo",
"hospital_id": "5e8a28c51c57e3318c2d886e",
"date":lol.year.toString()+"-"+lol.month.toString()+"-"+lol.day.toString()+" 00:00:00Z"
};
       dynamic response = await  Apis.showtreatmentdayavail(data);
      this.originalShowtest = response;
      setState(() {
        this.showtest= response;
      });
    
}
_destructor(){
  setState(() {
button1 = Colors.green[200];
button2 = Colors.green[200];
button3 = Colors.green[200];
button4 = Colors.green[200];
button5 = Colors.green[200];
button6 = Colors.green[200];
button7 = Colors.green[200];
button8 = Colors.green[200];
button9 = Colors.green[200];
button10 = Colors.green[200];

  });
}
}