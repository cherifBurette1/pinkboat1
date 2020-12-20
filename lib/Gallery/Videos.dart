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
    home: Videos(),
  ));
}

class Videos extends StatefulWidget {
  @override
  _Videos createState() => _Videos();
}

class _Videos extends State<Videos> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Text(
            "Videos",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
        ),
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Answer: ${prepareData[index].bodyModel.answer}',
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
                      padding: EdgeInsets.all(40),
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
                  prepareData[index].isExpanded =!prepareData[index].isExpanded;
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
                      "https://www.youtube.com/watch?v=jPtCkcILCGU")),
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
                      "https://www.youtube.com/watch?v=biTZmXL0Nu8")),
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
                      "https://www.youtube.com/watch?v=o0pnO_Qjb_Y")),
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
                      "https://www.youtube.com/watch?v=7M0vGdczgMc")),
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
                      "https://www.youtube.com/watch?v=wKW2ohCTwBM")),
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
        bodyModel: BodyModel(
            answer: 'here is a video that explains who are we',
            quantity: _video())),
    // no video
    ItemModel(
        header: 'Diagnosis and stages ',
        bodyModel: BodyModel(
            answer: 'check out the stages of breast cancer',
            quantity: _video1())),
    ItemModel(
        header: 'Self Examination',
        bodyModel: BodyModel(
            answer:
                'here is a video that shows you how to perform the self examination',
            quantity: _video2())),

    ItemModel(
        header: 'Exercises',
        bodyModel: BodyModel(
            answer:
                'here is a video that shows you some exercises that you should perform while fighting breast cancer',
            quantity: _video3())),
    ItemModel(
        header: 'Healing from breast cancer',
        bodyModel: BodyModel(
            answer: 'In this video A strong woman defeated the disease',
            quantity: _video5())),
    ItemModel(
        header: 'Awareness',
        bodyModel: BodyModel(
            answer: 'Is breast cancer a hereditary disease?',
            quantity: _video4())),
  ];
}
