import 'package:shared_preferences/shared_preferences.dart';
import 'package:vouch/new_code/backend/models/check_user_model.dart';

import '../../../custom_code/actions/get_phone_contacts.dart';
import '../../../main.dart';
import '../../../new_code/backend/backend_constants.dart';
import '../../../new_code/backend/models/base_response.dart';
import '../../../new_code/backend/models/user_data_model.dart';
import '../../../new_code/backend/network/dio_client.dart';
import '../../../new_code/backend/repos/auth_repo.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'permissions_widget.dart' show PermissionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PermissionsModel extends FlutterFlowModel<PermissionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (updateUser)] action in Permissions widget.
  ApiCallResponse? newUserID;
  //late SharedPreferences prefs;
  final AuthRepository repository = AuthRepository();
  late final DioClient _dioClient;
  PermissionsModel() {
    _dioClient = DioClient(); // Initialize DioClient
  }
  void sendUserData() async {
    var data = {
      'phone': cleanPhoneNumber(currentPhoneNumber),
      'firebaseid': currentUserReference?.id,
      'hashedphone': FFAppState().hashedPhone,
      'country_code': '91'
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
     'phone' : cleanPhoneNumber(currentPhoneNumber),
     };
    try {
      BaseResponse<CheckUserModel> apiResult =
          await repository.sendTokenToServer(data['phone']!);
      if (apiResult.status) {
        print('Api Result : ${apiResult.message}');
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
