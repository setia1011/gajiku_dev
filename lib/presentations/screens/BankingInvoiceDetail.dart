import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaSlider.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class BankingInvoiceDetail extends StatefulWidget {
  static var tag = "/BankingInvoiceDetail";

  @override
  _BankingInvoiceDetailState createState() => _BankingInvoiceDetailState();
}

class _BankingInvoiceDetailState extends State<BankingInvoiceDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: spacing_standard_new),
            headerView(Banking_lbl_Pay_Voice, width * 0.34, context),
            Text(
              "Choose Account to Transfer",
              style: secondaryTextStyle(),
            ).paddingOnly(left: spacing_standard_new, top: spacing_standard_new),
            16.height,
            BankingSliderWidget(),
            Text(
              "Invoice Mar 2020",
              style: secondaryTextStyle(),
            ).paddingOnly(left: spacing_standard_new, top: spacing_standard_new),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("John Smith", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                const Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text(
                      "874 Cameron Road,NY,US",
                      style: primaryTextStyle(),
                    ).paddingOnly(right: spacing_standard_new, top: spacing_standard_new),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                const Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Code", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("#7783", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                const Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TimeService", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("25 Jan - 25 Feb", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                const Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount Transaction", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("\$200", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                const Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            16.height,
            BankingButton(textContent: Banking_lbl_Pay, onPressed: () {}).paddingAll(spacing_standard_new),
          ],
        ),
      ),
    );
  }
}
