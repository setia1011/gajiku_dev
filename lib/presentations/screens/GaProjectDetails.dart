import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaClientBloc.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/screens/BankingPaymentInvoice.dart';

import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';

class GaProjectDetails extends StatefulWidget {
  int projectId;
  GaProjectDetails(this.projectId, {Key? key}) : super(key: key);

  @override
  _GaProjectDetailsState createState() => _GaProjectDetailsState();
}

class _GaProjectDetailsState extends State<GaProjectDetails> {
  GaClientBloc? clientBloc;
  int? projectId;

  final TextEditingController _projectId = TextEditingController();
  final TextEditingController _project = TextEditingController();
  final TextEditingController _responsibleName = TextEditingController();
  final TextEditingController _responsibleIdType = TextEditingController();
  final TextEditingController _responsibleIdNumber = TextEditingController();
  final TextEditingController _createdAt = TextEditingController();
  final TextEditingController _subscriptionPlan = TextEditingController();
  final TextEditingController _subscriptionMonth = TextEditingController();
  final TextEditingController _subscriptionMonthlyPrice = TextEditingController();
  final TextEditingController _subscriptionTotalPrice = TextEditingController();

  @override
  void initState() {
    projectId = widget.projectId;
    clientBloc = BlocProvider.of<GaClientBloc>(context);
    clientBloc?.add(ProjectDetailsLoading(projectId: widget.projectId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GaClientBloc, GaClientState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProjectDetailsLoaded) {
          var totalPrice = 0.0;
          var plan = "";
          var subsMonth = 0;
          var status = "";

          if (state.myProjectDetails.refSubscription!.isNotEmpty) {
            var monthlyPrice = state.myProjectDetails.refSubscription![0].refSubscriptionPlan?.monthlyPrice!.toDouble();
            var subsMonth = state.myProjectDetails.refSubscription![0].subsMonth!.toDouble();
            totalPrice = monthlyPrice! * subsMonth;
            plan = state.myProjectDetails.refSubscription![0].refSubscriptionPlan!.plan.toString();
            subsMonth = state.myProjectDetails.refSubscription![0].subsMonth!.toDouble();
            status = state.myProjectDetails.refSubscription![0].status.toString();
          } else {
            totalPrice = 0.0;
            plan = "";

          }
          
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
                              color: appStore.isDarkModeOn
                                  ? white
                                  : Banking_blackColor,
                            ).onTap(
                              () {
                                BlocProvider.of<GaClientBloc>(context).add(ProjectsListLoading());
                                finish(context);
                              },
                            ),
                            20.height,
                            Text("Details", style: boldTextStyle(size: 30)),
                          ],
                        ),
                        10.height,
                        Text('You can edit, cancel or delete',
                            style: secondaryTextStyle()),
                        20.height,
                        const Divider(height: 24),
                        EditText(text: state.myProjectDetails.project, mController: _project, isPassword: false),
                        EditText(text: state.myProjectDetails.responsibleName, mController: _responsibleName, isPassword: false),
                        EditText(text: state.myProjectDetails.createdAt, mController: _createdAt, isPassword: false),
                        EditText(text: plan, isPassword: false),
                        EditText(text: "${subsMonth.toString()} bulan"),
                        EditText(text: status),
                        EditText(text: totalPrice.toString(), isPassword: false)
                      ],
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: BankingButton(
                //     textContent: Banking_lbl_Next,
                //     onPressed: () {
                //       BankingPaymentInvoice().launch(context);
                //     },
                //   ),
                // ).paddingOnly(bottom: 20, right: 10, left: 10),
              ],
            ),
          );
        } else {
          return Container();
        }
        // return Scaffold(
        //   body: Stack(
        //     children: <Widget>[
        //       Container(
        //         padding: const EdgeInsets.all(16),
        //         child: SingleChildScrollView(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               30.height,
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.chevron_left,
        //                     size: 30,
        //                     color: appStore.isDarkModeOn
        //                         ? white
        //                         : Banking_blackColor,
        //                   ).onTap(
        //                     () {
        //                       finish(context);
        //                     },
        //                   ),
        //                   20.height,
        //                   Text("Details", style: boldTextStyle(size: 30)),
        //                 ],
        //               ),
        //               10.height,
        //               Text('You can edit, cancel or delete',
        //                   style: secondaryTextStyle()),
        //               20.height,
        //               Row(
        //                 children: <Widget>[
        //                   Text('Transfer Via', style: primaryTextStyle())
        //                       .expand(),
        //                   const Icon(Icons.keyboard_arrow_right,
        //                       size: 30, color: Banking_greyColor),
        //                 ],
        //               ),
        //               const Divider(height: 24),
        //               EditText(
        //                   text: Banking_lbl_Invitation_code, isPassword: false),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Align(
        //         alignment: Alignment.bottomCenter,
        //         child: BankingButton(
        //           textContent: Banking_lbl_Next,
        //           onPressed: () {
        //             BankingPaymentInvoice().launch(context);
        //           },
        //         ),
        //       ).paddingOnly(bottom: 20, right: 10, left: 10),
        //     ],
        //   ),
        // );
      },
    );
  }
}
