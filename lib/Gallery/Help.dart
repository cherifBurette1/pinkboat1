// import 'package:blog/item_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ItemModel {
  bool isExpanded;
  String header;
  BodyModel bodyModel;

  ItemModel({this.isExpanded: false, this.header, this.bodyModel});
}

class BodyModel {
  String answer;
  Widget quantity;

  BodyModel({this.answer, this.quantity});
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Help(),
  ));
}

class Help extends StatefulWidget {
  @override
  _Help createState() => _Help();
}

class _Help extends State<Help> {
  //   String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";
  // String second = "https://www.youtube.com/watch?v=fUv9gO8t8b4";

  // YoutubePlayerController _controller;
  // YoutubePlayerController _second;

  @override
  void initState() {
    // _controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(videoURL));
    // _second = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(second));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Help",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[400],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: prepareData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: Duration(seconds: 1),
              children: [
                ExpansionPanel(
                  body: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${prepareData[index].bodyModel.answer}',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          child: prepareData[index].bodyModel.quantity,
                        )
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        prepareData[index].header,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: prepareData[index].isExpanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  prepareData[index].isExpanded =
                      !prepareData[index].isExpanded;
                });
              },
            );
          },
        ),
      ),
    );
  }

  static _video() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=4euLdWN0n58")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video1() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=fUv9gO8t8b4")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video2() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=UBP9XoytYi4")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video3() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=idgGZLqzo4Y")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video4() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=wc8n4-kM-Qo")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video5() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=wc8n4-kM-Qo")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video6() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=_A8hetrhJDI")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video7() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=12_KNXBVDVY")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  static _video8() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=WMPdyk-wIAw")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }
    static _video77() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              controller: YoutubePlayerController(
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                  ),
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=9cu6vDTv2M0")),
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

  List<ItemModel> prepareData = <ItemModel>[
    ItemModel(
        header: 'About Us......',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video())),
    // no video
    ItemModel(
        header: 'How to create account in this application? ',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video77())),
    ItemModel(
        header: 'How to book a hospital visit?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video2())),

    ItemModel(
        header: 'How to book a screening test center reservation?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video3())),
    ItemModel(
        header: 'How to see the nearest awareness campaign?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video4())),
    ItemModel(
        header: 'How to see my booked reservations?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video5())),
    ItemModel(
        header: 'How to check my test result ?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video6())),
    ItemModel(
        header: 'How to change my password?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video7())),
    ItemModel(
        header: 'How to change my phone number?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video7())),
    ItemModel(
        header: 'How to check my notifications ?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video7())),
    ItemModel(
        header: 'How to change my email?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video8())),
    ItemModel(
        header: 'How to change my display picture?',
        bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video8())),
    // ItemModel(
    //     header: '', bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video1())),
    // ItemModel(
    //     header: '', bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video1())),
    // ItemModel(
    //     header: '', bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video1())),
    // ItemModel(
    //     header: '', bodyModel: BodyModel(answer: 'follow the video instuctions', quantity: _video1())),
  ];
}
