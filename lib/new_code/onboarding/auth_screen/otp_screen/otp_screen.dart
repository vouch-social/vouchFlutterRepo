import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:vouch/checkAuth.dart';
import 'package:vouch/flutter_flow/flutter_flow_util.dart';
import '../../../../auth/firebase_auth/auth_util.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_timer.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../../permissions/permissions_screen.dart';
import 'otp_model.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key,this.mobileWOCC, this.countryCode,});
  final String? mobileWOCC;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                  AutoSizeText(
                    '${widget.countryCode}-${widget.mobileWOCC}',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).displayLarge,
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
                          .titleMedium,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      enableActiveFill: true,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 12.0.w,
                      showCursor: true,
                      cursorColor:
                      FlutterFlowTheme.of(context).primaryText,
                      obscureText: false,
                      hintCharacter: 'x',
                      hintStyle: FlutterFlowTheme.of(context).labelExtraSmall.override(
                        color: FlutterFlowTheme.of(context).primaryText.withOpacity(0.3),
                        useGoogleFonts: false
                      ),
                      keyboardType: TextInputType.number,
// backgroundColor: FlutterFlowTheme.of(context).textFieldBackground,
                      pinTheme: PinTheme(
                        fieldHeight: 52.0.h,
                        fieldWidth: 52.0.w,
                        borderWidth: 0.0,
                        borderRadius:  BorderRadius.circular(8.0.w),
activeBorderWidth: 0,
                        disabledBorderWidth: 0,
                        errorBorderWidth: 0,
                        inactiveBorderWidth: 0,
                        selectedBorderWidth: 0,
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).textFieldBackground,
                        inactiveColor: Color.lerp(FlutterFlowTheme.of(context).textFieldBackground, FlutterFlowTheme.of(context).error, 0.15)?.withOpacity(0.2),
                        // inactiveColor: FlutterFlowTheme.of(context).textFieldBackground,
                        selectedColor: FlutterFlowTheme.of(context).textFieldBackground,
                        activeFillColor: FlutterFlowTheme.of(context).textFieldBackground,
                        inactiveFillColor: Color.lerp(FlutterFlowTheme.of(context).textFieldBackground, FlutterFlowTheme.of(context).error, 0.15)?.withOpacity(0.2),
                        selectedFillColor:
                        FlutterFlowTheme.of(context).textFieldBackground,
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

                                ,
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
                                    .bodySmall,
                              ),
                              Text('s',
                              style:
                                FlutterFlowTheme.of(context)
                                    .bodySmall
                                    ,
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
                                  final phoneAuthWCC = '${widget.countryCode}${widget.mobileWOCC}';
                                  await authManager.beginPhoneAuth(
                                    context: context,
                                    phoneNumber: phoneAuthWCC,
                                    onCodeSent: (context) async {
                                      context.goNamedAuth(
                                        'OTP',
                                        context.mounted,
                                        queryParameters: {
                                          'mobile': serializeParam(
                                            widget.mobileWOCC,
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
                                      .bodySmall.override(
                                    useGoogleFonts: false,
                                    decoration: TextDecoration.underline,
                                  )
                                      ,
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
                             decoration: TextDecoration.underline,
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
                     _model.sendUserData(
                        countryCode: widget.countryCode, phoneWOCC: widget.mobileWOCC);

                    //Get.offAll(() =>  PermissionsScreen(mobileWOCC: widget.mobileWOCC,countryCode: widget.countryCode,));
                    //context.goNamedAuth('Permissions', context.mounted);
                  },
                  text: 'Submit OTP',
                  options: CTAButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
