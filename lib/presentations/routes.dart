import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/BankingSplash.dart';
import 'package:gajiku_dev/presentations/screens/GaAktivasi.dart';
import 'package:gajiku_dev/presentations/screens/GaAdmin.dart';
import 'package:gajiku_dev/presentations/screens/GaProfile.dart';
import 'package:gajiku_dev/presentations/screens/GaSignIn.dart';
import 'package:gajiku_dev/presentations/screens/GaSignUp.dart';
import 'package:gajiku_dev/presentations/screens/GaManager.dart';
import 'package:gajiku_dev/presentations/screens/GaClient.dart';
import 'package:gajiku_dev/presentations/screens/GaSuper.dart';


var customRoutes = <String, WidgetBuilder>{
  '/': (context) => BankingSplash(),
  '/super': (context) => GaSuper(),
  '/admin': (context) => GaAdmin(),
  '/manager': (context) => GaManager(),
  '/client': (context) => GaClient(),
  '/daftar': (context) => GaSignUp(),
  '/login': (context) => GaSignIn(),
  '/aktivasi': (context) => GaAktivasi(),
  '/profile': (context) => GaProfile()
};