import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/new_code/onboarding/welcome_screen/welcome_model.dart';
import '../../../auth/base_auth_user_provider.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../auth_screen/login_screen/login_screen.dart';




class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late WelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Welcome'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WELCOME_PAGE_Welcome_ON_INIT_STATE');
      if (loggedIn) {
        logFirebaseEvent('Welcome_navigate_to');

        context.goNamed(
          'Home',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );

        return;
      } else {
        return;
      }
    });
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/logo_white_200.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding:  EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                    'Welcome to',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context)
                        .welcomeTitle1,
                    minFontSize: 16.0,
                  ),
                AutoSizeText(
                    'Vouch',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context)
                        .welcomeTitle2,
                    minFontSize: 16.0,
                  ),
                SizedBox(height: 24.h,),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0.w,
                    ),
                    SizedBox(width: 8.0.w,),
                    Expanded(
                      child: AutoSizeText(
                        'Search the world for people you want to connect',
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context)
                              .primaryBackground,
                          fontSize: 14.0.w,
                          fontWeight: FontWeight.w400,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Row(

                  children: [
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0.w,
                    ),
                    SizedBox(width: 8.0.w,),
                    Expanded(
                      child: AutoSizeText(
                        'Discover new friends, and uncover new \nconnection paths',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context)
                              .primaryBackground,
                          fontSize: 14.0.w,
                          fontWeight: FontWeight.w400,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h,),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 18.0.w,
                    ),
                    SizedBox(width: 8.0.w,),
                    Expanded(
                      child: AutoSizeText(
                        'Know your network, Grow your network!',
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context)
                              .primaryBackground,
                          fontSize: 14.0.w,
                          fontWeight: FontWeight.w400,
                          useGoogleFonts: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:  EdgeInsetsDirectional.fromSTEB(
                        0.0, 30.0.w, 0.0, 28.0.w),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'WELCOME_PAGE_GET_STARTED_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');
                        Get.to(()=> const LoginScreen());
                      },
                      text: 'Get Started',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 64.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            1.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color:
                        FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context).titleLarge,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(12.0.w),
                      ),
                    ),
                  ),
                ),
              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
