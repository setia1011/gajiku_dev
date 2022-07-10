import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/BankingPayment.dart';
import 'package:gajiku_dev/presentations/screens/BankingSaving.dart';
import 'package:gajiku_dev/presentations/screens/BankingTransfer.dart';
import 'package:gajiku_dev/presentations/screens/GaProfile.dart';
import 'package:gajiku_dev/presentations/screens/GaClientHome.dart';
import 'package:gajiku_dev/presentations/utils/GaBottomNavigationBar.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaImages.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GaAdminHome.dart';

class GaClient extends StatefulWidget {

  @override
  _GaClientState createState() => _GaClientState();
}

class _GaClientState extends State<GaClient> {

  var selectedIndex = 0;
  var pages = [
    GaClientHome(),
    BankingTransfer(),
    BankingPayment(),
    BankingSaving(),
    GaProfile(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  void dispose() {
    setStatusBarColor(white);
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BankingBottomNavigationBar(
        selectedItemColor: Banking_Primary,
        unselectedItemColor: Banking_greyColor.withOpacity(0.5),
        items: const <BankingBottomNavigationBarItem>[
          BankingBottomNavigationBarItem(icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
          BankingBottomNavigationBarItem(icon: Banking_ic_Transfer, title: Text(Gajiku_lbl_client_project)),
          BankingBottomNavigationBarItem(icon: Banking_ic_Payment, title: Text(Banking_lbl_Payment)),
          BankingBottomNavigationBarItem(icon: Banking_ic_Saving, title: Text(Gajiku_lbl_client_history)),
          BankingBottomNavigationBarItem(icon: Banking_ic_Menu, title: Text(Banking_lbl_Menu)),
        ],
        currentIndex: selectedIndex,
        unselectedIconTheme: IconThemeData(color: Banking_greyColor.withOpacity(0.5), size: 28),
        selectedIconTheme: const IconThemeData(color: Banking_Primary, size: 28),
        onTap: _onItemTapped,
        type: BankingBottomNavigationBarType.fixed,
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
