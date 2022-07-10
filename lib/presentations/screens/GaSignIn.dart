import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/GaAktivasi.dart';
import 'package:gajiku_dev/presentations/screens/GaSignUp.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/screens/BankingForgotPassword.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

import 'package:gajiku_dev/bloc/GaAuthBloc.dart';
import 'package:gajiku_dev/bloc/GaAuthEvent.dart';
import 'package:gajiku_dev/bloc/GaAuthState.dart';

class GaSignIn extends StatefulWidget {
  static var tag = "/BankingSignIn";

  @override
  _GaSignInState createState() => _GaSignInState();
}

class _GaSignInState extends State<GaSignIn> with TickerProviderStateMixin {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GaAuthBloc? authBloc;
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    authBloc = BlocProvider.of<GaAuthBloc>(context);
    BlocProvider.of<GaAuthBloc>(context).add(LoginStartEvent());
    super.initState();
  }

  onChangeLevel() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.reverse(from: 1.0);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        // animationController.stop();
        // BlocProvider.of<GaAuthBloc>(context).add(LoginStartEvent());
      }
    });
    animationController.addListener(() {
      setState(() {});
      // print(animation.value * 100);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Error message
    final blocErrorMessage = BlocBuilder<GaAuthBloc, GaAuthState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return AnimatedOpacity(
            opacity: animation.value,
            duration: const Duration(seconds: 0),
            child: Column(
              children: [
                0.height,
                Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                ),
              ],
            )
          );
        } else {
          return Container();
        }
      },
    );

    final loginView = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 100.0),
          Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
          25.height,
          blocErrorMessage,
          EditText(mController: _username, text: "Username", isPassword: false),
          8.height,
          EditText(mController: _password,text: "Password", isPassword: true, isSecure: true),
          16.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(Banking_lbl_Forgot, style: secondaryTextStyle(size: 16)).onTap(
                  () {
                BankingForgotPassword().launch(context);
              },
            ),
          ),
          16.height,
          BankingButton(
            textContent: Banking_lbl_SignIn,
            onPressed: () {
              setState(() {
                onChangeLevel();
              });
              if (_username.text != "" || _password.text != "") {
                authBloc?.add(LoginButtonPressed(
                    username: _username.text,
                    password: _password.text
                ));
              }
            },
          ),
          16.height,
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    GaSignUp().launch(context);
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.topLeft),
                  child: Text(
                    Banking_lbl_Login_with_FaceID,
                    style: primaryTextStyle(size: 16, color: Banking_blueColor),
                  )
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    GaAktivasi().launch(context);
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.topLeft),
                  child: Text(
                    Banking_lbl_Aktivasi,
                    style: primaryTextStyle(
                        size: 16,
                        color: Banking_blueColor),
                  )
              ),
            ],
          ),
        ],
      ),
    );

    final blocBuilder2 = BlocBuilder<GaAuthBloc, GaAuthState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthInitial) {
          return loginView;
        } else if (state is LoginInitState) {
          return loginView;
        } else if (state is LoginErrorState) {
          return loginView;
        } else {
          return Container();
        }
      },
    );

    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: BlocListener<GaAuthBloc, GaAuthState>(
        listener: (context, state) {
          if (state is ClientLoginSuccessState) {
            Navigator.pushNamed(context, '/client');
          } else if (state is AdminLoginSuccessState) {
            Navigator.pushNamed(context, '/admin');
          } else if (state is ManagerLoginSuccessState) {
            Navigator.pushNamed(context, '/manager');
          } else if (state is SuperLoginSuccessState) {
            Navigator.pushNamed(context, "/super");
          }
        },
        child: blocBuilder2,
      ),
    );
  }
}
