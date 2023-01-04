import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'VideoPlayerWidget.dart';
import 'flix22_vid_player.dart';

class AssetPlayerWidget7 extends StatefulWidget {
  @override
  _AssetPlayerWidget7State createState() => _AssetPlayerWidget7State();
}

class _AssetPlayerWidget7State extends State<AssetPlayerWidget7> {
  final asset = 'assets/videos/flix2.mp4';
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
                return AssetPlayerWidget8();
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
