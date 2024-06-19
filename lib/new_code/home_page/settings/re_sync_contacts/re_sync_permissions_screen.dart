import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vouch/generated/assets.dart';
import 'package:vouch/new_code/common_widgets/myAppBar.dart';
import 'package:vouch/new_code/common_widgets/vector.dart';
import 'package:vouch/new_code/home_page/settings/re_sync_contacts/contacts_call_logs/contacts_re_import_screen.dart';
import 'package:vouch/new_code/onboarding/permissions/contacts_call_logs/import_screen.dart';
import '../../../../main.dart';
import '../../../backend/backend_constants.dart';
import '../../../onboarding/permissions/contacts_call_logs/my_contacts_class.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 're_sync_permissions_model.dart';
export 're_sync_permissions_model.dart';

class ReSyncPermissionsScreen extends StatefulWidget {
  const ReSyncPermissionsScreen({
    super.key,
  });
  @override
  State<ReSyncPermissionsScreen> createState() => _ReSyncPermissionsScreenState();
}

class _ReSyncPermissionsScreenState extends State<ReSyncPermissionsScreen> {
  late ContactsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Permissions'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PERMISSIONS_Permissions_ON_INIT_STATE');
      logFirebaseEvent('Permissions_backend_call');
      // _model.newUserID = await UpdateUserCall.call(
      //   firebaseUserId: currentUserReference?.id,
      //   phone: cleanPhoneNumber(currentPhoneNumber),
      //   hashedPhone: FFAppState().hashedPhone,
      // );
      // logFirebaseEvent('Permissions_backend_call');
      //
      // await currentUserReference!.update(createUsersRecordData(
      //   hashedPhone: FFAppState().hashedPhone,
      // ));
      _fetchContacts();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  List<Contact> _contacts = [];
  // List<CallLogEntry> _callLogs = [];



  Future<void> _fetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      List<Contact> allContacts = await myGetContacts();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() {
          _contacts = allContacts.toList();
        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          showBackButton: true,
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.0.h,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 176.0.w,
                      width: 176.0.w,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).fixedWhite,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.assetsCleanedPhoneBook,
                        height: 124,
                          width: 124,
                          // fit: BoxFit.cover,
                          // color: Colors.red
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 148.0.h),
                  AutoSizeText(
                    'Contacts Permission',
                    style: FlutterFlowTheme.of(context).displayMedium,
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  AutoSizeText(
                    'So that we can build your Vouch network better',
                    style: FlutterFlowTheme.of(context).titleSmall
                  ),
                  SizedBox(
                    height: 28.0.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      AutoSizeText(
                        'All phone book data is encrypted',
                        style: FlutterFlowTheme.of(context).labelSmall
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      AutoSizeText(
                        'We will never store your contacts details',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      AutoSizeText(
                        'Total ${prefs?.getInt(deviceContacts)} device contacts',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0.h,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.check,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      AutoSizeText(
                        'Total contacts synced is ${prefs?.getInt(contactsAdded) ?? 0}',
                        style: FlutterFlowTheme.of(context).labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'PERMISSIONS_START_BUILDING_NETWORK_BTN_O');
                      logFirebaseEvent('Button_request_permissions');
                      await Permission.contacts.request();
                      // await Permission.phone.request();
                      logFirebaseEvent('Button_navigate_to');

                      Get.to(() => ReImportContactsScreen());
                    },
                    text: 'Re-Sync Contacts',
                    options: CTAButton(context)
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.assetsLock,
                        height: 24.h,
                        width: 24.w,
                      ),
                      AutoSizeText(
                        '256 bit encrypted',
                        style: FlutterFlowTheme.of(context).labelExtraSmall
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
