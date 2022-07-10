import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/model/GaModel.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class BankingPaymentHistory extends StatefulWidget {
  static var tag = "/BankingPaymentHistory";

  @override
  _BankingPaymentHistoryState createState() => _BankingPaymentHistoryState();
}

class _BankingPaymentHistoryState extends State<BankingPaymentHistory> {
  late List<BankingPaymentHistoryModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingHistoryList1();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: spacing_standard_new,
            ),
            headerView(Banking_lbl_Payment_History, width * 0.4, context),
            Text("22 Feb 2021", style: secondaryTextStyle()).paddingOnly(
              left: spacing_standard_new,
              top: spacing_standard_new,
            ),
            const Divider().paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                      color: Banking_Primary,
                    ).paddingOnly(left: spacing_standard),
                    Text(mList1[index].title!, style: primaryTextStyle()).paddingSymmetric(horizontal: 8).expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        mList1[index].rs!,
                        style: primaryTextStyle(color: Banking_TextColorOrange, size: 16),
                      ).paddingOnly(left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard),
              ),
            ).paddingOnly(bottom: 8),
            Text("22 Mar 2021", style: secondaryTextStyle()).paddingSymmetric(horizontal: 8),
            const Divider().paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                      color: Banking_Primary,
                    ).paddingOnly(left: spacing_standard),
                    Text(mList1[index].title!, style: primaryTextStyle()).paddingSymmetric(horizontal: 8).expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        mList1[index].rs!,
                        style: primaryTextStyle(color: Banking_TextColorOrange, size: 16),
                      ).paddingOnly(left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard),
              ),
            ).paddingOnly(bottom: 8),
            Text(
              "22 Apr 2021",
              style: secondaryTextStyle(),
            ).paddingOnly(left: spacing_standard_new, top: spacing_standard_new),
            const Divider().paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                    child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 30,
                      color: Banking_Primary,
                    ).paddingOnly(left: spacing_standard),
                    Text(
                      mList1[index].title!,
                      style: primaryTextStyle(size: 16),
                    ).paddingSymmetric(horizontal: 8).expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        mList1[index].rs!,
                        style: primaryTextStyle(color: Banking_TextColorOrange, size: 16),
                      ).paddingOnly(left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard)),
              ),
            ).paddingOnly(bottom: 8)
          ],
        ),
      ),
    );
  }
}
