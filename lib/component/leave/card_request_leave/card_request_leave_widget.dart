import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_request_leave_model.dart';
export 'card_request_leave_model.dart';

class CardRequestLeaveWidget extends StatefulWidget {
  const CardRequestLeaveWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _CardRequestLeaveWidgetState createState() => _CardRequestLeaveWidgetState();
}

class _CardRequestLeaveWidgetState extends State<CardRequestLeaveWidget>
    with TickerProviderStateMixin {
  late CardRequestLeaveModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardRequestLeaveModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            'detail_request_leave',
            queryParameters: {
              'id': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.id''',
                ),
                ParamType.int,
              ),
              'date': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.date''',
                ).toString(),
                ParamType.String,
              ),
              'startDate': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.start_at''',
                ).toString(),
                ParamType.String,
              ),
              'endDate': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.end_at''',
                ).toString(),
                ParamType.String,
              ),
              'status': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.status.translated_name''',
                ).toString(),
                ParamType.String,
              ),
              'type': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.type.name''',
                ).toString(),
                ParamType.String,
              ),
              'reason': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.comments[0].comment''',
                ).toString(),
                ParamType.String,
              ),
              'attachments': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.attachments''',
                ),
                ParamType.JSON,
                true,
              ),
              'userId': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.user_id''',
                ).toString(),
                ParamType.String,
              ),
              'hasReview': serializeParam(
                getJsonField(
                  widget.data,
                  r'''$.last_review''',
                ),
                ParamType.JSON,
                true,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 7.0,
                color: Color(0x32171717),
                offset: Offset(0.0, 3.0),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getJsonField(
                            widget.data,
                            r'''$.type.name''',
                          ).toString(),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            '${functions.parsedate(getJsonField(
                              widget.data,
                              r'''$.start_at''',
                            ).toString())} - ${functions.parsedate(getJsonField(
                              widget.data,
                              r'''$.end_at''',
                            ).toString())}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            getJsonField(
                              widget.data,
                              r'''$.user.full_name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            '${functions.countDateTime(getJsonField(
                                  widget.data,
                                  r'''$.start_at''',
                                ).toString(), getJsonField(
                                  widget.data,
                                  r'''$.end_at''',
                                ).toString())} days',
                            style: FlutterFlowTheme.of(context).labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_right_sharp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
