import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_notif_component_model.dart';
export 'card_notif_component_model.dart';

class CardNotifComponentWidget extends StatefulWidget {
  const CardNotifComponentWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _CardNotifComponentWidgetState createState() =>
      _CardNotifComponentWidgetState();
}

class _CardNotifComponentWidgetState extends State<CardNotifComponentWidget> {
  late CardNotifComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardNotifComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          var _shouldSetState = false;
          if (functions.parserGetKeyUrlParameter(getJsonField(
                widget.data,
                r'''$.data.url''',
              ).toString()) ==
              'leave_id') {
            _model.markasreadleave =
                await ProdHrmsNotificationGroup.markAsReadCall.call(
              id: getJsonField(
                widget.data,
                r'''$.id''',
              ).toString(),
              userToken: FFAppState().token,
            );
            _shouldSetState = true;

            context.pushNamed(
              'list_request_leave_pending',
              queryParameters: {
                'pageSize': serializeParam(
                  10,
                  ParamType.int,
                ),
                'userId': serializeParam(
                  FFAppState().userId,
                  ParamType.String,
                ),
              }.withoutNulls,
            );

            if (!(_model.markasreadleave?.succeeded ?? true)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    ProdHrmsNotificationGroup.markAsReadCall
                        .message(
                          (_model.markasreadleave?.jsonBody ?? ''),
                        )
                        .toString(),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  duration: Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                ),
              );
            }
            if (_shouldSetState) setState(() {});
            return;
          } else if (functions.parserGetKeyUrlParameter(getJsonField(
                widget.data,
                r'''$.data.url''',
              ).toString()) ==
              'details_id') {}

          if (_shouldSetState) setState(() {});
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/logo_realnow.png'
                        : 'assets/images/logo_realnow.png',
                    width: 44.0,
                    height: 44.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getJsonField(
                            widget.data,
                            r'''$.notifier.full_name''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyLarge,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            getJsonField(
                              widget.data,
                              r'''$.data.message''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context).labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
