import 'package:flutter/material.dart';
import 'package:flutter_application_1/breath_videos/flix1_vid_player.dart';
import 'package:flutter_application_1/screens/welcome/welcome_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: '',
              body:
                  'befor we dive deeper into stuttring, how about we first learn a speech rechnique?',
              image: buildImage('assets/images/ebook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body:
                  'this technique, after sufficient practice can give you a boost in fluency',
              image: buildImage('assets/images/readingbook.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body: 'it\'s called flexible Rate',
              image: buildImage('assets/images/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body: 'let\'s begin with some syllable  Counting Practice',
              image: buildImage('assets/images/pngtree.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: '',
              body:
                  'select the correct number of syllables for the word shown on the screen',
              image: buildImage('assets/images/select.jpg'),
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
        MaterialPageRoute(builder: (_) => WelcomeScreen()),
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
