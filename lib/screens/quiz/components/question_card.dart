import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/question_controller.dart';
import 'package:flutter_application_1/models/Questions.dart';
import 'package:get/get.dart';
import '../../../constant.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question1,
  }) : super(key: key);

  final Question question1;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question1.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question1.options.length,
            (index) => Option(
              index: index,
              text: question1.options[index],
              press: () => _controller.checkAns(question1, index),
            ),
          ),
        ],
      ),
    );
  }
}
