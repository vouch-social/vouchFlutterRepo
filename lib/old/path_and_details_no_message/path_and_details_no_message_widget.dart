import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'path_and_details_no_message_model.dart';
export 'path_and_details_no_message_model.dart';

class PathAndDetailsNoMessageWidget extends StatefulWidget {
  const PathAndDetailsNoMessageWidget({super.key});

  @override
  State<PathAndDetailsNoMessageWidget> createState() =>
      _PathAndDetailsNoMessageWidgetState();
}

class _PathAndDetailsNoMessageWidgetState
    extends State<PathAndDetailsNoMessageWidget> {
  late PathAndDetailsNoMessageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathAndDetailsNoMessageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'pathAndDetailsNoMessage'});
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
            mainAxisAlignment: MainAxisAlignment.start,
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
                                      'PATH_AND_DETAILS_NO_MESSAGE_Icon_cidn2vi');
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
                                  fit: BoxFit.cover,
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
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
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
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 0.0),
                  child: Text(
                    'We found ${FFAppState().getPathsResponse.length.toString()} unique paths between you & ${FFAppState().scannedUserName} : ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Bricolage Grotesque',
                          fontSize: 16.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Builder(
                  builder: (context) {
                    final pathDetails = getJsonField(
                      FFAppState().getPathsJSON,
                      r'''$.paths''',
                    ).toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: pathDetails.length,
                      itemBuilder: (context, pathDetailsIndex) {
                        final pathDetailsItem = pathDetails[pathDetailsIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PATH_AND_DETAILS_NO_MESSAGE_ListTile_hsu');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed(
                              'pathStepDetailsCopy',
                              queryParameters: {
                                'pathDetails': serializeParam(
                                  pathDetailsItem,
                                  ParamType.JSON,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.route,
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                            title: Text(
                              'Path Length : ${getJsonField(
                                pathDetailsItem,
                                r'''$.length''',
                              ).toString()}',
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                            subtitle: Text(
                              'Path Strength : ${getJsonField(
                                pathDetailsItem,
                                r'''$.strength''',
                              ).toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 20.0,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            dense: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
