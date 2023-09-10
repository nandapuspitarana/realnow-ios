import '/backend/api_requests/api_calls.dart';
import '/component/attendance/card_list_attendance_daily_log/card_list_attendance_daily_log_widget.dart';
import '/component/back_button/back_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_daily_attendance_model.dart';
export 'list_daily_attendance_model.dart';

class ListDailyAttendanceWidget extends StatefulWidget {
  const ListDailyAttendanceWidget({
    Key? key,
    int? pageSize,
    int? page,
    int? userId,
  })  : this.pageSize = pageSize ?? 5,
        this.page = page ?? 1,
        this.userId = userId ?? 0,
        super(key: key);

  final int pageSize;
  final int page;
  final int userId;

  @override
  _ListDailyAttendanceWidgetState createState() =>
      _ListDailyAttendanceWidgetState();
}

class _ListDailyAttendanceWidgetState extends State<ListDailyAttendanceWidget> {
  late ListDailyAttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListDailyAttendanceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'list_daily_attendance'});
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: wrapWithModel(
            model: _model.backButtonModel,
            updateCallback: () => setState(() {}),
            child: BackButtonWidget(),
          ),
          title: Text(
            'Daily Log',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 32.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Container(
                      width: double.infinity,
                      height: 170.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Text(
                                'Time',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${dateTimeFormat(
                                    'yMMMd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} ${dateTimeFormat(
                                    'jm',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 24.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await action_blocks.checkIsWfh(context);
                                  },
                                  text: FFAppState().userClockIn
                                      ? 'clock out'
                                      : 'clock in',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'List',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                      'list_attendance_user_calendar');
                                },
                                child: Text(
                                  'List all >',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          PagedListView<ApiPagingParams, dynamic>(
                            pagingController: _model.setStagingListController(
                              (nextPageMarker) => ProductionHrmsGroup
                                  .listAttendanceDailyLogCall
                                  .call(
                                userToken: FFAppState().token,
                                pageSize: 10,
                                page: nextPageMarker.nextPageNumber + 1,
                                userId: FFAppState().userId,
                                showAll: 'no',
                                date: functions
                                    .parsedate(getCurrentTimestamp.toString()),
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

                              itemBuilder: (context, _, attendanceListIndex) {
                                final attendanceListItem = _model
                                    .stagingListPagingController!
                                    .itemList![attendanceListIndex];
                                return wrapWithModel(
                                  model: _model.cardListAttendanceDailyLogModels
                                      .getModel(
                                    attendanceListIndex.toString(),
                                    attendanceListIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: CardListAttendanceDailyLogWidget(
                                    key: Key(
                                      'Keyj1p_${attendanceListIndex.toString()}',
                                    ),
                                    data: attendanceListItem,
                                  ),
                                );
                              },
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
      ),
    );
  }
}
