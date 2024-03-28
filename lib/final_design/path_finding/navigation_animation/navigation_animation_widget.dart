import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'navigation_animation_model.dart';
export 'navigation_animation_model.dart';

class NavigationAnimationWidget extends StatefulWidget {
  const NavigationAnimationWidget({
    super.key,
    this.paths,
  });

  final dynamic paths;

  @override
  State<NavigationAnimationWidget> createState() =>
      _NavigationAnimationWidgetState();
}

class _NavigationAnimationWidgetState extends State<NavigationAnimationWidget>
    with TickerProviderStateMixin {
  late NavigationAnimationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 5000.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 6000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 8000.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 9000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 11000.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationAnimationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'navigationAnimation'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NAVIGATION_ANIMATION_navigationAnimation');
      logFirebaseEvent('navigationAnimation_backend_call');
      _model.pathsNavResponse = await GetPathsCall.call(
        scannedHashedPhone: FFAppState().scannedHashedPhone,
        currentHashedPhone: FFAppState().hashedPhone,
      );
      if (GetPathsCall.numPaths(
            (_model.pathsNavResponse?.jsonBody ?? ''),
          )! >=
          1) {
        logFirebaseEvent('navigationAnimation_update_app_state');
        FFAppState().getPathsJSON = (_model.pathsNavResponse?.jsonBody ?? '');
        logFirebaseEvent('navigationAnimation_wait__delay');
        await Future.delayed(const Duration(milliseconds: 3000));
        logFirebaseEvent('navigationAnimation_navigate_to');
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed('pathCarouselNew');
      } else {
        logFirebaseEvent('navigationAnimation_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: Text('Oops!'),
                content: Text(
                    'Couldn\'t find a path at this time. This may happen due to various reasons, if you believe this to be a error, please try again!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        logFirebaseEvent('navigationAnimation_wait__delay');
        await Future.delayed(const Duration(milliseconds: 1000));
        logFirebaseEvent('navigationAnimation_navigate_back');
        context.safePop();
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
              child: Lottie.network(
                'https://lottie.host/0881d66a-ed25-4343-9a99-6f9406f37655/YylOZWcMO1.json',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.535,
                fit: BoxFit.contain,
                animate: true,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Text(
                    'Searching through 10k+ connections!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation1']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Text(
                    'Listing all Paths!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation2']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Text(
                    'Optimizing to find best path!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation3']!),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Text(
                    'Sorting the paths!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).tertiary,
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation4']!),
                ),
              ],
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAVIGATION_ANIMATION_Container_okwec5yo_');
                    logFirebaseEvent('Container_share');
                    await Share.share(
                      'vouch.social',
                      sharePositionOrigin: getWidgetBoundingBox(context),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent2,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Text(
                                  '10x your paths!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Bricolage Grotesque',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 12.0),
                                child: Text(
                                  'Get better paths by inviting your\nfriends to Vouch!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Bricolage Grotesque',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Icon(
                              Icons.share,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
