import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaPasswordBloc.dart';
import 'package:gajiku_dev/bloc/GaPasswordEvent.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

import '../../bloc/GaPasswordState.dart';

class GaChangePassword extends StatefulWidget {
  @override
  _GaChangePasswordState createState() => _GaChangePasswordState();
}

class _GaChangePasswordState extends State<GaChangePassword> {
  GaPasswordBloc? gaPasswordBloc;
  late FToast fToast;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    gaPasswordBloc = BlocProvider.of<GaPasswordBloc>(context);
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: BlocConsumer<GaPasswordBloc, GaPasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.chevron_left,
                            size: 25,
                            color: appStore.isDarkModeOn ? white : Banking_blackColor,
                          ).onTap(
                                () {
                              finish(context);
                            },
                          ),
                          20.height,
                          Text('Change\nPassword', style: boldTextStyle(size: 32)),
                        ],
                      ),
                      20.height,
                      EditText(
                          text: 'Old Password',
                          mController: oldPasswordController,
                          isPassword: true,
                          isSecure: true),
                      16.height,
                      EditText(
                          text: 'New Password',
                          mController: newPasswordController,
                          isPassword: true,
                          isSecure: true),
                      16.height,
                      EditText(
                          text: 'Confirm New Password',
                          mController: confirmNewPasswordController,
                          isPassword: true,
                          isSecure: true),
                      16.height,
                      40.height,
                      BankingButton(
                        textContent: Banking_lbl_Confirm,
                        onPressed: () {
                          gaPasswordBloc?.add(ButtonSendingPressedEvent(
                              oldPassword: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                              confirmNewPassword: confirmNewPasswordController.text)
                          );

                          if (state is SentState) {
                            fToast.showToast(
                                child: const Text(""),
                                toastDuration: const Duration(seconds: 3),
                                positionedToastBuilder: (context, child) {
                                  return Positioned(
                                    bottom: 70.0,
                                    right: 25.0,
                                    child: Text(state.message,
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              backgroundColor: Colors.amber,
                                              // height: 50.0
                                            )
                                        )
                                    ),
                                  );
                                });
                          } else if (state is ErrorState) {
                            fToast.showToast(
                                child: const Text(""),
                                toastDuration: const Duration(seconds: 3),
                                positionedToastBuilder: (context, child) {
                                  return Positioned(
                                    bottom: 70.0,
                                    right: 25.0,
                                    child: Text(state.message,
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              backgroundColor: Colors.amber,
                                              // height: 50.0
                                            )
                                        )
                                    ),
                                  );
                                });
                          }
                          // toasty(context, 'Password Successfully Changed');
                          finish(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
