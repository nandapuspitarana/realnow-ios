import '/backend/api_requests/api_calls.dart';
import '/component/leave/card_request_leave/card_request_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'calendar_leave_request_pending_model.dart';
export 'calendar_leave_request_pending_model.dart';

class CalendarLeaveRequestPendingWidget extends StatefulWidget {
  const CalendarLeaveRequestPendingWidget({
    Key? key,
    int? pageSize,
    int? page,
    required this.calendar,
  })  : this.pageSize = pageSize ?? 10,
        this.page = page ?? 1,
        super(key: key);

  final int pageSize;
  final int page;
  final DateTime? calendar;

  @override
  _CalendarLeaveRequestPendingWidgetState createState() =>
      _CalendarLeaveRequestPendingWidgetState();
}

class _CalendarLeaveRequestPendingWidgetState
    extends State<CalendarLeaveRequestPendingWidget> {
  late CalendarLeaveRequestPendingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarLeaveRequestPendingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PagedListView<ApiPagingParams, dynamic>(
            pagingController: _model.setListViewController(
              (nextPageMarker) =>
                  ProductionHrmsGroup.listRequestLeavePendingStatusCall.call(
                pageSize: 100,
                page: nextPageMarker.nextPageNumber + 1,
                userToken: FFAppState().token,
                rejected: false,
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

              itemBuilder: (context, _, requestLeaveIndex) {
                final requestLeaveItem = _model
                    .listViewPagingController!.itemList![requestLeaveIndex];
                return Visibility(
                  visible: functions.parsedate(widget.calendar?.toString()) ==
                      functions.parsedate(getJsonField(
                        requestLeaveItem,
                        r'''$.date''',
                      ).toString()),
                  child: CardRequestLeaveWidget(
                    key: Key(
                        'Keyc0x_${requestLeaveIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                    data: requestLeaveItem,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
