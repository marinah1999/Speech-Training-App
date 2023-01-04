import 'package:flutter/material.dart';

import '../widgets/cat.dart';
import 'details_screen.dart';
import '../breath_videos/intro_vid_player.dart';
import 'onboarding_page2.dart';
import 'onboarding_page3.dart';
import 'onboarding_page_tongue.dart';

class MainExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .65,
            decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hey! \nWelcome to Fluencia\nlet\'s start practicing.",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Introduction",
                          Assetimage:
                              "assets/images/fluencia logo bidun kitabe (1).png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AssetPlayerWidget5();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Breath & Relax",
                          Assetimage: "assets/images/vector (1).jpg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "tongue Exercise",
                          Assetimage:
                              "assets/images/WhatsApp Image 2022-02-04 at 1.15.53 AM (1).jpeg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return OnBoardingPage1();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "syllable count",
                          Assetimage:
                              "assets/images/WhatsApp Image 2022-02-04 at 1.43.32 AM.jpeg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return OnBoardingPage2();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Flexible Rate practice",
                          Assetimage: "assets/images/flix.jpeg",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return OnBoardingPage4();
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
