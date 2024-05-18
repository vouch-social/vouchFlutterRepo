import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../services/app_state.dart';
import '../../../../auth/firebase_auth/auth_util.dart';
import '../../../../auth/checkAuth.dart';
import '../../../../flutter_flow/flutter_flow_model.dart';
import '../../../../flutter_flow/flutter_flow_timer.dart';
import '../../../../main.dart';
import '../../../backend/backend_constants.dart';
import '../../../backend/models/base_response.dart';
import '../../../backend/models/check_user_model.dart';
import '../../../backend/models/user_data_model.dart';
import '../../../backend/repos/auth_repo.dart';
import '../../permissions/permissions_screen.dart';
import '../login_screen/components/country_code_remover.dart';
import 'otp_screen.dart';

class OtpModel extends FlutterFlowModel<OtpScreen> {
  ///  Local state fields for this page.

  bool pincode = false;

  bool timerDone = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
  FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));


  final AuthRepository repository = AuthRepository();

  Future<void> sendUserData({String? phoneWOCC, String? countryCode}) async {
    var data = {
      'phone': phoneWOCC,
      'firebaseid': currentUserReference?.id,
      'hashedphone': FFAppState().hashedPhone,
      'country_code': countryCode
    };
    try {
      if (currentUserReference != null && data['firebaseid'] != null) {
        BaseResponse<UserModel> apiResult = await repository.sendUser(
          data['firebaseid']!,
          data['phone']!,
          data['hashedphone']!,
          data['country_code']!,
        );

        if (apiResult.status) {
          print("Auth Tokennn: ${apiResult.data!.data.accessToken}");
          prefs?.setString(authToken, apiResult.data!.data.accessToken);
          print("Auth Tokennn: ${prefs?.getString(authToken)}");
          sendToken();
        }
      } else {
        print('CurrentUserReference or firebaseId is null');
      }
    } catch (error) {
      print("MY Error : ${error}");
    }
  }

  void sendToken() async {
    var data = {
      'phone': cleanPhone(currentPhoneNumber),
    };
    try {
      BaseResponse<CheckUserModel> apiResult =
      await repository.sendTokenToServer(data['phone']!);
      if (apiResult.status) {
        print('Api Result : ${apiResult.message}');
        // Get.to(() => const PermissionsScreen());
        Get.offAll(() => newCustomNav());
      } else {
        print("No Access TokenFound");
      }
    } catch (error) {
      print(error);
    }
  }


  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
    timerController.dispose();
  }

/// Action blocks are added here.

/// Additional helper methods are added here.
}