import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaRegBloc.dart';
import 'package:gajiku_dev/bloc/GaRegEvent.dart';
import 'package:gajiku_dev/bloc/GaRegState.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/GaAktivasi.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

import 'GaSignIn.dart';

class GaSignUp extends StatefulWidget {
  static var tag = "/BankingSignIn";

  @override
  _GaSignUpState createState() => _GaSignUpState();
}

class _GaSignUpState extends State<GaSignUp> with TickerProviderStateMixin {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  GaRegBloc? regBloc;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    regBloc = BlocProvider.of<GaRegBloc>(context);
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
        animationController.stop();
        BlocProvider.of<GaRegBloc>(context).add(RegStartEvent());
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

    final blocErrorMessage = BlocBuilder<GaRegBloc, GaRegState>(
      builder: (context, state) {
        if (state is RegErrorState) {
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

    final regView = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 100.0),
          Text("Daftar", style: boldTextStyle(size: 30)),
          25.height,
          blocErrorMessage,
          TextField(
            controller: _email,
            decoration: const InputDecoration(
                labelText: 'Email'
            ),
          ),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
                labelText: 'Name'
            ),
          ),
          TextField(
            controller: _username,
            decoration: const InputDecoration(
                labelText: 'Username'
            ),
          ),
          TextField(
            controller: _password,
            decoration: const InputDecoration(
                labelText: 'Password'
            ),
            obscureText: true,
          ),
          20.height,
          BankingButton(
            textContent: "Daftar",
            onPressed: () {
              setState(() {
                onChangeLevel();
              });
              if (_name.text != "" || _username.text != "" || _password.text != "" || _email.text != "") {
                regBloc?.add(RegButtonPressed(
                    name: _name.text,
                    username: _username.text,
                    password: _password.text,
                    email: _email.text
                ));
              }
            },
          ),
          16.height,
          Column(
            children: [
              TextButton(
                  onPressed: () {
                    GaSignIn().launch(context);
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.topLeft),
                  child: Text(
                    Banking_lbl_Have_Account_Login,
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
          )
        ],
      ),
    );

    final blocBuilderRegView = BlocBuilder<GaRegBloc, GaRegState>(
      builder: (context, state) {
        if (state is RegLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RegInitState) {
          return regView;
        } else if (state is RegLoadedState) {
          return regView;
        } else if (state is RegErrorState) {
          return regView;
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
      body: BlocListener<GaRegBloc, GaRegState>(
        listener: (context, state) {
          if (state is RegLoadedState) {
            Navigator.pushNamed(context, '/aktivasi');
          }
        },
        child: blocBuilderRegView,
      ),
    );
  }
}
