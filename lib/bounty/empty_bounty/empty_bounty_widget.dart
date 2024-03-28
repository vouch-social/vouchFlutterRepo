import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'empty_bounty_model.dart';
export 'empty_bounty_model.dart';

class EmptyBountyWidget extends StatefulWidget {
  const EmptyBountyWidget({super.key});

  @override
  State<EmptyBountyWidget> createState() => _EmptyBountyWidgetState();
}

class _EmptyBountyWidgetState extends State<EmptyBountyWidget> {
  late EmptyBountyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyBountyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.network(
            'https://lottie.host/3ad6982a-fb3a-403a-853b-d49c11489527/Qa0h0tHxYn.json',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 240.0,
            fit: BoxFit.contain,
            animate: true,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              'No Bounties raised or received! Try raising your first bounty!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Bricolage Grotesque',
                    color: FlutterFlowTheme.of(context).tertiary,
                    fontSize: 16.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
