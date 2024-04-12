import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
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
                        'OTP will be sent to your mobile number for',
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
                      AutoSizeText(
                        'verification',
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
                  // Container(
                  //   width: double.infinity,
                  //   child: TextFormField(
                  //     controller: _model.phoneNumberController1,
                  //     focusNode: _model.phoneNumberFocusNode1,
                  //     readOnly: true,
                  //     obscureText: false,
                  //     decoration: InputDecoration(
                  //       labelStyle: FlutterFlowTheme.of(context)
                  //           .titleMedium
                  //           .override(
                  //         fontFamily: 'Outfit',
                  //         color:
                  //         FlutterFlowTheme.of(context).alternate,
                  //         fontSize: 16.0,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //       alignLabelWithHint: false,
                  //       hintText: '+91',
                  //       enabledBorder: InputBorder.none,
                  //       focusedBorder: InputBorder.none,
                  //       errorBorder: InputBorder.none,
                  //       focusedErrorBorder: InputBorder.none,
                  //       filled: true,
                  //       fillColor: FlutterFlowTheme.of(context)
                  //           .primaryBackground,
                  //       contentPadding: const EdgeInsetsDirectional.fromSTEB(
                  //           24.0, 0.0, 0.0, 0.0),
                  //     ),
                  //     style: FlutterFlowTheme.of(context)
                  //         .titleMedium
                  //         .override(
                  //       fontFamily: 'Bricolage Grotesque',
                  //       color: FlutterFlowTheme.of(context).tertiary,
                  //       fontSize: 22.0,
                  //       fontWeight: FontWeight.w500,
                  //       useGoogleFonts: false,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //     minLines: 1,
                  //     keyboardType: TextInputType.phone,
                  //     validator: _model.phoneNumberController1Validator
                  //         .asValidator(context),
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  //     ],
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsetsDirectional.fromSTEB(
                  //         0.0, 48.0, 24.0, 24.0),
                  //     child: TextFormField(
                  //       controller: _model.phoneNumberController2,
                  //       focusNode: _model.phoneNumberFocusNode2,
                  //       textInputAction: TextInputAction.send,
                  //       obscureText: false,
                  //       decoration: InputDecoration(
                  //         labelText: 'Enter 10 digit number',
                  //         labelStyle: FlutterFlowTheme.of(context)
                  //             .titleMedium
                  //             .override(
                  //           fontFamily: 'Outfit',
                  //           color:
                  //           FlutterFlowTheme.of(context).alternate,
                  //           fontSize: 14.0,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //         alignLabelWithHint: false,
                  //         hintText: '9876543210',
                  //         hintStyle: FlutterFlowTheme.of(context)
                  //             .titleMedium
                  //             .override(
                  //           fontFamily: 'Bricolage Grotesque',
                  //           color:
                  //           FlutterFlowTheme.of(context).tertiary,
                  //           fontSize: 22.0,
                  //           fontWeight: FontWeight.w500,
                  //           useGoogleFonts: false,
                  //           lineHeight: 1.5,
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context).accent2,
                  //             width: 2.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context).accent2,
                  //             width: 2.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         errorBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context).error,
                  //             width: 2.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         focusedErrorBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: FlutterFlowTheme.of(context).error,
                  //             width: 2.0,
                  //           ),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         filled: true,
                  //         fillColor: Colors.white,
                  //         contentPadding: const EdgeInsetsDirectional.fromSTEB(
                  //             24.0, 0.0, 0.0, 0.0),
                  //       ),
                  //       style: FlutterFlowTheme.of(context)
                  //           .titleMedium
                  //           .override(
                  //         fontFamily: 'Bricolage Grotesque',
                  //         color:
                  //         FlutterFlowTheme.of(context).primaryText,
                  //         fontSize: 22.0,
                  //         fontWeight: FontWeight.w500,
                  //         useGoogleFonts: false,
                  //       ),
                  //       textAlign: TextAlign.start,
                  //       minLines: 1,
                  //       maxLength: 10,
                  //       maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  //       buildCounter: (context,
                  //           {required currentLength,
                  //             required isFocused,
                  //             maxLength}) =>
                  //       null,
                  //       keyboardType: TextInputType.phone,
                  //       validator: _model.phoneNumberController2Validator
                  //           .asValidator(context),
                  //       inputFormatters: [
                  //         FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: 60.h,
                    width: double.infinity,
                    color: Colors.red,
                    child: SizedBox.expand(
                      child: IntlPhoneField(
                          initialCountryCode: 'IN',
                          textInputAction: TextInputAction.send,
                          focusNode: _model.phoneNumberFocusNode2,
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.start,
                          flagsButtonMargin: EdgeInsets.only(
                              left: 8.0.w,
                              right: 24.0.w,
                              top: 8.0.w,
                              bottom: 8.0.w),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0.w),
                            color: FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          dropdownIcon: Icon(
                            Icons.arrow_drop_down,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                          dropdownTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.w,
                            fontWeight: FontWeight.w400
                          ),
                          decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: Color(0xFF153C47),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0.w),
                                borderSide: BorderSide(color: Color(0xFF0E2B33)),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              hintText: "Enter mobile number",
                          hintStyle: TextStyle(
                            fontSize: 18.w,
                            fontWeight: FontWeight.w300
                          )
                          ),
                          onChanged: (phone) {
                            print(phone.completeNumber);
                            _model.phoneNumberController1.text =
                                phone.countryCode;
                            _model.phoneNumberController2.text = phone.number;
                            print(_model.phoneNumberController1.text);
                            print(_model.phoneNumberController2.text);
                          }),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOGIN_PAGE_PROCEED_TO_O_T_P_BTN_ON_TAP');
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().loginPhone =
                        '${_model.phoneNumberController1?.text}${_model.phoneNumberController2?.text}';
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
                              mobile: _model.phoneNumberController2?.text,
                            ));
                        // context.goNamedAuth(
                        //   'OTP',
                        //   context.mounted,
                        //   queryParameters: {
                        //     'mobile': serializeParam(
                        //       _model.phoneNumberController2.text,
                        //       ParamType.String,
                        //     ),
                        //   }.withoutNulls,
                        //   ignoreRedirect: true,
                        // );
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
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    borderRadius: BorderRadius.circular(8.0.w),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
