import '/backend/api_requests/api_calls.dart';
import '/component/requestattendance/card_attendance/card_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'calendar_request_attendance_reject_model.dart';
export 'calendar_request_attendance_reject_model.dart';

class CalendarRequestAttendanceRejectWidget extends StatefulWidget {
  const CalendarRequestAttendanceRejectWidget({
    Key? key,
    required this.parameter2,
  }) : super(key: key);

  final DateTime? parameter2;

  @override
  _CalendarRequestAttendanceRejectWidgetState createState() =>
      _CalendarRequestAttendanceRejectWidgetState();
}

class _CalendarRequestAttendanceRejectWidgetState
    extends State<CalendarRequestAttendanceRejectWidget> {
  late CalendarRequestAttendanceRejectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarRequestAttendanceRejectModel());
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
          rejected: 'true',
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

        itemBuilder: (context, _, requestAttendancePendingIndex) {
          final requestAttendancePendingItem = _model.listViewPagingController!
              .itemList![requestAttendancePendingIndex];
          return Visibility(
            visible: functions.parsedate(getJsonField(
                  requestAttendancePendingItem,
                  r'''$.in_date''',
                ).toString()) ==
                functions.parsedate(widget.parameter2?.toString()),
            child: CardAttendanceWidget(
              key: Key(
                  'Key6xt_${requestAttendancePendingIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
              data: requestAttendancePendingItem,
            ),
          );
        },
      ),
    );
  }
}
