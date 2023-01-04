import 'package:flutter/material.dart';
import 'package:flutter_application_1/breath_videos/flix2_vid_player.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              body: 'I am sure you are now well versed with syllables',
              image: buildImage('assets/images/char.jpeg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body:
                  'this will be a guided practice session with a voice to guide you through each example ',
              image: buildImage('assets/images/pngtree.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body:
                  'Speak aloud the text on the screen, streching the vowel sound in the first syllable of the words ',
              image: buildImage(
                  'assets/images/fluencia logo bidun kitabe (1).png'),
              decoration: getPageDecoration(),
            ),
          ],
          done:
              Text('Start Quiz', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AssetPlayerWidget7()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 24),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
