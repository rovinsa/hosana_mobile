import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosanna/pages/welcome.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
// Properites

  List<Slide> slides = new List();

// on Done

  void onDonePress() {
    Get.off(Welcome());
  }

// init state

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "A digital platform to connect with your church/ministries",
        styleTitle: ColorTheme.mainHeading(ColorTheme.primaryColor),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s",
        pathImage: "assets/img/slide_one.png",
        backgroundColor: Colors.white,
        styleDescription: ColorTheme.bodyText(),
        maxLineTitle: 3,
        marginTitle: EdgeInsets.symmetric(vertical: 80, horizontal: 25),
        marginDescription: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 25,
        ),
      ),
    );
    slides.add(
      new Slide(
        title: "Access millions of songs and videos in one place",
        styleTitle: ColorTheme.mainHeading(ColorTheme.primaryColor),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s",
        pathImage: "assets/img/slide_two.png",
        backgroundColor: Colors.white,
        styleDescription: ColorTheme.bodyText(),
        maxLineTitle: 3,
        marginTitle: EdgeInsets.symmetric(vertical: 80, horizontal: 25),
        marginDescription: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 25,
        ),
      ),
    );
    slides.add(
      new Slide(
        title: "Get updates from church/ministries and request for prayers",
        styleTitle: ColorTheme.mainHeading(ColorTheme.primaryColor),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s",
        pathImage: "assets/img/slide_three.png",
        backgroundColor: Colors.white,
        styleDescription: ColorTheme.bodyText(),
        maxLineTitle: 3,
        marginTitle: EdgeInsets.symmetric(vertical: 80, horizontal: 25),
        marginDescription: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: 25,
        ),
      ),
    );
  }

// Build
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      renderDoneBtn: renderDoneBtn(),
      renderNextBtn: renderNextBtn(),
      renderPrevBtn: renderPrevBtn(),
      backgroundColorAllSlides: Colors.white,
      colorActiveDot: ColorTheme.primaryColor,
      isShowPrevBtn: true,
      isShowSkipBtn: false,
      colorDot: Colors.grey[300],
    );
  }

// Custom Widgets

  Widget renderNextBtn() {
    return Container(
      width: 40,
      child: Text(
        'Next',
        style: ColorTheme.secondaryHeading(),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget renderPrevBtn() {
    return Container(
      width: 68,
      child: Text(
        'Previous',
        style: ColorTheme.secondaryHeading(),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget renderDoneBtn() {
    return Container(
      width: 40,
      child: Text(
        'Done',
        style: ColorTheme.secondaryHeading(),
        textAlign: TextAlign.right,
      ),
    );
  }
}
