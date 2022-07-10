import 'package:gajiku_dev/main.dart';
import 'package:gajiku_dev/presentations/screens/GaSignIn.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GaWalkThrough extends StatefulWidget {
  @override
  _GaWalkThroughState createState() => _GaWalkThroughState();
}

class _GaWalkThroughState extends State<GaWalkThrough> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [Banking_lbl_Walk1Title, Banking_lbl_Walk2Title, Banking_lbl_Walk3Title];

  var subTitles = [Banking_lbl_Walk1SubTitle, Banking_lbl_Walk1SubTitle, Banking_lbl_Walk1SubTitle];

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Banking_palColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              children: const [
                WalkThrough(textContent: Banking_ic_walk1),
                WalkThrough(textContent: Banking_ic_walk2),
                WalkThrough(textContent: Banking_ic_walk3),
              ],
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
            ),
          ),
          Positioned(
            width: context.width(),
            bottom: context.height() * 0.38,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage], style: boldTextStyle(size: 20)),
                  10.height,
                  // Adding Button
                ],
              ),
            ),
          ),
          Positioned(
            width: context.width(),
            height: 50,
            top: context.height() * 0.58,
            child: Align(
              alignment: Alignment.center,
              child: DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage.toDouble(),
                decorator: const DotsDecorator(color: Banking_view_color, activeColor: Banking_Primary),
              ),
            ),
          ),
          Positioned(
            width: context.width(),
            top: context.height() * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      subTitles[currentIndexPage],
                      style: primaryTextStyle(fontFamily: fontRegular, size: 14, color: Banking_TextColorSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  50.height,
                  // Adding Button
                  BankingButton(
                    textContent: Banking_lbl_Get_Started,
                    onPressed: () {
                      // finish(context);
                      GaSignIn().launch(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  const WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            width: context.width(),
            height: 350,
            alignment: Alignment.center,
            child: Image.asset(textContent, width: 300, height: 300),
          ),
        ),
      ],
    );
  }
}
