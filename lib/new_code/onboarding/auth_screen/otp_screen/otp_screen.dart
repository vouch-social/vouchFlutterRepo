import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:vouch/final_design/onboarding/permissions/permissions_widget.dart';
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                  bottomRight: Radius.circular(32.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Enter OTP sent to',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 22.0,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 24.0),
                      child: Text(
                        '${widget.countryCode}-${widget.mobile}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 22.0,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 0.0),
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                        fontFamily: 'Bricolage Grotesque',
                        color:
                        FlutterFlowTheme.of(context).primaryBackground,
                        useGoogleFonts: false,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      enableActiveFill: true,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 16.0,
                      showCursor: true,
                      cursorColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                      obscureText: false,
                      hintCharacter: '-',
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 48.0,
                        fieldWidth: 48.0,
                        borderWidth: 2.0,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        shape: PinCodeFieldShape.box,
                        activeColor: FlutterFlowTheme.of(context).secondary,
                        inactiveColor: FlutterFlowTheme.of(context).accent1,
                        selectedColor: FlutterFlowTheme.of(context).secondary,
                        activeFillColor: FlutterFlowTheme.of(context).secondary,
                        inactiveFillColor: FlutterFlowTheme.of(context).accent1,
                        selectedFillColor:
                        FlutterFlowTheme.of(context).secondary,
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
                  ),
                  if (!_model.timerDone)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 8.0, 0.0),
                            child: Text(
                              'Resend OTP in ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context)
                                    .primaryText,
                                fontSize: 18.0,
                                useGoogleFonts: false,
                              ),
                            ),
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
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: false,
                          ),
                        ),
                      ],
                    ),
                  if (_model.timerDone)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 8.0, 0.0),
                            child: InkWell(
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
                              child: Text(
                                'Resend OTP',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color:
                                  FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 48.0),
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
                text: 'Verify OTP',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Bricolage Grotesque',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
