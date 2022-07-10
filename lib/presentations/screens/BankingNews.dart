import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/model/GaModel.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';

class BankingNews extends StatefulWidget {

  @override
  _BankingNewsState createState() => _BankingNewsState();
}

class _BankingNewsState extends State<BankingNews> {
  late List<BankingShareInfoModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingNewsList();
  }

  @override
  Widget build(BuildContext context) {
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
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text(Banking_lbl_News, style: boldTextStyle(size: 32)),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  decoration: boxDecorationWithShadow(
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: context.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cy Captial bank give a giftbox for new customers\nwho create account',
                        style: primaryTextStyle(),
                      ),
                      Image.asset(mList1[index].icon, height: 150, width: 150, fit: BoxFit.cover),
                      Text(Banking_lbl_Walk1SubTitle, style: secondaryTextStyle()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
