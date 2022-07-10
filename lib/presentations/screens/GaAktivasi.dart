import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaActiBloc.dart';
import 'package:gajiku_dev/bloc/GaActiEvent.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:gajiku_dev/presentations/screens/GaSignIn.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';


import '../../bloc/GaActiState.dart';

class GaAktivasi extends StatefulWidget {
  static var tag = "/BankingSignIn";

  @override
  _GaAktivasiState createState() => _GaAktivasiState();
}

class _GaAktivasiState extends State<GaAktivasi> with TickerProviderStateMixin {
  final TextEditingController _acticode = TextEditingController();

  GaActiBloc? gaActiBloc;

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    gaActiBloc = BlocProvider.of<GaActiBloc>(context);
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
        BlocProvider.of<GaActiBloc>(context).add(ActiStartEvent());
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

    final blocMessage = BlocBuilder<GaActiBloc, GaActiState>(
      builder: (context, state) {
        if (state is ActiErrorState) {
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
        } else if (state is ActiLoadedState) {
          return AnimatedOpacity(
              opacity: animation.value,
              duration: const Duration(seconds: 0),
              child: Column(
                children: [
                  0.height,
                  Text(
                      state.message,
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
                  ),
                ],
              )
          );
        } else {
          return Container();
        }
      },
    );

    final actiView = SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 100.0),
          Text("Aktivasi", style: boldTextStyle(size: 30)),
          26.height,
          blocMessage,
          TextField(
            controller: _acticode,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '#-#-#-#-#-#',
                filter: { "#": RegExp(r'[0-9]') },
                type: MaskAutoCompletionType.lazy,
              )
            ],
            decoration: const InputDecoration(
                hintText: '0-0-0-0-0-0',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  //  when the TextFormField in unfocused
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  //  when the TextFormField in focused
                ) ,
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45)
                )
            ),
            style: const TextStyle(fontSize: 30.0),
          ),
          16.height,
          const Text("Cek kode aktivasi di email saat daftar"),
          16.height,
          BankingButton(
            textContent: "Kirim",
            onPressed: () {
              setState(() {
                onChangeLevel();
              });
              var acticode = _acticode.text.replaceAll("-", "");
              if (acticode != "") {
                gaActiBloc?.add(ActiButtonClicked(
                    acticode: acticode
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
        ],
      ),
    );

    final blocBuilderActiView = BlocBuilder<GaActiBloc, GaActiState>(
      builder: (context, state) {
        if (state is ActiLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ActiInitState) {
          return actiView;
        } else if (state is ActiLoadedState) {
          return actiView;
        } else if (state is ActiErrorState) {
          return actiView;
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
      body: BlocListener<GaActiBloc, GaActiState>(
        listener: (context, state) {
          if (state is ActiLoadedState) {
            // Navigator.pushNamed(context, '/login');
          }
        },
        child: blocBuilderActiView,
      ),
    );
  }
}
