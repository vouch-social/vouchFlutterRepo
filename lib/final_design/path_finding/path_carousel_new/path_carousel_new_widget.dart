import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'path_carousel_new_model.dart';
export 'path_carousel_new_model.dart';

class PathCarouselNewWidget extends StatefulWidget {
  const PathCarouselNewWidget({super.key});

  @override
  State<PathCarouselNewWidget> createState() => _PathCarouselNewWidgetState();
}

class _PathCarouselNewWidgetState extends State<PathCarouselNewWidget> {
  late PathCarouselNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PathCarouselNewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'pathCarouselNew'});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                      bottomRight: Radius.circular(60.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60.0),
                        bottomRight: Radius.circular(60.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.0,
                            height: 120.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: FFAppState().scannedUserPhotoURL,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState().scannedUserName,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Bricolage Grotesque',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Text(
                                '${getJsonField(
                                  FFAppState().getPathsJSON,
                                  r'''$.numPaths''',
                                ).toString()} paths found!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      fontSize: 14.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 48.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PATH_CAROUSEL_NEW_Icon_oa2peuty_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                              0.0, 0.0, 0.0, 12.0),
                          child: PageView.builder(
                            key: ValueKey('1'),
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage:
                                        min(0, pathDetails.length - 1)),
                            onPageChanged: (_) async {
                              logFirebaseEvent(
                                  'PATH_CAROUSEL_NEW_PageView_2nje8vlh_ON_W');
                              logFirebaseEvent('PageView_update_page_state');
                              setState(() {
                                _model.pathDetailsJSON =
                                    pathDetails[_model.pageViewCurrentIndex];
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: pathDetails.length,
                            itemBuilder: (context, pathDetailsIndex) {
                              final pathDetailsItem =
                                  pathDetails[pathDetailsIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                (pathDetailsIndex + 1)
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Bricolage Grotesque',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              '${getJsonField(
                                                pathDetailsItem,
                                                r'''$.length''',
                                              ).toString()} steps',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Bricolage Grotesque',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final fullPathDetails =
                                                getJsonField(
                                              pathDetailsItem,
                                              r'''$.path''',
                                            ).toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: fullPathDetails.length,
                                              itemBuilder: (context,
                                                  fullPathDetailsIndex) {
                                                final fullPathDetailsItem =
                                                    fullPathDetails[
                                                        fullPathDetailsIndex];
                                                return Builder(
                                                  builder: (context) {
                                                    if (FFAppState()
                                                            .hashedPhone ==
                                                        getJsonField(
                                                          fullPathDetailsItem,
                                                          r'''$.contactHashedPhone''',
                                                        )) {
                                                      return ListTile(
                                                        leading: FaIcon(
                                                          FontAwesomeIcons
                                                              .dotCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                        title: Text(
                                                          'You',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 22.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        subtitle: Text(
                                                          getJsonField(
                                                            fullPathDetailsItem,
                                                            r'''$.heading''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                  maxChars: 30),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        tileColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        dense: false,
                                                      );
                                                    } else if (FFAppState()
                                                            .scannedHashedPhone ==
                                                        getJsonField(
                                                          fullPathDetailsItem,
                                                          r'''$.contactHashedPhone''',
                                                        )) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    4.0),
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .place_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 22.0,
                                                          ),
                                                          title: Text(
                                                            getJsonField(
                                                              fullPathDetailsItem,
                                                              r'''$.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Bricolage Grotesque',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          subtitle: Text(
                                                            getJsonField(
                                                              fullPathDetailsItem,
                                                              r'''$.heading''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        30),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Bricolage Grotesque',
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          tileColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          dense: false,
                                                        ),
                                                      );
                                                    } else {
                                                      return ListTile(
                                                        leading: Icon(
                                                          Icons.more_vert,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                        title: Text(
                                                          getJsonField(
                                                            fullPathDetailsItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color:
                                                                    getJsonField(
                                                                              fullPathDetailsItem,
                                                                              r'''$.isRegistered''',
                                                                            ) !=
                                                                            null
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        subtitle: Text(
                                                          getJsonField(
                                                            fullPathDetailsItem,
                                                            r'''$.heading''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                  maxChars: 30),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        tileColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        dense: false,
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage:
                                        min(0, pathDetails.length - 1)),
                            count: pathDetails.length,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2.0,
                              spacing: 4.0,
                              radius: 16.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor: FlutterFlowTheme.of(context).accent1,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).primary,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent2,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                    child: Text(
                      'Help us make this app better by giving your feedback on if this path was interesting!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Bricolage Grotesque',
                            color: FlutterFlowTheme.of(context).tertiary,
                            fontSize: 12.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PATH_CAROUSEL_NEW_NOT_HELPFUL!_BTN_ON_TA');
                              logFirebaseEvent('Button_navigate_back');
                              context.safePop();
                            },
                            text: 'Not Helpful!',
                            icon: Icon(
                              Icons.thumb_down,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 14.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
                                  ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PATH_CAROUSEL_NEW_HELPFUL!_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');
                              _model.apiResultpxv = await StartVouchCall.call(
                                message: 'Feedback',
                                pathDetailsJson: _model.pathDetailsJSON,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 14.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 36.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
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
          ],
        ),
      ),
    );
  }
}
