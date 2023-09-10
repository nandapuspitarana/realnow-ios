import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'additionaluserlogin_model.dart';
export 'additionaluserlogin_model.dart';

class AdditionaluserloginWidget extends StatefulWidget {
  const AdditionaluserloginWidget({Key? key}) : super(key: key);

  @override
  _AdditionaluserloginWidgetState createState() =>
      _AdditionaluserloginWidgetState();
}

class _AdditionaluserloginWidgetState extends State<AdditionaluserloginWidget> {
  late AdditionaluserloginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdditionaluserloginModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
          child: Container(
            width: 370.0,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      height: 2.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: 70.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      'OR',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: FFButtonWidget(
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              final user = await authManager.signInWithGoogle(context);
              if (user == null) {
                return;
              }

              context.goNamedAuth('home', context.mounted);
            },
            text: 'Continue with Google',
            icon: FaIcon(
              FontAwesomeIcons.google,
              size: 20.0,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 44.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
              hoverColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
        ),

        // You will have to add an action on this rich text to go to your login page.
        Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(),
                  ),
                  TextSpan(
                    text: 'Sign Up here',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
