import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'path_carousel_model.dart';
export 'path_carousel_model.dart';

class PathCarouselWidget extends StatefulWidget {
  const PathCarouselWidget({super.key});

  @override
  State<PathCarouselWidget> createState() => _PathCarouselWidgetState();
}

class _PathCarouselWidgetState extends State<PathCarouselWidget> {
  late PathCarouselModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathCarouselModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'pathCarousel'});
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
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
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
                                      'PATH_CAROUSEL_PAGE_Icon_f1wl0zi5_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed('Search');
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
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        child: Text(
                          'We found ${getJsonField(
                            FFAppState().getPathsJSON,
                            r'''$.numPaths''',
                          ).toString()} paths between you & ${FFAppState().scannedUserName}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final pathDetails = getJsonField(
                      FFAppState().getPathsJSON,
                      r'''$.paths''',
                    ).toList();
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: PageView.builder(
                              key: ValueKey('1'),
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          min(0, pathDetails.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: pathDetails.length,
                              itemBuilder: (context, pathDetailsIndex) {
                                final pathDetailsItem =
                                    pathDetails[pathDetailsIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              'Path Length : ${getJsonField(
                                                pathDetailsItem,
                                                r'''$.length''',
                                              ).toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                            subtitle: Text(
                                              'Path Strength : ${getJsonField(
                                                pathDetailsItem,
                                                r'''$.strength''',
                                              ).toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Bricolage Grotesque',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 24.0, 24.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final fullPathDetails =
                                                      getJsonField(
                                                    pathDetailsItem,
                                                    r'''$.path''',
                                                  ).toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        fullPathDetails.length,
                                                    itemBuilder: (context,
                                                        fullPathDetailsIndex) {
                                                      final fullPathDetailsItem =
                                                          fullPathDetails[
                                                              fullPathDetailsIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          elevation: 0.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (getJsonField(
                                                                          fullPathDetailsItem,
                                                                          r'''$.contactHashedPhone''',
                                                                        ) ==
                                                                        FFAppState()
                                                                            .hashedPhone) {
                                                                      return Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                      );
                                                                    } else if (getJsonField(
                                                                          fullPathDetailsItem,
                                                                          r'''$.contactHashedPhone''',
                                                                        ) ==
                                                                        FFAppState()
                                                                            .scannedHashedPhone) {
                                                                      return Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove_circle_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Padding(
                                                                        padding:
                                                                            EdgeInsets.all(12.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .expand_circle_down,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              36.0,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (getJsonField(
                                                                          fullPathDetailsItem,
                                                                          r'''$.contactHashedPhone''',
                                                                        ) ==
                                                                        FFAppState()
                                                                            .hashedPhone) {
                                                                      return Text(
                                                                        'You',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Bricolage Grotesque',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 22.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    } else if (getJsonField(
                                                                          fullPathDetailsItem,
                                                                          r'''$.contactHashedPhone''',
                                                                        ) ==
                                                                        FFAppState()
                                                                            .scannedHashedPhone) {
                                                                      return Text(
                                                                        getJsonField(
                                                                          pathDetailsItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Bricolage Grotesque',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 22.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      );
                                                                    } else {
                                                                      return Text(
                                                                        getJsonField(
                                                                          pathDetailsItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Bricolage Grotesque',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
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
                                                flex: 6,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 24.0,
                                                          24.0, 48.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PATH_CAROUSEL_NOT_HELPFUL!_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_navigate_back');
                                                      context.safePop();
                                                    },
                                                    text: 'Not Helpful!',
                                                    icon: Icon(
                                                      Icons.thumb_down,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 22.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24.0, 24.0,
                                                          24.0, 48.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PATH_CAROUSEL_PAGE_HELPFUL!_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      _model.apiResultpxv =
                                                          await StartVouchCall
                                                              .call(
                                                        message: 'Feedback',
                                                        pathDetailsJson:
                                                            pathDetailsItem,
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState()
                                                          .scannedUserPhotoURL = '';
                                                      FFAppState()
                                                          .scannedUserName = '';
                                                      FFAppState()
                                                          .scannedUserMessage = '';
                                                      FFAppState()
                                                              .scannedHashedPhone =
                                                          '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed';
                                                      FFAppState()
                                                          .getPathsResponse = [];
                                                      FFAppState()
                                                          .getPathsJSON = null;
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed('Home');

                                                      setState(() {});
                                                    },
                                                    text: 'Helpful!',
                                                    icon: Icon(
                                                      Icons.thumb_up,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 22.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
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
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage:
                                            min(0, pathDetails.length - 1)),
                                count: pathDetails.length,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 16.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).primary,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
