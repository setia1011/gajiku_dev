import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gajiku_dev/bloc/GaProfileBloc.dart';
import 'package:gajiku_dev/bloc/GaProfileEvent.dart';
import 'package:gajiku_dev/bloc/GaProfileState.dart';
import 'package:gajiku_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:gajiku_dev/presentations/utils/GaColors.dart';
import 'package:gajiku_dev/presentations/utils/GaStrings.dart';
import 'package:gajiku_dev/presentations/utils/GaWidget.dart';
import 'package:gajiku_dev/data/repositories/GaRefIdType.dart';


class GaProfileUpdate extends StatefulWidget {
  const GaProfileUpdate({Key? key}) : super(key: key);

  @override
  _GaProfileUpdateState createState() => _GaProfileUpdateState();
}

class _GaProfileUpdateState extends State<GaProfileUpdate> {
  GaProfileBloc? gaProfileBloc;
  late FToast fToast;
  late SharedPreferences prefs;
  int idType = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final TextEditingController _typeAheadController = TextEditingController();

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs = prefs;
      emailController.text = prefs.getString("email").toString();
      nameController.text = prefs.getString("name").toString();
      idNumberController.text = prefs.getString("id_number").toString();
      phoneController.text = prefs.getString("phone").toString();
      addressController.text = prefs.getString("address").toString();
      _typeAheadController.text = prefs.getString("id_type_name").toString();
      idType = prefs.getInt("id_type")!;
    });
  }

  @override
  void initState() {
    gaProfileBloc = BlocProvider.of<GaProfileBloc>(context);
    getPref();
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
      body: BlocConsumer<GaProfileBloc, GaProfileState>(
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
                          Text('Update\nProfile', style: boldTextStyle(size: 32)),
                        ],
                      ),
                      20.height,
                      EditText(text: 'Email', mController: emailController,  isSecure: false, isPassword: false),
                      16.height,
                      EditText(text: 'Name', mController: nameController, isSecure: false, isPassword: false),
                      16.height,
                      TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              autofocus: false,
                              style: const TextStyle(
                                  fontSize: 18.0
                              ),
                              controller: _typeAheadController
                          ),
                          onSuggestionSelected: (Map<String, String> suggestion) {
                            _typeAheadController.text = suggestion['id_type']?.toUpperCase() as String;
                            idType = suggestion['id'].toInt();
                          },
                          itemBuilder: (context, Map<String, String> suggestion) {
                            return ListTile(
                              title: Text('${suggestion['id_type']?.toUpperCase()}'),
                            );
                          },
                          suggestionsCallback: (pattern) async {
                            return await BackendService.getSuggestions(pattern);
                          }
                      ),
                      // EditText(text: 'ID Type', mController: idTypeController, isSecure: false, isPassword: false),
                      16.height,
                      EditText(text: 'ID Number', mController: idNumberController, isSecure: false, isPassword: false),
                      16.height,
                      EditText(text: 'Phone Number', mController: phoneController, isSecure: false, isPassword: false),
                      16.height,
                      EditText(text: 'Address', mController: addressController, isSecure: false, isPassword: false),
                      16.height,
                      40.height,
                      BankingButton(
                        textContent: Banking_lbl_Confirm,
                        onPressed: () {
                          if (idType != 0 ||
                              emailController.text != "" ||
                              nameController.text != "" ||
                              idNumberController.text != "" ||
                              phoneController.text != "" ||
                              addressController.text != "") {
                            gaProfileBloc?.add(
                                UpdateButtonPressedEvent(
                                    email: emailController.text,
                                    name: nameController.text,
                                    idType: idType,
                                    idNumber: idNumberController.text.toInt(),
                                    phone: phoneController.text,
                                    address: addressController.text
                                )
                            );
                          }

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
                          // toasty(
                          //   context,
                          //   state.message,
                          //   borderRadius: BorderRadius.circular(0),
                          //   gravity: ToastGravity.BOTTOM_RIGHT
                          // );
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