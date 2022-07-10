import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaActiBloc.dart';
import 'package:gajiku_dev/bloc/GaClientBloc.dart';
import 'package:gajiku_dev/bloc/GaPasswordBloc.dart';
import 'package:gajiku_dev/bloc/GaProfileBloc.dart';
import 'package:gajiku_dev/bloc/GaRegBloc.dart';
import 'package:gajiku_dev/data/repositories/GaActiRepo.dart';
import 'package:gajiku_dev/data/repositories/GaRegRepo.dart';
import 'package:gajiku_dev/presentations/routes.dart';
import 'bloc/GaAuthBloc.dart';
import 'data/repositories/GaAuthRepo.dart';
import 'data/repositories/GaClientRepo.dart';
import 'data/repositories/GaPasswordRepo.dart';
import 'data/repositories/GaProfileRepo.dart';
import 'data/repositories/GaUserInfoRepo.dart';
import 'package:gajiku_dev/presentations/store/AppStore.dart';
import 'package:gajiku_dev/presentations/utils/AppTheme.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';
import 'package:gajiku_dev/presentations/utils/GaDataGenerator.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());
  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  runApp(const Gajiku());
}

class Gajiku extends StatelessWidget {
  const Gajiku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // Register BlocProvider
        providers: [
          BlocProvider(create: (context) => GaAuthBloc(GaAuthRepo(), GaUserInfoRepo())),
          BlocProvider(create: (context) => GaRegBloc(GaRegRepo())),
          BlocProvider(create: (context) => GaActiBloc(GaActiRepo())),
          BlocProvider(create: (context) => GaProfileBloc(GaProfileRepo(), GaUserInfoRepo())),
          BlocProvider(create: (context) => GaPasswordBloc(GaPasswordRepo())),
          BlocProvider(create: (context) => GaClientBloc(GaClientRepo()))
        ],
        child: MaterialApp(
          title: '$Banking_lbl_app_Name${!isMobile ? ' ${platformName()}' : ''}',
          debugShowCheckedModeBanner: false,
          theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
          navigatorKey: navigatorKey,
          scrollBehavior: SBehavior(),
          supportedLocales: LanguageDataModel.languageLocales(),
          localeResolutionCallback: (locale, supportedLocales) => locale,
          initialRoute: '/',
          routes: customRoutes
        )
    );
  }
}
