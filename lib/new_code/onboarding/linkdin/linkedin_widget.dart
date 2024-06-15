import 'package:get/get.dart';
import '/new_code/home_page/HomePage/new_home_page.dart';
import '/new_code/onboarding/customize_profile/user_details.dart';
import '/new_code/onboarding/goals/goals_screen.dart';
import '/new_code/onboarding/waterfall_model.dart';
import '../../../main.dart';
import '../../backend/backend_constants.dart';
import '../../backend/models/base_response.dart';
import '../../backend/models/check_user_model.dart';
import '../../backend/repos/auth_repo.dart';
import '../auth_screen/login_screen/components/country_code_remover.dart';
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
  final AuthRepository repository = AuthRepository();
   bool isLinkedinSync = false;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkedinModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Linkedin'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var data = {
        "phone": cleanPhone(currentPhoneNumber),
        // 'phone':'919999999999'
      };
      logFirebaseEvent('LINKEDIN_PAGE_Linkedin_ON_INIT_STATE');
      logFirebaseEvent('Linkedin_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 4000),
        callback: (timer) async {

          try {
            print("Linkedin DAta: ${data}");
            BaseResponse<CheckUserModel> apiResult =
            await repository.sendTokenToServer(data['phone']!);
            print("Linkedin1 ${apiResult.data.data.linkedinSync}");

            isLinkedinSync =  apiResult.data.data.linkedinSync;
            if (apiResult.status) {
              print('Api Result : ${apiResult}');


            } else {
              print("No Access TokenFound");
            }
          } catch (error) {
            print(error);
          }
          if (
          //valueOrDefault(currentUserDocument?.linkedInvanityName, '') != ''
          isLinkedinSync
          ) {
            logFirebaseEvent('Linkedin_navigate_to');

            Get.off(() => GoalsScreen());

            logFirebaseEvent('Linkedin_stop_periodic_action');
            _model.instantTimer?.cancel();
          } else if(counter == 30) {
            logFirebaseEvent('Linkedin_navigate_to');

              Get.off(() => navigateToPage());


          }else{
            logFirebaseEvent('Linkedin_backend_call');
            print("Counter :$counter");
            // _model.apiResult237 = await GetUserFromHashedPhoneCall.call(
            //   hashedPhone: valueOrDefault(currentUserDocument?.hashedPhone, ''),
            // );
          }
          counter ++;
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
        body: SafeArea(
          child: FlutterFlowWebView(
            content:
            'https://www.linkedin.com/oauth/v2/authorization?response_type=code&scope=openid,profile,email,r_basicprofile&client_id=86s8a2pvd36qob&redirect_uri=https://dev5747.d3ccozniz1kwv7.amplifyapp.com&state=${prefs?.getString(loggedInUserHashedPhone)}',
            bypass: true,
            height: MediaQuery.sizeOf(context).height * 1.0,
            verticalScroll: false,
            horizontalScroll: false,
          ),
        ),
      ),
    );
  }
}