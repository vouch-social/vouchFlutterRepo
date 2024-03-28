import '/backend/api_requests/api_calls.dart';
import '/bounty/empty_bounty/empty_bounty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'all_bounty_model.dart';
export 'all_bounty_model.dart';

class AllBountyWidget extends StatefulWidget {
  const AllBountyWidget({super.key});

  @override
  State<AllBountyWidget> createState() => _AllBountyWidgetState();
}

class _AllBountyWidgetState extends State<AllBountyWidget> {
  late AllBountyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllBountyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'allBounty'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ALL_BOUNTY_PAGE_allBounty_ON_INIT_STATE');
      logFirebaseEvent('allBounty_backend_call');
      _model.apiResultoby = await GetBountyCall.call(
        hashedPhone: valueOrDefault<String>(
          FFAppState().hashedPhone,
          '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed',
        ),
        filter: 'open',
      );
      logFirebaseEvent('allBounty_update_page_state');
      setState(() {
        _model.getBountyFiltered = getJsonField(
          (_model.apiResultoby?.jsonBody ?? ''),
          r'''$''',
        );
      });
    });
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
        floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              logFirebaseEvent('ALL_BOUNTY_FloatingActionButton_codj08km');
              logFirebaseEvent('FloatingActionButton_navigate_to');

              context.pushNamed('raiseBounty');
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.campaign_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            elevation: 8.0,
            label: Text(
              'Raise Bounty',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Bricolage Grotesque',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).alternate
                      ],
                      stops: [0.5, 1.0],
                      begin: AlignmentDirectional(1.0, 1.0),
                      end: AlignmentDirectional(-1.0, -1.0),
                    ),
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
                          width: 160.0,
                          height: 160.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/path1404.png',
                            fit: BoxFit.contain,
                            alignment: Alignment(0.0, 0.0),
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
                                  'Bounty',
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
                              'Make your network, work!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 14.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(
                        _model.dropDownValue ??= '1',
                      ),
                      options: List<String>.from(['1', '2', '3']),
                      optionLabels: [
                        'Open bounties',
                        'Closed bounties',
                        'My bounties'
                      ],
                      onChanged: (val) async {
                        setState(() => _model.dropDownValue = val);
                        logFirebaseEvent(
                            'ALL_BOUNTY_DropDown_e2bqiw58_ON_FORM_WID');
                        if (_model.dropDownValue == '1') {
                          logFirebaseEvent('DropDown_backend_call');
                          _model.apiResultoby1 = await GetBountyCall.call(
                            hashedPhone: valueOrDefault<String>(
                              FFAppState().hashedPhone,
                              '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed',
                            ),
                            filter: 'open',
                          );
                          logFirebaseEvent('DropDown_update_page_state');
                          setState(() {
                            _model.getBountyFiltered = getJsonField(
                              (_model.apiResultoby1?.jsonBody ?? ''),
                              r'''$''',
                            );
                          });
                        } else {
                          if (_model.dropDownValue == '2') {
                            logFirebaseEvent('DropDown_backend_call');
                            _model.apiResultoby2 = await GetBountyCall.call(
                              hashedPhone: valueOrDefault<String>(
                                FFAppState().hashedPhone,
                                '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed',
                              ),
                              filter: 'closed',
                            );
                            logFirebaseEvent('DropDown_update_page_state');
                            setState(() {
                              _model.getBountyFiltered = getJsonField(
                                (_model.apiResultoby2?.jsonBody ?? ''),
                                r'''$''',
                              );
                            });
                          } else {
                            logFirebaseEvent('DropDown_backend_call');
                            _model.apiResultoby3 = await GetBountyCall.call(
                              hashedPhone: valueOrDefault<String>(
                                FFAppState().hashedPhone,
                                '432ee9f15bcd397b099ba359f1059edf769871cf87d2c0be98d2dce01dc167ed',
                              ),
                              filter: 'my',
                            );
                            logFirebaseEvent('DropDown_update_page_state');
                            setState(() {
                              _model.getBountyFiltered = getJsonField(
                                (_model.apiResultoby3?.jsonBody ?? ''),
                                r'''$''',
                              );
                            });
                          }
                        }

                        setState(() {});
                      },
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: 48.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: false,
                              ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      elevation: 0.0,
                      borderColor: Colors.transparent,
                      borderWidth: 0.0,
                      borderRadius: 80.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  final getBountyResults =
                      _model.getBountyFiltered?.toList() ?? [];
                  if (getBountyResults.isEmpty) {
                    return Center(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: EmptyBountyWidget(),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: getBountyResults.length,
                    itemBuilder: (context, getBountyResultsIndex) {
                      final getBountyResultsItem =
                          getBountyResults[getBountyResultsIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ALL_BOUNTY_Container_psqgrhc3_ON_TAP');
                          if (_model.dropDownValue == '3') {
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed(
                              'myBountyDetails',
                              queryParameters: {
                                'bountyDetails': serializeParam(
                                  getBountyResultsItem,
                                  ParamType.JSON,
                                ),
                                'isLinkedIn': serializeParam(
                                  getJsonField(
                                    getBountyResultsItem,
                                    r'''$.isLinkedIn''',
                                  ),
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            if (_model.dropDownValue == '1') {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed(
                                'bountyDetails',
                                queryParameters: {
                                  'bountyDetails': serializeParam(
                                    getBountyResultsItem,
                                    ParamType.JSON,
                                  ),
                                  'isLinkedIn': serializeParam(
                                    getJsonField(
                                      getBountyResultsItem,
                                      r'''$.isLinkedIn''',
                                    ),
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 8.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width: 48.0,
                                    height: 48.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        getBountyResultsItem,
                                        r'''$.bountyUser.photoURL''',
                                      ).toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 12.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Text(
                                                getJsonField(
                                                  getBountyResultsItem,
                                                  r'''$.bountyUser.name''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Bricolage Grotesque',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final contextList = getJsonField(
                                                getBountyResultsItem,
                                                r'''$.context''',
                                              ).toList();
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    contextList.length,
                                                    (contextListIndex) {
                                                  final contextListItem =
                                                      contextList[
                                                          contextListIndex];
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (contextListIndex > 0)
                                                        Text(
                                                          ' | ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Bricolage Grotesque',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      Text(
                                                        contextListItem
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Bricolage Grotesque',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 32.0,
                                      ),
                                      CircularPercentIndicator(
                                        percent: getJsonField(
                                          getBountyResultsItem,
                                          r'''$.bountyProgress''',
                                        ),
                                        radius: 13.0,
                                        lineWidth: 2.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
