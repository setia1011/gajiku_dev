import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/model/GaModel.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class BankingHome1 extends StatefulWidget {
  static String tag = '/BankingHome1';

  @override
  BankingHome1State createState() => BankingHome1State();
}

class BankingHome1State extends State<BankingHome1> {
  int currentIndexPage = 0;
  int? pageLength;

  late List<BankingHomeModel> mList1;
  late List<BankingHomeModel2> mList2;

  @override
  void initState() {
    setStatusBarColor(Banking_palColor);
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
    mList1 = bankingHomeList1();
    mList2 = bankingHomeList2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 330,
              floating: false,
              pinned: true,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              backgroundColor: innerBoxIsScrolled ? Banking_Primary : context.cardColor,
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: Container(
                padding: const EdgeInsets.fromLTRB(16, 42, 16, 32),
                margin: const EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    const CircleAvatar(backgroundImage: AssetImage(Banking_ic_user1), radius: 24),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,Laura",
                          style: primaryTextStyle(color: Banking_TextColorWhite),
                        ),
                        Text(
                          "How are you today?",
                          style: primaryTextStyle(color: Banking_TextColorWhite),
                        ),
                      ],
                    ).expand(),
                    const Icon(Icons.notifications, size: 30, color: Banking_whitePureColor)
                  ],
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topLeft,
                          colors: <Color>[Banking_Primary, Banking_palColor],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 80, 16, 8),
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: defaultBoxShadow(),
                        backgroundColor: context.cardColor,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: PageView(
                              children: const [
                                TopCard(name: "Default Account", acno: "1234567899", bal: "\$12,500"),
                                TopCard(name: "Adam Johnson", acno: "9874563210", bal: "\$18,000"),
                                TopCard(name: "Ana Willson", acno: "5821479630", bal: "\$12,500"),
                              ],
                              onPageChanged: (value) {
                                setState(() => currentIndexPage = value);
                              },
                            ),
                          ),
                          8.height,
                          Align(
                            alignment: Alignment.center,
                            child: DotsIndicator(
                              dotsCount: 3,
                              position: currentIndexPage.toDouble(),
                              decorator: const DotsDecorator(
                                size: Size.square(8.0),
                                activeSize: Size.square(8.0),
                                color: Banking_view_color,
                                activeColor: Banking_TextColorPrimary,
                              ),
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: Banking_Primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.payment, color: Banking_TextColorWhite, size: 24),
                                    10.width,
                                    Text('Payment', style: boldTextStyle(color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                              10.width,
                              Container(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: Banking_Primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Banking_ic_Transfer, color: Banking_TextColorWhite),
                                    10.width,
                                    Text('Transfer', style: boldTextStyle(color: Banking_TextColorWhite)),
                                  ],
                                ),
                              ).expand(),
                            ],
                          ).paddingAll(16)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recently Transaction", style: primaryTextStyle()),
                    4.height,
                    Text("22 Feb 2020", style: secondaryTextStyle()),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(
                        8,
                        backgroundColor: context.cardColor,
                        spreadRadius: 0,
                        blurRadius: 0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.account_balance_wallet, size: 24, color: mList1[index].color),
                          10.width,
                          Text(
                            '${mList1[index].title}',
                            style: primaryTextStyle(size: 16, color: mList1[index].color, fontFamily: fontMedium),
                          ).expand(),
                          Text(mList1[index].bal!, style: primaryTextStyle(color: mList1[index].color, size: 16)),
                        ],
                      ),
                    );
                  },
                ),
                16.height,
                Text(
                  "22 Feb 2020",
                  style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary, fontFamily: fontRegular),
                ),
                const Divider(),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    BankingHomeModel2 data = mList2[index % mList2.length];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      decoration: boxDecorationRoundedWithShadow(
                        8,
                        backgroundColor: context.cardColor,
                        spreadRadius: 0,
                        blurRadius: 0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            data.icon!,
                            height: 24,
                            width: 24,
                            color: index == 2 ? Banking_Primary : Banking_Primary,
                          ),
                          10.width,
                          Text(data.title!, style: primaryTextStyle()).expand(),
                          Text(data.charge!, style: primaryTextStyle(color: data.color, size: 16))
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
