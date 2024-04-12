// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/custom_code/actions/index.dart' as actions;
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'login_model.dart';
// export 'login_model.dart';
//
// class LoginWidget extends StatefulWidget {
//   const LoginWidget({super.key});
//
//   @override
//   State<LoginWidget> createState() => _LoginWidgetState();
// }
//
// class _LoginWidgetState extends State<LoginWidget> {
//   late LoginModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => LoginModel());
//
//     logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
//     _model.phoneNumberController1 ??= TextEditingController();
//     _model.phoneNumberFocusNode1 ??= FocusNode();
//
//     _model.phoneNumberController2 ??= TextEditingController();
//     _model.phoneNumberFocusNode2 ??= FocusNode();
//
//     authManager.handlePhoneAuthStateChanges(context);
//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
//           _model.phoneNumberController1?.text = '+91';
//         }));
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
//     context.watch<FFAppState>();
//
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         body: Align(
//           alignment: AlignmentDirectional(0.0, 1.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: MediaQuery.sizeOf(context).height * 0.3,
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).primaryBackground,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0),
//                         topLeft: Radius.circular(0.0),
//                         topRight: Radius.circular(0.0),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional(-1.0, 0.0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 24.0, 0.0, 0.0, 8.0),
//                             child: Text(
//                               'Enter your mobile number',
//                               textAlign: TextAlign.start,
//                               style: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     fontSize: 22.0,
//                                     useGoogleFonts: false,
//                                   ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(-1.0, 0.0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 24.0, 0.0, 0.0, 24.0),
//                             child: Text(
//                               'OTP will be sent to your mobile number for verification',
//                               textAlign: TextAlign.start,
//                               style: FlutterFlowTheme.of(context)
//                                   .titleLarge
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 14.0,
//                                     useGoogleFonts: false,
//                                   ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             24.0, 48.0, 0.0, 24.0),
//                         child: Container(
//                           width: 80.0,
//                           child: TextFormField(
//                             controller: _model.phoneNumberController1,
//                             focusNode: _model.phoneNumberFocusNode1,
//                             readOnly: true,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               labelStyle: FlutterFlowTheme.of(context)
//                                   .titleMedium
//                                   .override(
//                                     fontFamily: 'Outfit',
//                                     color:
//                                         FlutterFlowTheme.of(context).alternate,
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                               alignLabelWithHint: false,
//                               hintText: '+91',
//                               enabledBorder: InputBorder.none,
//                               focusedBorder: InputBorder.none,
//                               errorBorder: InputBorder.none,
//                               focusedErrorBorder: InputBorder.none,
//                               filled: true,
//                               fillColor: FlutterFlowTheme.of(context)
//                                   .primaryBackground,
//                               contentPadding: EdgeInsetsDirectional.fromSTEB(
//                                   24.0, 0.0, 0.0, 0.0),
//                             ),
//                             style: FlutterFlowTheme.of(context)
//                                 .titleMedium
//                                 .override(
//                                   fontFamily: 'Bricolage Grotesque',
//                                   color: FlutterFlowTheme.of(context).tertiary,
//                                   fontSize: 22.0,
//                                   fontWeight: FontWeight.w500,
//                                   useGoogleFonts: false,
//                                 ),
//                             textAlign: TextAlign.start,
//                             minLines: 1,
//                             keyboardType: TextInputType.phone,
//                             validator: _model.phoneNumberController1Validator
//                                 .asValidator(context),
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(RegExp('[0-9]'))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               0.0, 48.0, 24.0, 24.0),
//                           child: TextFormField(
//                             controller: _model.phoneNumberController2,
//                             focusNode: _model.phoneNumberFocusNode2,
//                             textInputAction: TextInputAction.send,
//                             obscureText: false,
//                             decoration: InputDecoration(
//                               labelText: 'Enter 10 digit number',
//                               labelStyle: FlutterFlowTheme.of(context)
//                                   .titleMedium
//                                   .override(
//                                     fontFamily: 'Outfit',
//                                     color:
//                                         FlutterFlowTheme.of(context).alternate,
//                                     fontSize: 14.0,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                               alignLabelWithHint: false,
//                               hintText: '9876543210',
//                               hintStyle: FlutterFlowTheme.of(context)
//                                   .titleMedium
//                                   .override(
//                                     fontFamily: 'Bricolage Grotesque',
//                                     color:
//                                         FlutterFlowTheme.of(context).tertiary,
//                                     fontSize: 22.0,
//                                     fontWeight: FontWeight.w500,
//                                     useGoogleFonts: false,
//                                     lineHeight: 1.5,
//                                   ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).accent2,
//                                   width: 2.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).accent2,
//                                   width: 2.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).error,
//                                   width: 2.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: FlutterFlowTheme.of(context).error,
//                                   width: 2.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               filled: true,
//                               fillColor: Colors.white,
//                               contentPadding: EdgeInsetsDirectional.fromSTEB(
//                                   24.0, 0.0, 0.0, 0.0),
//                             ),
//                             style: FlutterFlowTheme.of(context)
//                                 .titleMedium
//                                 .override(
//                                   fontFamily: 'Bricolage Grotesque',
//                                   color:
//                                       FlutterFlowTheme.of(context).primaryText,
//                                   fontSize: 22.0,
//                                   fontWeight: FontWeight.w500,
//                                   useGoogleFonts: false,
//                                 ),
//                             textAlign: TextAlign.start,
//                             minLines: 1,
//                             maxLength: 10,
//                             maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                             buildCounter: (context,
//                                     {required currentLength,
//                                     required isFocused,
//                                     maxLength}) =>
//                                 null,
//                             keyboardType: TextInputType.phone,
//                             validator: _model.phoneNumberController2Validator
//                                 .asValidator(context),
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(RegExp('[0-9]'))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 48.0),
//                 child: FFButtonWidget(
//                   onPressed: () async {
//                     logFirebaseEvent('LOGIN_PAGE_PROCEED_TO_O_T_P_BTN_ON_TAP');
//                     logFirebaseEvent('Button_update_app_state');
//                     FFAppState().loginPhone =
//                         '${_model.phoneNumberController1.text}${_model.phoneNumberController2.text}';
//                     logFirebaseEvent('Button_custom_action');
//                     await actions.hashedPhone(
//                       FFAppState().loginPhone,
//                     );
//                     logFirebaseEvent('Button_auth');
//                     final phoneNumberVal = FFAppState().loginPhone;
//                     if (phoneNumberVal == null ||
//                         phoneNumberVal.isEmpty ||
//                         !phoneNumberVal.startsWith('+')) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               'Phone Number is required and has to start with +.'),
//                         ),
//                       );
//                       return;
//                     }
//                     await authManager.beginPhoneAuth(
//                       context: context,
//                       phoneNumber: phoneNumberVal,
//                       onCodeSent: (context) async {
//                         context.goNamedAuth(
//                           'OTP',
//                           context.mounted,
//                           queryParameters: {
//                             'mobile': serializeParam(
//                               _model.phoneNumberController2.text,
//                               ParamType.String,
//                             ),
//                           }.withoutNulls,
//                           ignoreRedirect: true,
//                         );
//                       },
//                     );
//                   },
//                   text: 'Proceed to OTP',
//                   options: FFButtonOptions(
//                     width: double.infinity,
//                     height: 48.0,
//                     padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                     iconPadding:
//                         const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                     color: FlutterFlowTheme.of(context).primary,
//                     textStyle: FlutterFlowTheme.of(context).titleSmall.override(
//                           fontFamily: 'Bricolage Grotesque',
//                           color: FlutterFlowTheme.of(context).secondaryText,
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.w500,
//                           useGoogleFonts: false,
//                         ),
//                     elevation: 3.0,
//                     borderSide: BorderSide(
//                       color: FlutterFlowTheme.of(context).primary,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
