import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';
import 'package:vouch/new_code/home_page/new_home_page.dart';
import '../../../main.dart';
import '../../../new_code/backend/backend_constants.dart';
import '../../../new_code/backend/models/base_response.dart';
import '../../../new_code/backend/models/user_data_model.dart';
import '../../../new_code/backend/repos/auth_repo.dart';
import '../auth_screen/login_screen/components/country_code_remover.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'permissions_screen.dart' show PermissionsScreen;
import 'package:flutter/material.dart';

class ContactsModel extends FlutterFlowModel<PermissionsScreen> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateUser)] action in Permissions widget.
  ApiCallResponse? newUserID;
  //late SharedPreferences prefs;
  final AuthRepository repository = AuthRepository();

  void sendUserData({String? phoneWOCC, String? countryCode}) async {
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
        Get.to(() => const PermissionsScreen());
      } else {
        print("No Access TokenFound");
      }
    } catch (error) {
      print(error);
    }
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
