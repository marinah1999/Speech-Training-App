import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          maximumSize: Size.fromWidth(double.infinity),
          shape: StadiumBorder(),
        ),
        child: FittedBox(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: widget.onClicked,
      );
}
