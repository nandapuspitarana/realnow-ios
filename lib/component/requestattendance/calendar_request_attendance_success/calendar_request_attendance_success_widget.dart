import '/backend/api_requests/api_calls.dart';
import '/component/requestattendance/card_attendance/card_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'calendar_request_attendance_success_model.dart';
export 'calendar_request_attendance_success_model.dart';

class CalendarRequestAttendanceSuccessWidget extends StatefulWidget {
  const CalendarRequestAttendanceSuccessWidget({
    Key? key,
    required this.parameter2,
  }) : super(key: key);

  final DateTime? parameter2;

  @override
  _CalendarRequestAttendanceSuccessWidgetState createState() =>
      _CalendarRequestAttendanceSuccessWidgetState();
}

class _CalendarRequestAttendanceSuccessWidgetState
    extends State<CalendarRequestAttendanceSuccessWidget> {
  late CalendarRequestAttendanceSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => CalendarRequestAttendanceSuccessModel());
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
            ProductionHrmsGroup.listRequestAttendanceSuccessCall.call(
          userToken: FFAppState().token,
          pageSize: 100,
          page: valueOrDefault<int>(
            nextPageMarker.nextPageNumber + 1,
            0,
          ),
        ),
      ),
      padding: EdgeInsets.zero,
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

        itemBuilder: (context, _, requestAttendanceSuccessIndex) {
          final requestAttendanceSuccessItem = _model.listViewPagingController!
              .itemList![requestAttendanceSuccessIndex];
          return Visibility(
            visible: functions.parsedate(getJsonField(
                  requestAttendanceSuccessItem,
                  r'''$.in_date''',
                ).toString()) ==
                functions.parsedate(widget.parameter2?.toString()),
            child: wrapWithModel(
              model: _model.cardAttendanceModels.getModel(
                requestAttendanceSuccessIndex.toString(),
                requestAttendanceSuccessIndex,
              ),
              updateCallback: () => setState(() {}),
              child: CardAttendanceWidget(
                key: Key(
                  'Keyyq9_${requestAttendanceSuccessIndex.toString()}',
                ),
                data: requestAttendanceSuccessItem,
              ),
            ),
          );
        },
      ),
    );
  }
}
