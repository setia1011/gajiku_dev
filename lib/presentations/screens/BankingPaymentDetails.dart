import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/model/GaModel.dart';
import 'package:gajiku_dev/presentations/screens/BankingPayInvoice.dart';
import 'package:gajiku_dev/presentations/screens/BankingPaymentHistory.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';

// ignore: must_be_immutable
class BankingPaymentDetails extends StatefulWidget {
  String? headerText;

  BankingPaymentDetails({this.headerText});

  @override
  _BankingPaymentDetailsState createState() => _BankingPaymentDetailsState();
}

class _BankingPaymentDetailsState extends State<BankingPaymentDetails> {
  late List<BankingPaymentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = clientProjectList();
  }

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
                    size: 25,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  16.height,
                  Text(
                    widget.headerText!,
                    style: boldTextStyle(size: 30, color: appStore.isDarkModeOn ? white : Banking_TextColorPrimary),
                  ),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    decoration: boxDecorationWithShadow(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: context.cardColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(16),
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(30),
                            backgroundColor: Banking_Primary,
                          ),
                          child: Image.asset(
                            mList[index].img!,
                            height: 20,
                            width: 20,
                            color: Banking_whitePureColor,
                          ),
                        ).paddingAll(spacing_standard),
                        Text(mList[index].title!, style: primaryTextStyle()),
                      ],
                    ),
                  ).onTap(
                    () {
                      if (index == 0) {
                        BankingPayInvoice().launch(context);
                      } else {
                        BankingPaymentHistory().launch(context);
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
