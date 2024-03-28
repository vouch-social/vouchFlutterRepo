import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'path_step_details_no_message_model.dart';
export 'path_step_details_no_message_model.dart';

class PathStepDetailsNoMessageWidget extends StatefulWidget {
  const PathStepDetailsNoMessageWidget({
    super.key,
    required this.pathDetails,
  });

  final dynamic pathDetails;

  @override
  State<PathStepDetailsNoMessageWidget> createState() =>
      _PathStepDetailsNoMessageWidgetState();
}

class _PathStepDetailsNoMessageWidgetState
    extends State<PathStepDetailsNoMessageWidget> {
  late PathStepDetailsNoMessageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathStepDetailsNoMessageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PathStepDetailsNoMessage'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD7EFE9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PATH_STEP_DETAILS_NO_MESSAGE_Icon_91dpwj');
                                  logFirebaseEvent('Icon_navigate_back');
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 40.0,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  FFAppState().scannedUserPhotoURL,
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: AutoSizeText(
                                FFAppState().scannedUserName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Familjen Grotesk',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text(
                          'Path Length : ${getJsonField(
                            widget.pathDetails,
                            r'''$.length''',
                          ).toString()}',
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        subtitle: Text(
                          'Path Strength : ${getJsonField(
                            widget.pathDetails,
                            r'''$.strength''',
                          ).toString()}',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        dense: false,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final fullPathDetails = getJsonField(
                        widget.pathDetails,
                        r'''$.path''',
                      ).toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: fullPathDetails.length,
                        itemBuilder: (context, fullPathDetailsIndex) {
                          final fullPathDetailsItem =
                              fullPathDetails[fullPathDetailsIndex];
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.contactHashedPhone''',
                                            ) ==
                                            FFAppState().hashedPhone) {
                                          return Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Icon(
                                              Icons.circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 36.0,
                                            ),
                                          );
                                        } else if (getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.contactHashedPhone''',
                                            ) ==
                                            FFAppState().scannedHashedPhone) {
                                          return Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Icon(
                                              Icons.remove_circle_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 36.0,
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Icon(
                                              Icons.expand_circle_down,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 36.0,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.contactHashedPhone''',
                                            ) ==
                                            FFAppState().hashedPhone) {
                                          return Text(
                                            'You',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Bricolage Grotesque',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          );
                                        } else if (getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.contactHashedPhone''',
                                            ) ==
                                            FFAppState().scannedHashedPhone) {
                                          return Text(
                                            getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Bricolage Grotesque',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          );
                                        } else {
                                          return Text(
                                            getJsonField(
                                              fullPathDetailsItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Bricolage Grotesque',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 48.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PATH_STEP_DETAILS_NO_MESSAGE_NOT_HELPFUL');
                          logFirebaseEvent('Button_navigate_back');
                          context.safePop();
                        },
                        text: 'Not Helpful!',
                        icon: Icon(
                          Icons.thumb_down,
                          color: FlutterFlowTheme.of(context).error,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 22.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 48.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'PATH_STEP_DETAILS_NO_MESSAGE_HELPFUL!_BT');
                          logFirebaseEvent('Button_backend_call');
                          _model.apiResultpxv = await StartVouchCall.call(
                            message: 'Feedback',
                            pathDetailsJson: widget.pathDetails,
                          );
                          logFirebaseEvent('Button_update_app_state');
                          FFAppState().scannedUserPhotoURL = '';
                          FFAppState().scannedUserName = '';
                          FFAppState().scannedUserMessage = '';
                          FFAppState().scannedHashedPhone =
                              '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed';
                          FFAppState().getPathsResponse = [];
                          FFAppState().getPathsJSON = null;
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('Home');

                          setState(() {});
                        },
                        text: 'Helpful!',
                        icon: Icon(
                          Icons.thumb_up,
                          color: FlutterFlowTheme.of(context).warning,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 22.0,
                                useGoogleFonts: false,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
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
