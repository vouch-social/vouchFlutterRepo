import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/logo_transparent_bkg.png',
              width: MediaQuery.sizeOf(context).width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'editProfile': ParameterData.none(),
  'Home': ParameterData.none(),
  'Profile': ParameterData.none(),
  'Contacts': ParameterData.none(),
  'Welcome': ParameterData.none(),
  'Login': ParameterData.none(),
  'OTP': (data) async => ParameterData(
        allParams: {
          'mobile': getParameter<String>(data, 'mobile'),
        },
      ),
  'Name': ParameterData.none(),
  'Permissions': ParameterData.none(),
  'Import': ParameterData.none(),
  'Search': ParameterData.none(),
  'Hurray': (data) async => ParameterData(
        allParams: {
          'scannedUser': getParameter<DocumentReference>(data, 'scannedUser'),
        },
      ),
  'Vouch': (data) async => ParameterData(
        allParams: {},
      ),
  'userMessage': ParameterData.none(),
  'pathAndDetailsCopy': ParameterData.none(),
  'pathStepDetailsCopy': (data) async => ParameterData(
        allParams: {},
      ),
  'messages': ParameterData.none(),
  'Linkedin': ParameterData.none(),
  'pathAndDetailsNoMessage': ParameterData.none(),
  'PathStepDetailsNoMessage': (data) async => ParameterData(
        allParams: {},
      ),
  'vouchBot': ParameterData.none(),
  'navigationAnimation': (data) async => ParameterData(
        allParams: {},
      ),
  'pathCarousel': ParameterData.none(),
  'pathCarouselNew': ParameterData.none(),
  'allBounty': ParameterData.none(),
  'raiseBounty': ParameterData.none(),
  'bountyDetails': (data) async => ParameterData(
        allParams: {
          'isLinkedIn': getParameter<bool>(data, 'isLinkedIn'),
        },
      ),
  'myBountyDetails': (data) async => ParameterData(
        allParams: {
          'isLinkedIn': getParameter<bool>(data, 'isLinkedIn'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
