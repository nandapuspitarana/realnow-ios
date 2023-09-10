import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_list_attendance_daily_log_model.dart';
export 'card_list_attendance_daily_log_model.dart';

class CardListAttendanceDailyLogWidget extends StatefulWidget {
  const CardListAttendanceDailyLogWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _CardListAttendanceDailyLogWidgetState createState() =>
      _CardListAttendanceDailyLogWidgetState();
}

class _CardListAttendanceDailyLogWidgetState
    extends State<CardListAttendanceDailyLogWidget>
    with TickerProviderStateMixin {
  late CardListAttendanceDailyLogModel _model;

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
    _model = createModel(context, () => CardListAttendanceDailyLogModel());

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
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          functions.parseMMMd(valueOrDefault<String>(
                            getJsonField(
                              widget.data,
                              r'''$.in_date''',
                            ).toString(),
                            '-',
                          )),
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          getJsonField(
                            widget.data,
                            r'''$.user.full_name''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clock in',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          functions.parseTime(valueOrDefault<String>(
                            getJsonField(
                              widget.data,
                              r'''$.details[0].in_time''',
                            ).toString(),
                            '0',
                          )),
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clock out',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          getJsonField(
                                    widget.data,
                                    r'''$.details[0].out_time''',
                                  ) !=
                                  null
                              ? functions.parseTime(getJsonField(
                                  widget.data,
                                  r'''$.details[0].in_time''',
                                ).toString())
                              : '-',
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
