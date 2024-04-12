// import '/auth/base_auth_user_provider.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'welcome_model.dart';
// export 'welcome_model.dart';
//
// class WelcomeWidget extends StatefulWidget {
//   const WelcomeWidget({super.key});
//
//   @override
//   State<WelcomeWidget> createState() => _WelcomeWidgetState();
// }
//
// class _WelcomeWidgetState extends State<WelcomeWidget> {
//   late WelcomeModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => WelcomeModel());
//
//     logFirebaseEvent('screen_view', parameters: {'screen_name': 'Welcome'});
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       logFirebaseEvent('WELCOME_PAGE_Welcome_ON_INIT_STATE');
//       if (loggedIn) {
//         logFirebaseEvent('Welcome_navigate_to');
//
//         context.goNamed(
//           'Home',
//           extra: <String, dynamic>{
//             kTransitionInfoKey: TransitionInfo(
//               hasTransition: true,
//               transitionType: PageTransitionType.fade,
//               duration: Duration(milliseconds: 0),
//             ),
//           },
//         );
//
//         return;
//       } else {
//         return;
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Container(
//           width: double.infinity,
//           height: MediaQuery.sizeOf(context).height * 1.0,
//           decoration: BoxDecoration(
//             color: FlutterFlowTheme.of(context).secondaryBackground,
//           ),
//           alignment: const AlignmentDirectional(0.0, 0.0),
//           child: Align(
//             alignment: const AlignmentDirectional(0.0, 1.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: MediaQuery.sizeOf(context).width * 0.3,
//                     height: MediaQuery.sizeOf(context).height * 0.3,
//                     decoration: BoxDecoration(),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(0.0),
//                       child: Image.asset(
//                         'assets/images/logo_white_200.png',
//                         width: double.infinity,
//                         height: double.infinity,
//                         fit: BoxFit.contain,
//                         alignment: Alignment(0.0, 0.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Align(
//                       alignment: AlignmentDirectional(-1.0, 0.0),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             24.0, 0.0, 0.0, 12.0),
//                         child: AutoSizeText(
//                           'Welcome to Vouch',
//                           textAlign: TextAlign.center,
//                           style: FlutterFlowTheme.of(context)
//                               .displaySmall
//                               .override(
//                                 fontFamily: 'Bricolage Grotesque',
//                                 fontSize: 28.0,
//                                 fontWeight: FontWeight.w600,
//                                 useGoogleFonts: false,
//                               ),
//                           minFontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Icon(
//                               Icons.check,
//                               color: FlutterFlowTheme.of(context).secondaryText,
//                               size: 24.0,
//                             ),
//                           ),
//                           Expanded(
//                             child: AutoSizeText(
//                               'Search the world for people you want to connect',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w300,
//                                     useGoogleFonts: false,
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Icon(
//                               Icons.check,
//                               color: FlutterFlowTheme.of(context).secondaryText,
//                               size: 24.0,
//                             ),
//                           ),
//                           Expanded(
//                             child: AutoSizeText(
//                               'Discover new friends, and uncover new \nconnection paths',
//                               textAlign: TextAlign.start,
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w300,
//                                     useGoogleFonts: false,
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(12.0),
//                             child: Icon(
//                               Icons.check,
//                               color: FlutterFlowTheme.of(context).secondaryText,
//                               size: 24.0,
//                             ),
//                           ),
//                           Expanded(
//                             child: AutoSizeText(
//                               'Know your network, Grow your network!',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     color: FlutterFlowTheme.of(context)
//                                         .primaryBackground,
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w300,
//                                     useGoogleFonts: false,
//                                   ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: AlignmentDirectional(0.0, 0.0),
//                       child: Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             24.0, 24.0, 24.0, 48.0),
//                         child: FFButtonWidget(
//                           onPressed: () async {
//                             logFirebaseEvent(
//                                 'WELCOME_PAGE_GET_STARTED_BTN_ON_TAP');
//                             logFirebaseEvent('Button_navigate_to');
//
//                             context.pushNamed('Login');
//                           },
//                           text: 'Get Started',
//                           options: FFButtonOptions(
//                             width: double.infinity,
//                             height: 48.0,
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 1.0, 0.0, 0.0, 0.0),
//                             iconPadding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 0.0),
//                             color:
//                                 FlutterFlowTheme.of(context).primaryBackground,
//                             textStyle: FlutterFlowTheme.of(context).titleLarge,
//                             elevation: 3.0,
//                             borderSide: BorderSide(
//                               color: FlutterFlowTheme.of(context)
//                                   .primaryBackground,
//                             ),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
