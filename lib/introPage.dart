import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    // return MaterialApp(
    //   title: 'Introduction screen',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.pink[300]),
    //   home: OnBoardingPage(),
    // );

    return OnBoardingPage();
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Home()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: const Color(0xFFFF4081),
            imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Find the nearest testing centers and hospital",
          body:
              "the app helps you in finding the nearest testing centers and hospital",
           image: Image.asset('assets/images/hospital.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Find the nearest testing awarness campaigns",
          body: "the app helps you in finding the nearest awarness campaigns",
          image: Image.asset('assets/images/nearestLocation.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "instant delivery of test results and reports",
          body:
              "the app gives you the opportunity to check your test results through your phone",
          image: Image.asset('assets/images/result.png'),
          /*footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ), */
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "keep up with your treatment plan",
          body: "check your treatment plan and your progress",
          /* bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),*/
          image: Image.asset('assets/images/treatmentplan.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "check your sessions' schedule",
          body: "keep up with you sessions' schedule ",
          image: Image.asset('assets/images/schedule.png'),
          decoration: pageDecoration,
        ),
         PageViewModel(
          title: "personal account",
          body: "check out the reservation, medical profile ",
          image: Image.asset('assets/images/profile.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: TextStyle(color: Colors.white)),
      next: const Icon(Icons.arrow_forward, color: Colors.white),
      done: const Text('Done',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 5.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(10.0, 10.0),
        activeColor: Colors.lightBlue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
      ),
    );
  }
}
