import '/backend/api_requests/api_calls.dart';
import '/component/leave/card_request_leave/card_request_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'leave_request_reject_model.dart';
export 'leave_request_reject_model.dart';

class LeaveRequestRejectWidget extends StatefulWidget {
  const LeaveRequestRejectWidget({
    Key? key,
    int? pageSize,
    int? page,
    bool? rejected,
  })  : this.pageSize = pageSize ?? 10,
        this.page = page ?? 1,
        this.rejected = rejected ?? true,
        super(key: key);

  final int pageSize;
  final int page;
  final bool rejected;

  @override
  _LeaveRequestRejectWidgetState createState() =>
      _LeaveRequestRejectWidgetState();
}

class _LeaveRequestRejectWidgetState extends State<LeaveRequestRejectWidget> {
  late LeaveRequestRejectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveRequestRejectModel());
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
                  ProductionHrmsGroup.listRequestLeaveRejectStatusCall.call(
                pageSize: widget.pageSize,
                page: nextPageMarker.nextPageNumber + 1,
                userToken: FFAppState().token,
                rejected: true,
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

              itemBuilder: (context, _, requestLeaveIndex) {
                final requestLeaveItem = _model
                    .listViewPagingController!.itemList![requestLeaveIndex];
                return CardRequestLeaveWidget(
                  key: Key(
                      'Keyq73_${requestLeaveIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                  data: requestLeaveItem,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
