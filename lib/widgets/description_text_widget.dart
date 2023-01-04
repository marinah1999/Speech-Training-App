import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenheight = ScreenUtil.defaultSize.height;
    final screenwidth = ScreenUtil.defaultSize.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
      child: Container(
          height: screenheight * 0.40,
          width: screenwidth * 0.95,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Text(
              "ONCE UPON A TIME a Wolf resolved to disguise his appearance in order to secure food more easily. Encased in the skin of a sheep, he pastured with the flock deceiving the shepherd by his costume. In the evening he was shut up by the shepherd in the fold; the gate was closed, and the entrance made thoroughly secure. But the shepherd, returning to the fold during the night to obtain meat for the next day, mistakenly caught up the Wolf instead of a sheep, and killed him instantly. he fell into his “evil deeds”",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )),
    );
  }
}
