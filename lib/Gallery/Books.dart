import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Books extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
         PreferredSize(
          
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
             
         
            title: Text(
              "Books",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[200],
          ),
        ),body: 
    Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "Detective Agency series",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                   
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  "Alexander McCall",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://www.penguinrandomhouse.com/series/1LA/no-1-ladies-detective-agency-series');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fbooks%2F1.jpg?alt=media&token=c3fd91ba-0bb7-463a-b103-fda724d6a4d2"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "Mummy’s Lump",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                    
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  "lili peter",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://breastcancernow.org/information-support/publication/mummys-lump-bcc164');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fbooks%2F2.png?alt=media&token=01ea922a-98ee-4bbf-9151-5dbbd90738da"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "The C Word",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                    
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  " Lisa Lynch",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://www.goodreads.com/book/show/8096374-the-c-word');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fbooks%2F3.jpg?alt=media&token=6c0a81c9-46a4-4ae0-b76a-31ab07c8d8fe"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "it's all just rock and roll",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                  
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  "pella adward",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                   RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://www.amazon.co.uk/Its-all-just-rock-roll/dp/1533088357');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1526399232581-2ab5608b6336?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "B is for Breast Cancer",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                  
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  "Alex Jagger",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                              RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://www.amazon.com/Breast-Cancer-recovery-everything-beginners/dp/0349401349');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fbooks%2F5.jpg?alt=media&token=4814d005-9daa-4b71-bf6d-c4c96cfdc81e"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    "Emotional Support ",
                                    style: TextStyle(
                                        color: Color(0xffe6020a),
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                          child: Text(
                                        "4.3",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18.0,
                                        ),
                                      )),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          FontAwesomeIcons.solidStarHalf,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                      ),
                                     
                                    ],
                                  )),
                                ),
                                Container(
                                    child: Text(
                                  "Cordelia Galgutr",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                             RaisedButton(
                                  child: Text('read'),
                                  onPressed: () {
                                    launch(
                                        'https://www.amazon.com/Best-Sellers-Books-Emotional-Mental-Health/zgbs/books/11170');
                                  },
                                  color: Colors.pink[400],
                                  textColor: Colors.black,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fbooks%2F6.jpg?alt=media&token=a264eec7-b48e-4973-a3f7-f02df39d9fd5"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
