import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultButton extends StatefulWidget {
  @override
  State<ResultButton> createState() => _ResultButtonState();
}

class _ResultButtonState extends State<ResultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.0,
        width: 150,
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.purpleAccent,
          color: Colors.deepPurple,
          elevation: 15.0,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/result_page');
            },
            child: Center(
              child: Text(
                'See Your Results',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
          ),
        ));
  }
}
