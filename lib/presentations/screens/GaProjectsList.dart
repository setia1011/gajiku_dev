import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaClientBloc.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/GaProjectDetails.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/screens/BankingPayInvoice.dart';
import 'package:gajiku_dev/presentations/screens/BankingPaymentHistory.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaContants.dart';

// ignore: must_be_immutable
class GaProjectsList extends StatefulWidget {
  String? headerText;

  GaProjectsList({this.headerText});

  @override
  _GaProjectsListState createState() => _GaProjectsListState();
}

class _GaProjectsListState extends State<GaProjectsList> {
  GaClientBloc? clientBloc;

  @override
  void initState() {
    clientBloc = BlocProvider.of<GaClientBloc>(context);
    clientBloc?.add(ProjectsListLoading());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocConsumer<GaClientBloc, GaClientState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProjectsListLoaded) {
                if (state.myProjectsList.isNotEmpty) {
                  return Column(
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
                          ).onTap(() {
                            BlocProvider.of<GaClientBloc>(context).add(ClientLoading());
                              finish(context);
                            },
                          ),
                          16.height,
                          Text(
                            widget.headerText!,
                            style: boldTextStyle(
                                size: 30,
                                color: appStore.isDarkModeOn
                                    ? white
                                    : Banking_TextColorPrimary),
                          ),
                        ],
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.myProjectsList.length,
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
                                    "images/Banking_ic_Voice.png",
                                    height: 20,
                                    width: 20,
                                    color: Banking_whitePureColor,
                                  ),
                                ).paddingAll(spacing_standard),
                                Text(state.myProjectsList[index].project!, style: primaryTextStyle()),
                              ],
                            ),
                          ).onTap(
                            () {
                              // if (index == 0) {
                              //   GaProjectDetails(state.myProjectsList[index].id).launch(context);
                              // } else {
                              //   BankingPaymentHistory().launch(context);
                              // }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => GaProjectDetails(projectId: 1),
                              // ));
                              // GaProjectDetails(projectId: 1).launch(context);
                              // int? u = state.myProjectsList[index].id;
                              // print(index);
                              if (state.myProjectsList.isNotEmpty) {
                                var ix = state.myProjectsList[index].id;

                                GaProjectDetails(ix!).launch(context);
                              }
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
              // return Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     30.height,
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Icon(
              //           Icons.chevron_left,
              //           size: 25,
              //           color: appStore.isDarkModeOn ? white : Banking_blackColor,
              //         ).onTap(() {
              //             finish(context);
              //           },
              //         ),
              //         16.height,
              //         Text(
              //           widget.headerText!,
              //           style: boldTextStyle(
              //               size: 30,
              //               color: appStore.isDarkModeOn
              //                   ? white
              //                   : Banking_TextColorPrimary),
              //         ),
              //       ],
              //     ),
              //     ListView.builder(
              //       scrollDirection: Axis.vertical,
              //       itemCount: mList.length,
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemBuilder: (BuildContext context, int index) {
              //         return Container(
              //           margin: const EdgeInsets.only(top: 8, bottom: 8),
              //           decoration: boxDecorationWithShadow(
              //             borderRadius: BorderRadius.circular(10),
              //             backgroundColor: context.cardColor,
              //           ),
              //           child: Row(
              //             children: [
              //               Container(
              //                 height: 60,
              //                 width: 60,
              //                 padding: const EdgeInsets.all(16),
              //                 decoration: boxDecorationWithRoundedCorners(
              //                   borderRadius: BorderRadius.circular(30),
              //                   backgroundColor: Banking_Primary,
              //                 ),
              //                 child: Image.asset(
              //                   mList[index].img!,
              //                   height: 20,
              //                   width: 20,
              //                   color: Banking_whitePureColor,
              //                 ),
              //               ).paddingAll(spacing_standard),
              //               Text(mList[index].title!,
              //                   style: primaryTextStyle()),
              //             ],
              //           ),
              //         ).onTap(
              //           () {
              //             if (index == 0) {
              //               BankingPayInvoice().launch(context);
              //             } else {
              //               BankingPaymentHistory().launch(context);
              //             }
              //             setState(() {});
              //           },
              //         );
              //       },
              //     ),
              //   ],
              // );
            },
          ),
        ),
      ),
    );
  }
}
