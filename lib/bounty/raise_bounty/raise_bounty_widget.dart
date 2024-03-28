import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'raise_bounty_model.dart';
export 'raise_bounty_model.dart';

class RaiseBountyWidget extends StatefulWidget {
  const RaiseBountyWidget({super.key});

  @override
  State<RaiseBountyWidget> createState() => _RaiseBountyWidgetState();
}

class _RaiseBountyWidgetState extends State<RaiseBountyWidget> {
  late RaiseBountyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RaiseBountyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'raiseBounty'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
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
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
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
                                  child: Image.asset(
                                    'assets/images/logo_circ_white.png',
                                    fit: BoxFit.fill,
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Bounty',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    'Bricolage Grotesque',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      'Ask your network to help you find!',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Bricolage Grotesque',
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 60.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'RAISE_BOUNTY_PAGE_Icon_fj714rfh_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_back');
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.chevron_left,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 36.0, 0.0, 0.0),
                      child: Text(
                        'I\'m looking to connect to',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (_model.isLinkedIn) {
                        return Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController1,
                              focusNode: _model.textFieldFocusNode1,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController1',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              autofocus: true,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 14.0,
                                      useGoogleFonts: false,
                                    ),
                                hintText:
                                    'Paste the LinkedIn URLof the person or company',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      fontSize: 14.0,
                                      useGoogleFonts: false,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                suffixIcon: _model
                                        .textController1!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.textController1?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 22,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
                                  ),
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText:
                                  'Describe the person whom you want to connect..',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 14.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 24.0, 12.0, 0.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 14.0,
                                  useGoogleFonts: false,
                                ),
                            maxLines: 10,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        );
                      }
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (_model.isLinkedIn) {
                              return Text(
                                'Want to search generally? ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: false,
                                    ),
                              );
                            } else {
                              return Text(
                                'Want to search specifically? ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Bricolage Grotesque',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: false,
                                    ),
                              );
                            }
                          },
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'RAISE_BOUNTY_PAGE_Text_amhmf8fj_ON_TAP');
                            logFirebaseEvent('Text_update_page_state');
                            setState(() {
                              _model.isLinkedIn = !_model.isLinkedIn;
                            });
                          },
                          child: Text(
                            'Click Here',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).primary,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'in the context of',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData('Job', Icons.business_center_rounded),
                          ChipData('Business', FontAwesomeIcons.exchangeAlt),
                          ChipData('Personal', Icons.person),
                          ChipData('Investment', Icons.attach_money_rounded),
                          ChipData('Research', Icons.search),
                          ChipData('Other', Icons.radar),
                          ChipData(
                              'Volunteering', Icons.volunteer_activism_rounded)
                        ],
                        onChanged: (val) =>
                            setState(() => _model.choiceChipsValues = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                useGoogleFonts: false,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 12.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context).primary,
                                    useGoogleFonts: false,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).primary,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['Other'],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 0.0, 0.0),
                      child: Text(
                        '& hoping for a response',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= 'Immediately',
                        ),
                        options: List<String>.from(
                            ['Immediately', 'Eventually', 'Leisurely']),
                        optionLabels: [
                          'Immediately (<24 hrs)',
                          'Eventually (<7 days)',
                          'Leisurely (anytime)'
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 36.0,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Bricolage Grotesque',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                              useGoogleFonts: false,
                            ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 0.0,
                        borderRadius: 100.0,
                        margin:
                            EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 4.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 48.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'RAISE_BOUNTY_PAGE_ASK_NETWORK_BTN_ON_TAP');
                      logFirebaseEvent('Button_backend_call');
                      _model.apiResulty64 = await PostBountyCall.call(
                        startNodeHashedPhone: valueOrDefault(
                            currentUserDocument?.hashedPhone, ''),
                        linkedInURL: _model.textController1.text,
                        message: _model.textController2.text,
                        contextList: _model.choiceChipsValues,
                        urgency: _model.dropDownValue,
                        isLinkedIn: _model.isLinkedIn,
                      );
                      logFirebaseEvent('Button_navigate_to');
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('allBounty');

                      setState(() {});
                    },
                    text: 'Ask Network',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Bricolage Grotesque',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
