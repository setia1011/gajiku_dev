import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';

class BankingContact extends StatefulWidget {
  @override
  _BankingContactState createState() => _BankingContactState();
}

class _BankingContactState extends State<BankingContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_Contact, style: boldTextStyle(size: 32)),
                ],
              ),
              20.height,
              Container(
                decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Headquarters', style: primaryTextStyle(size: 18)),
                    20.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Pin, height: 20, width: 20, color: Banking_palColor),
                        15.width,
                        Text('722 Canyon Street Plainfield', style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Call, height: 20, width: 20, color: Banking_RedColor),
                        15.width,
                        Text("+1-202-555-0123", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Website, height: 20, width: 20, color: Banking_pinkLightColor),
                        15.width,
                        Text("www.cycaptialbank.com", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Clock, height: 20, width: 20, color: Banking_BalanceColor),
                        15.width,
                        Text("08:00 - 17:00", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
              20.height,
              Container(
                decoration: boxDecorationWithShadow(backgroundColor: context.cardColor, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Branch 1", style: primaryTextStyle(size: 18)),
                    20.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Pin, height: 20, width: 20, color: Banking_palColor),
                        15.width,
                        Text("722 Canyon Street Plainfield", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Call, height: 20, width: 20, color: Banking_RedColor),
                        15.width,
                        Text("+1-202-555-0123", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Website, height: 20, width: 20, color: Banking_pinkLightColor),
                        15.width,
                        Text("www.cycaptialbank.com", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                    15.height,
                    Row(
                      children: [
                        Image.asset(Banking_ic_Clock, height: 20, width: 20, color: Banking_BalanceColor),
                        15.width,
                        Text("08:00 - 17:00", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
