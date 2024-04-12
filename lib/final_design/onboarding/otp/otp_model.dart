// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_timer.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'otp_widget.dart' show OtpWidget;
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:stop_watch_timer/stop_watch_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class OtpModel extends FlutterFlowModel<OtpWidget> {
//   ///  Local state fields for this page.
//
//   bool pincode = false;
//
//   bool timerDone = false;
//
//   ///  State fields for stateful widgets in this page.
//
//   final unfocusNode = FocusNode();
//   // State field(s) for PinCode widget.
//   TextEditingController? pinCodeController;
//   String? Function(BuildContext, String?)? pinCodeControllerValidator;
//   // State field(s) for Timer widget.
//   int timerMilliseconds = 30000;
//   String timerValue = StopWatchTimer.getDisplayTime(
//     30000,
//     hours: false,
//     milliSecond: false,
//   );
//   FlutterFlowTimerController timerController =
//       FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));
//
//   /// Initialization and disposal methods.
//
//   @override
//   void initState(BuildContext context) {
//     pinCodeController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     unfocusNode.dispose();
//     pinCodeController?.dispose();
//     timerController.dispose();
//   }
//
//   /// Action blocks are added here.
//
//   /// Additional helper methods are added here.
// }
