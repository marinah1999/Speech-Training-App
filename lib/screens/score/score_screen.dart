import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/question_controller.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
              "assets/images/beautiful-color-ui-gradients-backgrounds-royal.png"),
          Column(
            children: [
              Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Great Job. \nNow Move on to the second exercise",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: kBlueLightColor),
                ),
              ),
              Spacer(flex: 1),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/main_ex_page');
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 40,
                    width: 250,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5), // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      "Go",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              // Text(
              //   "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline4
              //       .copyWith(color: kSecondaryColor),
              // ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
