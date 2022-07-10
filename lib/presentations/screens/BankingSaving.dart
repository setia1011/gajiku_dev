import 'package:gajiku_dev/main.dart';
import 'package:gajiku_dev/presentations/model/GaModel.dart';
import 'package:gajiku_dev/presentations/screens/BankingAddNewSaving.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BankingSaving extends StatefulWidget {
  static var tag = "/BankingSaving";

  @override
  _BankingSavingState createState() => _BankingSavingState();
}

class _BankingSavingState extends State<BankingSaving> {
  late List<BankingSavingModel> savingList;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    super.initState();
    savingList = bankingSavingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              height: context.height(),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Text(Banking_lbl_Saving_Online, style: boldTextStyle(size: 32)),
                    30.height,
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        BankingSavingModel data = savingList[index % savingList.length];
                        return Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: boxDecorationWithShadow(
                            backgroundColor: context.cardColor,
                            boxShadow: defaultBoxShadow(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Banking_palColor),
                                padding: const EdgeInsets.all(16),
                                child: Image.asset(Banking_ic_piggyBank, height: 20, width: 20, fit: BoxFit.fill),
                              ).center(),
                              10.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title!, style: primaryTextStyle()),
                                  8.height,
                                  Text(data.rs!, style: primaryTextStyle(color: Banking_TextColorSecondary)),
                                  2.height,
                                  Text(data.interest!, style: secondaryTextStyle()),
                                ],
                              ).expand(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(data.date!, style: primaryTextStyle(color: Banking_TextColorSecondary)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: context.width(),
                padding: const EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                  backgroundColor: context.cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Banking_palColor),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.add, size: 20, color: Banking_whitePureColor),
                    ).center(),
                    10.width,
                    Text("Add New Savings", style: primaryTextStyle()).expand(),
                  ],
                ),
              ).onTap(() {
                BankingAddNewSaving().launch(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
