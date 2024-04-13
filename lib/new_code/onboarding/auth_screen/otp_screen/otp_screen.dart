import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
import '../../../../auth/firebase_auth/auth_util.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_timer.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../home_page/new_home_page.dart';
import 'otp_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,this.mobile, this.countryCode,});
  final String? mobile;
  final String? countryCode;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'OTP'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OTP_PAGE_OTP_ON_INIT_STATE');
      logFirebaseEvent('OTP_timer');
      _model.timerController.onStartTimer();
    });

    authManager.handlePhoneAuthStateChanges(context);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    'Enter OTP sent to',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      color: FlutterFlowTheme.of(context)
                          .primaryBackground,
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                      useGoogleFonts: false,
                    ),
                minFontSize: 16.0,
                  ),
                  AutoSizeText(
                    '${widget.countryCode}-${widget.mobile}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      color: FlutterFlowTheme.of(context)
                          .primaryBackground,
                      fontFamily: 'Bricolage Grotesque',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      useGoogleFonts: false,
                    ),
                    minFontSize: 16.0,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h,),
                    PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                        fontFamily: 'Bricolage Grotesque',
                        color:
                        FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      enableActiveFill: true,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 12.0.w,
                      showCursor: true,
                      cursorColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                      obscureText: false,
                      hintCharacter: 'x',
                      // hintStyle: TextStyle(
                      //   color: FlutterFlowTheme.of(context).primaryBackground,
                      // ),
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 52.0.h,
                        fieldWidth: 52.0.w,
                        borderWidth: 0.0,
                        borderRadius:  BorderRadius.circular(8.0.w),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).containerBackground,
                        inactiveColor: FlutterFlowTheme.of(context).containerBackground,
                        selectedColor: FlutterFlowTheme.of(context).containerBackground,
                        activeFillColor: FlutterFlowTheme.of(context).containerBackground,
                        inactiveFillColor: FlutterFlowTheme.of(context).containerBackground,
                        selectedFillColor:
                        FlutterFlowTheme.of(context).containerBackground,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) {},
                      onCompleted: (_) async {
                        logFirebaseEvent(
                            'OTP_PinCode_bpxmkd7r_ON_PINCODE_COMPLETE');
                        logFirebaseEvent('PinCode_update_page_state');
                        _model.pincode = true;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _model.pinCodeControllerValidator
                          .asValidator(context),
                    ),
                    SizedBox(height: 24.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!_model.timerDone)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AutoSizeText(
                                'Resend OTP in ',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  useGoogleFonts: false,
                                ),
                              ),
                              FlutterFlowTimer(
                                initialTime: _model.timerMilliseconds,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                controller: _model.timerController,
                                updateStateInterval: const Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) setState(() {});
                                },
                                onEnded: () async {
                                  logFirebaseEvent(
                                      'OTP_PAGE_Timer_hb8514k9_ON_TIMER_END');
                                  if (_model.timerMilliseconds < 1000) {
                                    logFirebaseEvent('Timer_update_page_state');
                                    setState(() {
                                      _model.timerDone = true;
                                    });
                                  }
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                              ),
                              Text('s',
                              style:
                                FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 14.0,
                                  useGoogleFonts: false,
                                ),
                              )
                            ],
                          ),
                        if (_model.timerDone)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'OTP_PAGE_Text_z4z0y37v_ON_TAP');
                                  logFirebaseEvent('Text_auth');
                                  final phoneNumberVal = '+91${widget.mobile}';
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
                                      context.goNamedAuth(
                                        'OTP',
                                        context.mounted,
                                        queryParameters: {
                                          'mobile': serializeParam(
                                            widget.mobile,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        ignoreRedirect: true,
                                      );
                                    },
                                  );

                                  logFirebaseEvent('Text_update_page_state');
                                  setState(() {
                                    _model.pincode = false;
                                    _model.timerDone = false;
                                  });
                                  logFirebaseEvent('Text_timer');
                                  _model.timerController.onResetTimer();

                                  logFirebaseEvent('Text_timer');
                                  _model.timerController.onStartTimer();
                                  logFirebaseEvent('Text_reset_form_fields');
                                  setState(() {
                                    _model.pinCodeController?.clear();
                                  });
                                },
                                child: AutoSizeText(
                                  'Resend OTP',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                    FlutterFlowTheme.of(context).primaryBackground,
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        GestureDetector(
                        onTap: () => Get.back(),
                        child: AutoSizeText(
                            'Wrong mobile number?',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                              fontFamily: 'Bricolage Grotesque',
                              color:
                              FlutterFlowTheme.of(context).primaryBackground,
                              fontSize: 14.0,
                              useGoogleFonts: false,
                            ),
                        )
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 28.0.w),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('OTP_PAGE_VERIFY_O_T_P_BTN_ON_TAP');
                    logFirebaseEvent('Button_auth');
                   // GoRouter.of(context).prepareAuthEvent();
                    final smsCodeVal = _model.pinCodeController!.text;
                    if (smsCodeVal.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enter SMS verification code.'),
                        ),
                      );
                      return;
                    }
                    final phoneVerifiedUser = await authManager.verifySmsCode(
                      context: context,
                      smsCode: smsCodeVal,
                    );
                    if (phoneVerifiedUser == null) {
                      return;
                    }

                    logFirebaseEvent('Button_navigate_to');
                    Get.offAll(() => const NewHomePage());
                    //context.goNamedAuth('Permissions', context.mounted);
                  },
                  text: 'Submit OTP',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 64.0.h,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Bricolage Grotesque',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0.h,
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
}
