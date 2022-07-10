import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class BankingSavingSuccessful extends StatefulWidget {
  @override
  _BankingSavingSuccessfulState createState() => _BankingSavingSuccessfulState();
}

class _BankingSavingSuccessfulState extends State<BankingSavingSuccessful> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 25,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  16.height,
                  Text("Save\nSuccessful", style: boldTextStyle(size: 30)),
                ],
              ),
              16.height,
              Image.asset(Banking_ic_walk3, height: 250, width: width, fit: BoxFit.fill),
              8.height,
              Text(
                Banking_lbl_Successful_Detail,
                style: primaryTextStyle(color: Banking_TextColorSecondary, size: 18, fontFamily: fontRegular),
              ).center(),
              24.height,
              BankingButton(
                textContent: Banking_lbl_View_Saving,
                onPressed: () {
                  finish(context);
                  finish(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
