import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'request_attendance_pending_model.dart';
export 'request_attendance_pending_model.dart';

class RequestAttendancePendingWidget extends StatefulWidget {
  const RequestAttendancePendingWidget({
    Key? key,
    String? date,
  })  : this.date = date ?? '2023-07-31',
        super(key: key);

  final String date;

  @override
  _RequestAttendancePendingWidgetState createState() =>
      _RequestAttendancePendingWidgetState();
}

class _RequestAttendancePendingWidgetState
    extends State<RequestAttendancePendingWidget>
    with TickerProviderStateMixin {
  late RequestAttendancePendingModel _model;

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
    _model = createModel(context, () => RequestAttendancePendingModel());

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

    return PagedListView<ApiPagingParams, dynamic>(
      pagingController: _model.setListViewController(
        (nextPageMarker) =>
            ProdHrmsRequestAttendanceGroup.listRequestAttendanceCall.call(
          perPage: 100,
          page: valueOrDefault<int>(
            nextPageMarker.nextPageNumber + 1,
            0,
          ),
          userToken: FFAppState().token,
          rejected: 'false',
          showAll: 'yes',
        ),
      ),
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      reverse: false,
      scrollDirection: Axis.vertical,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        // Customize what your widget looks like when it's loading the first page.
        firstPageProgressIndicatorBuilder: (_) => Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
        // Customize what your widget looks like when it's loading another page.
        newPageProgressIndicatorBuilder: (_) => Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),

        itemBuilder: (context, _, requestAttendanceIndex) {
          final requestAttendanceItem = _model
              .listViewPagingController!.itemList![requestAttendanceIndex];
          return Visibility(
            visible: FFAppState().userId !=
                ((int var1) {
                  return "$var1";
                }(getJsonField(
                  requestAttendanceItem,
                  r'''$.user.id''',
                ))),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'detail_attendance_rev',
                    queryParameters: {
                      'id': serializeParam(
                        getJsonField(
                          requestAttendanceItem,
                          r'''$.id''',
                        ),
                        ParamType.int,
                      ),
                      'date': serializeParam(
                        getJsonField(
                          requestAttendanceItem,
                          r'''$.in_date''',
                        ).toString(),
                        ParamType.String,
                      ),
                      'detail': serializeParam(
                        getJsonField(
                          requestAttendanceItem,
                          r'''$.details''',
                        ),
                        ParamType.JSON,
                        true,
                      ),
                      'status': serializeParam(
                        'Pending',
                        ParamType.String,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    functions.parseMMMd(getJsonField(
                                      requestAttendanceItem,
                                      r'''$.in_date''',
                                    ).toString()),
                                    '0-0-0-0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      requestAttendanceItem,
                                      r'''$.details[0].status.translated_name''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      requestAttendanceItem,
                                      r'''$.user.full_name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Clock in',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.parseTime(getJsonField(
                                        requestAttendanceItem,
                                        r'''$.details[0].in_time''',
                                      ).toString()),
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Clock out',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 13.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                                requestAttendanceItem,
                                                r'''$.details[0].out_time''',
                                              ) ==
                                              null
                                          ? '-'
                                          : functions.parseTime(getJsonField(
                                              requestAttendanceItem,
                                              r'''$.details[0].out_time''',
                                            ).toString()),
                                      '-',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).labelSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.chevron_right_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          );
        },
      ),
    );
  }
}
