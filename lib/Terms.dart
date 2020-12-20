import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  final String description =
      " Welcome to PinkBoat !\n -Pinkboat© is a mobile application developed by some computer science senior students in 2019 at MTI university as their graduation project under the supervision of professor doctor Hesham El Deeb  \n -Pinkboat© helps you in finding the best place to get consultation or diagnosis for anything related to breast cancer and that's why Pinkboat© is not a substitute of any medical help on it's own\n -Pinkboat© users have the ultimate choice to wether they want to book a screening reservationor not it's a personal preference although it's always recommended to do a regular check-up \n-Active cancer screening can also detect breast diseases which are not cancer and may lead to further professional evaluation. This may incur anxiety and additional expenses \n-Pinkboat© is not responsible for any misbehavior from any of the doctors we are just here to help you to find a medical help in an easier way \n-if you have any problems using the app don't hesitate to contact us by calling 19041 \n-By accepting the conditions you agree that you are above 18 years old, You have read the terms and conditions, aware of the risks and benefits of this application and responsible for your own real life accidents .";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink[400],
        title: const Text("Terms of Services"),
        
      ),
      body: new Container(
        child: new DescriptionTextWidget(text: description),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
