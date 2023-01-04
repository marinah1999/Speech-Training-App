import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main_ex_page.dart';

class OnBoardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: ' Tongue In-and-Outs',
              body:
                  'Stick your tongue out and hold it for 2 seconds, then pull it back in. Hold for 2 seconds, and repeat. This helps train your tongue to move with coordinated patterns, which will help you produce better speech.',
              image: buildImage('assets/images/inout.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: ' Tongue Side-to-Side',
              body:
                  'open your mouth and move your tongue to touch the right corner of your mouth. Hold for 2 seconds, then touch the left corner of your mouth. Hold for 2 seconds, and repeat.',
              image: buildImage('assets/images/side.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Tongue Up-and-Down',
              body:
                  'Open your mouth and stick your tongue out. Then, reach your tongue up toward your nose. Hold for 2 seconds, then reach your tongue down toward your chin. Hold for 2 seconds, and repeat.',
              image: buildImage('assets/images/updown.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Say Cheese!',
              body:
                  'Practice smiling in front of a mirror. Smile, then relax. Repeat as much as you can stand.',
              image: buildImage('assets/images/manthumbs.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: ' Practice Your Kissy Face',
              body:
                  ', try making kissy faces by puckering your lips. Pucker your lips together, then relax. Repeat as often as you can. You should slow down the movement for even better control.',
              image: buildImage('assets/images/boy.jpeg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
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
        MaterialPageRoute(builder: (_) => MainExercisePage()),
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
