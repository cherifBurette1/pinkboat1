  import 'package:flutter/material.dart';
  import 'package:settings_ui/settings_ui.dart';
  import 'package:flutterapp/Widgets/sharedpref.dart';
  bool not0;
 bool not1;
  bool not2;
   bool not3;
    bool not4;
     bool not5;
  class Notification_Settings extends StatefulWidget {
  @override
  _Notification_SettingsState createState() => _Notification_SettingsState();
  }


  class _Notification_SettingsState extends State<Notification_Settings> {
    @override
    Widget build(BuildContext context) {


  return Scaffold(
  appBar: AppBar(
  title: Text(' Notification Settings '),
  backgroundColor: Colors.pink[400],
  ),
  body:


  SettingsList(
  sections: [


 
        SettingsSection(
        title: ' In-App Notification',
        tiles: [

        SettingsTile.switchTile(title: 'Push Notification',
        onToggle: (bool value) {}, switchValue: true) ,
        SettingsTile.switchTile(title: 'Screening Result Notification',
        subtitle: 'Notify you when a screening result is added for you',
        onToggle: (bool value) async{
          if(value==true){
          not0=false;
         await setboolnof0(value);
          }else{
          not0=true;
         await setboolnof0(value);  
          }
        }, switchValue: not0) ,

        SettingsTile.switchTile(title: 'Sample Result Notification',
        subtitle: 'Notify you when a sample result is added for you',
        onToggle: (bool value) async {
          if(value==true){
          not1=false;
          await setboolnof1(value);
          }else{
          not1=true;
          await setboolnof1(value);  
          }
        }, switchValue: not1) ,

        SettingsTile.switchTile(title: 'Screening Reservation Notification',
        subtitle: 'Notify you 2 days before you screening reservation',
        onToggle: (bool value) async{
          if(value==true){
          not2=false;
         await setboolnof2(value);
          }else{
          not2=true;
         await setboolnof2(value);  
          }
        }, switchValue: not2) ,

        SettingsTile.switchTile(title: 'Treatment Reservation Notification',
        subtitle: 'Notify you 2 days before you treatment reservation',
        onToggle: (bool value) async{
          if(value==true){
          not3=false;
         await setboolnof3(value);
          }else{
          not3=true;
          await setboolnof3(value);  
          }
        }, switchValue: not3) ,

        SettingsTile.switchTile(title: 'Chemo session Reminder Notification',
        subtitle: 'Notify you 2 days before your chemo session',
        onToggle: (bool value)async {
          if(value==true){
          not4=false;
          await setboolnof4(value);
          }else{
          not4=true;
          await setboolnof4(value);  
          }
        }, switchValue: not4) ,

        SettingsTile.switchTile(title: 'Medication Reminder Notification',
        subtitle: 'remind you daily 30 mins before your medication time',
        onToggle: (bool value) async {
           if(value==true){
          not5=false;
          await setboolnof5(value);
          }else{
          not5=true;
          await setboolnof5(value);  
          }
        }, switchValue: not5) ,

        SettingsTile.switchTile(title: 'Testing Campaigns Notification',
        subtitle: 'Notify you 1 week before the start of you testing campaigns of your phase',
        onToggle: (bool value) {}, switchValue: true) ,

        SettingsTile.switchTile(title: 'Awareness Campaigns Notification',
        subtitle: 'Notify you 5 days before any awareness campaign in your city',
        onToggle: (bool value) {}, switchValue: true) ,

   ],
   ),
  ]
  )

  ); 




    }}








