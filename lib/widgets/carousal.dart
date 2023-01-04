import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousel extends StatelessWidget {
  final List<Widget> items = [
    Center(
        child: Image.asset(
      'images/53271171.jpg',
      fit: BoxFit.fill,
    )),
    Center(
        child: Image.asset(
      'images/istockphoto-1266582678-170667a.jpg',
      fit: BoxFit.fill,
    )),
    Center(child: Image.asset('images/istockphoto-1131186254-612x612.jpg')),
    Center(child: Image.asset('images/chat.jpg')),
    Center(
        child: Image.asset(
            'images/why-do-you-need-online-reputation-management.png')),
    Center(child: Image.asset('images/istockphoto-1266582678-170667a.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        width: double.infinity,
        height: ScreenUtil.defaultSize.height * 0.40,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CarouselSlider(
          options: CarouselOptions(
            scrollPhysics: ClampingScrollPhysics(),
            autoPlayAnimationDuration: Duration(seconds: 5),
            autoPlay: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 5),
          ),
          items: items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: i,
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
