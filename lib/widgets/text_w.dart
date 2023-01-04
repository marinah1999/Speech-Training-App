import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class w extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenheight = ScreenUtil.defaultSize.height;
    final screenwidth = ScreenUtil.defaultSize.width;

    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 120, 30, 40),
        child: SingleChildScrollView(
          child: Text(
            'Please press the button below.  \nstart recording the text out loud until its over',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, color: Colors.purple[100]),
          ),
        ));
  }
}
