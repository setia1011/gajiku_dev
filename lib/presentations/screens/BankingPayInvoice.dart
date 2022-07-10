import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/screens/BankingPaymentInvoice.dart';

import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class BankingPayInvoice extends StatefulWidget {
  @override
  _BankingPayInvoiceState createState() => _BankingPayInvoiceState();
}

class _BankingPayInvoiceState extends State<BankingPayInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
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
                      20.height,
                      Text(Banking_lbl_Pay_Voice, style: boldTextStyle(size: 30)),
                    ],
                  ),
                  10.height,
                  Text('Choose Provider', style: secondaryTextStyle()),
                  20.height,
                  Row(
                    children: <Widget>[
                      Text('Transfer Via', style: primaryTextStyle()).expand(),
                      const Icon(Icons.keyboard_arrow_right, size: 30, color: Banking_greyColor),
                    ],
                  ),
                  const Divider(height: 24),
                  EditText(text: Banking_lbl_Invitation_code, isPassword: false),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BankingButton(
              textContent: Banking_lbl_Next,
              onPressed: () {
                BankingPaymentInvoice().launch(context);
              },
            ),
          ).paddingOnly(bottom: 20, right: 10, left: 10),
        ],
      ),
    );
  }
}
