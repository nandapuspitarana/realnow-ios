import '/backend/api_requests/api_calls.dart';
import '/component/leave/card_request_leave/card_request_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'leave_request_pending_model.dart';
export 'leave_request_pending_model.dart';

class LeaveRequestPendingWidget extends StatefulWidget {
  const LeaveRequestPendingWidget({
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
  _LeaveRequestPendingWidgetState createState() =>
      _LeaveRequestPendingWidgetState();
}

class _LeaveRequestPendingWidgetState extends State<LeaveRequestPendingWidget> {
  late LeaveRequestPendingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveRequestPendingModel());
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
                pageSize: 5,
                page: nextPageMarker.nextPageNumber + 1,
                userToken: FFAppState().token,
                rejected: widget.rejected,
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
                return Visibility(
                  visible: FFAppState().userId !=
                      ((int var1) {
                        return "$var1";
                      }(getJsonField(
                        requestLeaveItem,
                        r'''$.user.id''',
                      ))),
                  child: wrapWithModel(
                    model: _model.cardRequestLeaveModels.getModel(
                      requestLeaveIndex.toString(),
                      requestLeaveIndex,
                    ),
                    updateCallback: () => setState(() {}),
                    child: CardRequestLeaveWidget(
                      key: Key(
                        'Keyzml_${requestLeaveIndex.toString()}',
                      ),
                      data: requestLeaveItem,
                    ),
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
