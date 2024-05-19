import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:vouch/new_code/services/app_state.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
import 'package:vouch/new_code/onboarding/auth_screen/login_screen/phone_number_field.dart';
import 'package:vouch/new_code/onboarding/auth_screen/otp_screen/otp_screen.dart';
import '../../../../auth/firebase_auth/auth_util.dart';
import '../../../services/hashed_phone.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
// import '/custom_code/actions/index.dart' as actions;

import 'login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginModel _model;
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  String removeCountryCode(String fullPhoneNumber, String dialCode) {
    return fullPhoneNumber.replaceFirst(dialCode, '');
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
    _model.phoneNumberController1 ??= TextEditingController();
    _model.phoneNumberFocusNode1 ??= FocusNode();

    _model.phoneNumberController2 ??= TextEditingController();
    _model.phoneNumberFocusNode2 ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.phoneNumberController1?.text = '+91';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3.h,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Enter your',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).displaySmall
                        ,
                        minFontSize: 16.0,
                      ),
                      AutoSizeText(
                        'Mobile Number',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).displayLarge,
                        minFontSize: 16.0,
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      AutoSizeText(
                        'OTP will be sent to your mobile number for \nverification',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: 64.h,
                      // padding: EdgeInsets.all(8.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
                        color: FlutterFlowTheme.of(context).textFieldBackground,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0.w),
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
                        color: Colors.white,
                      ),
                      height: 46.h,
                      width: 108.w,

                    ),
                    phoneInputField(_model, context),


                  ]),

                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 28.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOGIN_PAGE_PROCEED_TO_O_T_P_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().loginPhoneWOCC =
                        '${_model.phoneNumberController2?.text}';
                    print("LoginPhoneWOCC : ${_model.phoneNumberController2?.text}");
                    FFAppState().loginPhoneCC =
                    '${_model.phoneNumberController1?.text}';
                    logFirebaseEvent('Button_custom_action');
                    await hashedPhone(
                      FFAppState().loginPhoneWOCC,
                      FFAppState().loginPhoneCC,
                    );
                    logFirebaseEvent('Button_auth');
                    final phoneNumberVal = FFAppState().loginPhoneWOCC;
                    if (phoneNumberVal.isEmpty ||
                        !phoneNumberVal.startsWith('+')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Phone Number is required and has to start with +.'),
                        ),
                      );
                      return;
                    }
                    await authManager.beginPhoneAuth(
                      context: context,
                      phoneNumber: phoneNumberVal,
                      onCodeSent: (context) async {
                        Get.to(() => OtpScreen(
                              mobileWOCC: removeCountryCode(_model.phoneNumberController2.text,_model.phoneNumberController1.text),
                              countryCode: _model.phoneNumberController1.text,
                            ));

                      },
                    );
                  },
                  text: 'Proceed OTP',
                  options: CTAButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
    setState(() {
      this.number = number;
    });
  }

}
