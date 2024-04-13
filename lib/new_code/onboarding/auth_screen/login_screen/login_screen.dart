import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
import 'package:vouch/new_code/onboarding/auth_screen/login_screen/phone_number_field.dart';
import 'package:vouch/new_code/onboarding/auth_screen/otp_screen/otp_screen.dart';
import '../../../../auth/firebase_auth/auth_util.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontFamily: 'Bricolage Grotesque',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                        minFontSize: 16.0,
                      ),
                      AutoSizeText(
                        'Mobile Number',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontFamily: 'Bricolage Grotesque',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                        minFontSize: 16.0,
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      AutoSizeText(
                        'OTP will be sent to your mobile number for \nverification',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),


                  Container(
                    width: double.infinity,
                    height: 80.h,
                    padding: EdgeInsets.all(8.0.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
                      color: FlutterFlowTheme.of(context).containerBackground,
                    ),
                    child: Stack(children: [
                      Container(
                       decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0.w)),
                          color: Colors.white,
                        ),
                        height: 40.h,
                        width: 108.w,

                      ),
                      phoneInputField(_model, context),


                    ]),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 28.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOGIN_PAGE_PROCEED_TO_O_T_P_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().loginPhone =
                        '${_model.phoneNumberController2?.text}';
                    logFirebaseEvent('Button_custom_action');
                    await actions.hashedPhone(
                      FFAppState().loginPhone,
                    );
                    logFirebaseEvent('Button_auth');
                    final phoneNumberVal = FFAppState().loginPhone;
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
                              mobile: removeCountryCode(_model.phoneNumberController2.text,_model.phoneNumberController1.text),
                              countryCode: _model.phoneNumberController1.text,
                            ));
                      },
                    );
                  },
                  text: 'Proceed OTP',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 64.0.h,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0.w,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(12.0.w),
                  ),
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
