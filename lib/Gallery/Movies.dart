

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            "Movies",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
        ),
      ),
      body: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "The family stone ",
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
                                          "7.5",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "Bezucha ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=3lgcViU45Fs');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Fthe%20family%20stone.jpg?alt=media&token=4fdfd0a0-31e2-4105-ad39-29ab247abc61"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "Pieces of April ",
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
                                          "6.3",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "Peter Hedges",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=p4_nmB7PsOo');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Fpieces%20of%20april.png?alt=media&token=e6d834e0-3f6f-4935-ab9f-07f8b52bb54c"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "Living proof",
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
                                          "8.7",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "Michael Shaun Corby ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=vmgiG7Hp0N8');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Fliving%20proof.jpg?alt=media&token=729de9b3-bbf3-406f-96de-d9a6c2e509e7"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "Decoding Annie Parker",
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
                                          "7.3",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "peter albert",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=vmgiG7Hp0N8');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Fdecoding%20annie%20parker.png?alt=media&token=b2d391cb-71ef-4409-82df-3d881534c814"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "Five",
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
                                          "6.3",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "Bablo",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=vmgiG7Hp0N8');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Ffive.png?alt=media&token=a41a7528-c717-499d-801f-0792841ad363"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        child: Text(
                                      "Mondays at Racine",
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
                                          "7.3",
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
                                        Container(
                                            child: Text(
                                          "(321) \u00B7 0.9 mi",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18.0,
                                          ),
                                        )),
                                      ],
                                    )),
                                  ),
                                  Container(
                                      child: Text(
                                    "maxwell safi",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  RaisedButton(
                                    child: Text('watch'),
                                    onPressed: () {
                                      launch(
                                          'https://www.youtube.com/watch?v=vmgiG7Hp0N8');
                                    },
                                    color: Colors.pink[400],
                                    textColor: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                                    "https://firebasestorage.googleapis.com/v0/b/pinkboat-932f9.appspot.com/o/gallery%2Fmovies%2Fmonday.jpg?alt=media&token=b283aa7a-cd3d-4e54-a0b2-6a6e844d328f"),
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
