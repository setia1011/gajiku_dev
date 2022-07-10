import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaProfileBloc.dart';
import 'package:gajiku_dev/main.dart';
import 'package:gajiku_dev/presentations/screens/GaChangePasword.dart';
import 'package:gajiku_dev/presentations/screens/GaProfileUpdate.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../bloc/GaProfileState.dart';


class GaProfile extends StatefulWidget {
  static var tag = "/BankingMenu";

  @override
  _GaProfileState createState() => _GaProfileState();
}

class _GaProfileState extends State<GaProfile> {
  String name = "";
  String idNumber = "";

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name").toString();
      idNumber = prefs.getString("id_number").toString();
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              16.height,
              Container(
                padding: const EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: context.cardColor,
                ),
                child: BlocConsumer<GaProfileBloc, GaProfileState>(
                  listener: (context, state) {
                    if (state is SentState) {
                      getPref();
                    }
                  },
                  builder: (context, state) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CircleAvatar(backgroundImage: AssetImage(Banking_ic_user1), radius: 40),
                        10.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            5.height,
                            Text(name, style: boldTextStyle(size: 18)),
                            5.height,
                            Text(idNumber, style: primaryTextStyle(color: Banking_TextColorSecondary)),
                            5.height,
                            Text(Banking_lbl_app_Name, style: secondaryTextStyle()),
                          ],
                        ).expand()
                      ],
                    );
                  },
                )
              ),
              16.height,
              const Text(
                  Ga_lbl_Profile,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  )
              ),
              16.height,
              Container(
                padding: const EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: context.cardColor,
                ),
                child: Column(
                  children: <Widget>[
                    bankingOption(Banking_ic_Setting, Ga_lbl_Update_Profile, Banking_BalanceColor).onTap(() {
                      const GaProfileUpdate().launch(context);
                    }),
                    bankingOption(Banking_ic_security, Banking_lbl_Change_Password, Banking_pinkColor).onTap(() {
                      GaChangePassword().launch(context);
                    }),
                  ],
                ),
              ),
              16.height,
              Container(
                padding: const EdgeInsets.all(8),
                decoration: boxDecorationWithShadow(
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: context.cardColor,
                ),
                child: Column(
                  children: <Widget>[
                    bankingOption(Banking_ic_Logout, Banking_lbl_Logout, Banking_pinkColor).onTap(
                          () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(),
                        );
                      },
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

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: appStore.isDarkModeOn ? Colors.black :  Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 10.0)),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        16.height,
        Text(Banking_lbl_Confirmation_for_logout, style: primaryTextStyle(size: 18)).onTap(() {
          finish(context);
        }).paddingOnly(top: 8, bottom: 8),
        const Divider(height: 10, thickness: 1.0, color: Banking_greyColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Cancel", style: primaryTextStyle(size: 18)).onTap(
                  () {
                finish(context);
              },
            ).paddingRight(16),
            Container(width: 1.0, height: 40, color: Banking_greyColor).center(),
            Text("Logout",
                style: primaryTextStyle(size: 18, color: Banking_Primary)).onTap(() {
                  logout() async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                  }
                  logout();
                  Navigator.of(context).pushNamed("/login");
              },
            ).paddingLeft(16)
          ],
        ),
        16.height,
      ],
    ),
  );
}
