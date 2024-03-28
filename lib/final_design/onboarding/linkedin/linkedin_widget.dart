import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'linkedin_model.dart';
export 'linkedin_model.dart';

class LinkedinWidget extends StatefulWidget {
  const LinkedinWidget({super.key});

  @override
  State<LinkedinWidget> createState() => _LinkedinWidgetState();
}

class _LinkedinWidgetState extends State<LinkedinWidget> {
  late LinkedinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkedinModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Linkedin'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LINKEDIN_PAGE_Linkedin_ON_INIT_STATE');
      logFirebaseEvent('Linkedin_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 4000),
        callback: (timer) async {
          if (valueOrDefault(currentUserDocument?.linkedInvanityName, '') !=
                  null &&
              valueOrDefault(currentUserDocument?.linkedInvanityName, '') !=
                  '') {
            logFirebaseEvent('Linkedin_navigate_to');

            context.pushNamed('Home');

            logFirebaseEvent('Linkedin_stop_periodic_action');
            _model.instantTimer?.cancel();
          } else {
            logFirebaseEvent('Linkedin_backend_call');
            _model.apiResult237 = await GetUserFromHashedPhoneCall.call(
              hashedPhone: valueOrDefault(currentUserDocument?.hashedPhone, ''),
            );
            if ((_model.apiResult237?.succeeded ?? true)) {
              logFirebaseEvent('Linkedin_backend_call');

              await currentUserReference!.update(createUsersRecordData(
                email: GetUserFromHashedPhoneCall.email(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
                userName: GetUserFromHashedPhoneCall.name(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
                photoUrl: GetUserFromHashedPhoneCall.photoURL(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
                linkedInvanityName: GetUserFromHashedPhoneCall.vanityName(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
                linkedInHeadLine: GetUserFromHashedPhoneCall.localizedHeadline(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
                linkedInSub: GetUserFromHashedPhoneCall.linkedInSub(
                  (_model.apiResult237?.jsonBody ?? ''),
                ),
              ));
            }
          }
        },
        startImmediately: false,
      );
    });
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
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FlutterFlowWebView(
          content:
              'https://www.linkedin.com/oauth/v2/authorization?response_type=code&scope=openid,profile,email,r_basicprofile&client_id=86s8a2pvd36qob&redirect_uri=https://dev5747.d3ccozniz1kwv7.amplifyapp.com&state=${FFAppState().hashedPhone}',
          bypass: true,
          height: MediaQuery.sizeOf(context).height * 1.0,
          verticalScroll: false,
          horizontalScroll: false,
        ),
      ),
    );
  }
}
