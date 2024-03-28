import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Profile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_PAGE_Profile_ON_INIT_STATE');
      if (!loggedIn) {
        logFirebaseEvent('Profile_navigate_to');

        context.pushNamed('Welcome');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: Column(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 160.0,
                          height: 160.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: valueOrDefault<String>(
                              currentUserPhoto,
                              'https://images.unsplash.com/photo-1591160690555-5debfba289f0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  valueOrDefault<String>(
                                    valueOrDefault(
                                        currentUserDocument?.userName, ''),
                                    'VouchUser',
                                  ),
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
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                currentPhoneNumber,
                                '+91 - 9036303552',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 14.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (valueOrDefault(currentUserDocument?.linkedInSub, '') ==
                          null ||
                      valueOrDefault(currentUserDocument?.linkedInSub, '') ==
                          '')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_PAGE_ListTile_qo8hr7p2_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');

                            context.pushNamed('Linkedin');
                          },
                          child: ListTile(
                            title: Text(
                              'Sync LinkedIn',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            subtitle: Text(
                              'Sync your Vouch profile with LinkedIn',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Bricolage Grotesque',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
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
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_ListTile_84mdhvnu_ON_TAP');
                        logFirebaseEvent('ListTile_navigate_to');

                        context.pushNamed('editProfile');
                      },
                      child: ListTile(
                        title: Text(
                          'Edit Profile Details',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                useGoogleFonts: false,
                              ),
                        ),
                        subtitle: Text(
                          'Change your name, email',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'PROFILE_PAGE_ListTile_45xs2h0n_ON_TAP');
                          logFirebaseEvent('ListTile_share');
                          await Share.share(
                            'https://www.vouch.social/',
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            'Refer your friends',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          subtitle: Text(
                            '10x your paths, grow your network',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Bricolage Grotesque',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_ListTile_0ghdah9f_ON_TAP');
                        logFirebaseEvent('ListTile_navigate_to');

                        context.pushNamed('Contacts');
                      },
                      child: ListTile(
                        title: Text(
                          'Contacts',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                useGoogleFonts: false,
                              ),
                        ),
                        subtitle: Text(
                          'Sync your latest contacts. Check details',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_ListTile_mjswja5q_ON_TAP');
                        logFirebaseEvent('ListTile_navigate_to');

                        context.pushNamed('editProfile');
                      },
                      child: ListTile(
                        title: Text(
                          'Explore VouchBot',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                useGoogleFonts: false,
                              ),
                        ),
                        subtitle: Text(
                          'Explore new features in the VouchBot',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 120.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROFILE_PAGE_ListTile_oj6qztst_ON_TAP');
                        logFirebaseEvent('ListTile_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: Text('LogOut?'),
                                    content: Text(
                                        'Do you wish to log out from the application?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            alertDialogContext, true),
                                        child: Text('Confirm'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('ListTile_navigate_to');

                          context.pushNamedAuth('Welcome', context.mounted);

                          logFirebaseEvent('ListTile_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          return;
                        } else {
                          logFirebaseEvent(
                              'ListTile_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          return;
                        }
                      },
                      child: ListTile(
                        title: Text(
                          'Logout',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                useGoogleFonts: false,
                              ),
                        ),
                        subtitle: Text(
                          dateTimeFormat(
                            'MMMMEEEEd',
                            getCurrentTimestamp,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Bricolage Grotesque',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
                      ),
                    ),
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
