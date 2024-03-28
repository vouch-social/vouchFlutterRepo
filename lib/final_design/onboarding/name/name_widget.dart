import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'name_model.dart';
export 'name_model.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late NameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Name'});
    _model.userNameController1 ??= TextEditingController();
    _model.userNameFocusNode1 ??= FocusNode();

    _model.userNameController2 ??= TextEditingController();
    _model.userNameFocusNode2 ??= FocusNode();

    _model.userNameController3 ??= TextEditingController();
    _model.userNameFocusNode3 ??= FocusNode();
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
        body: Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 8.0),
                        child: Text(
                          'Please enter your details',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Bricolage Grotesque',
                                    fontSize: 22.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 24.0),
                        child: Text(
                          'We\'ll use your name, photo & headline to create your Vouch profile.',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 14.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'NAME_PAGE_CircleImage_yt7qjulr_ON_TAP');
                            logFirebaseEvent(
                                'CircleImage_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxHeight: 120.00,
                              allowPhoto: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              pickerFontFamily: 'Bricolage Grotesque',
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 160.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1460904577954-8fadb262612c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8YW5pbWF0ZWQlMjBwZXJzb258ZW58MHx8fHwxNzA3NzIyNDc4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                          child: TextFormField(
                            controller: _model.userNameController1,
                            focusNode: _model.userNameFocusNode1,
                            autofillHints: [AutofillHints.givenName],
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: false,
                              hintText: 'Fungsuk',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 0.0, 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            textAlign: TextAlign.start,
                            minLines: 1,
                            validator: _model.userNameController1Validator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z]'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                          child: TextFormField(
                            controller: _model.userNameController2,
                            focusNode: _model.userNameFocusNode2,
                            autofillHints: [AutofillHints.familyName],
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: false,
                              hintText: 'Wangdo',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 0.0, 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            textAlign: TextAlign.start,
                            minLines: 1,
                            validator: _model.userNameController2Validator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[a-zA-Z]'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                          child: TextFormField(
                            controller: _model.userNameController3,
                            focusNode: _model.userNameFocusNode3,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Headline',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: false,
                              hintText:
                                  'Visionary Leader | Ivy League College | ex-Series B Company',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 0.0, 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            minLines: 1,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.userNameController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 48.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('NAME_PAGE_UPDATE_DETAILS_BTN_ON_TAP');
                    if (_model.uploadedFileUrl != null &&
                        _model.uploadedFileUrl != '') {
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        userName:
                            '${_model.userNameController1.text} ${_model.userNameController2.text}',
                        linkedInHeadLine: _model.userNameController3.text,
                        photoUrl: _model.uploadedFileUrl,
                      ));
                    } else {
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        userName:
                            '${_model.userNameController1.text} ${_model.userNameController2.text}',
                        photoUrl:
                            'https://eu.ui-avatars.com/api/?name=${_model.userNameController1.text}+${_model.userNameController2.text}&length=2',
                        linkedInHeadLine: _model.userNameController3.text,
                      ));
                    }

                    logFirebaseEvent('Button_backend_call');
                    await UpdateUserCall.call(
                      hashedPhone: FFAppState().hashedPhone,
                      name: valueOrDefault(currentUserDocument?.userName, ''),
                      photoURL: currentUserPhoto,
                      phone: currentPhoneNumber,
                      firebaseUserId: currentUserReference?.id,
                    );
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('Home');
                  },
                  text: 'Update Details',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Bricolage Grotesque',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
