import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_ex_page.dart';

import 'package:video_player/video_player.dart';

import 'VideoPlayerWidget.dart';

class AssetPlayerWidget4 extends StatefulWidget {
  @override
  _AssetPlayerWidget4State createState() => _AssetPlayerWidget4State();
}

class _AssetPlayerWidget4State extends State<AssetPlayerWidget4> {
  final asset = 'assets/videos/breath4.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWidget(controller: controller),
        const SizedBox(height: 20),
        // if (controller != null && controller.value.isInitialized)
        // CircleAvatar(
        //   radius: 30,
        //   backgroundColor: Colors.red,
        // ),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MainExercisePage();
              }),
            );
          },
          child: Icon(Icons.arrow_forward_sharp),
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}
