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

class ListDailyAttendanceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // State field(s) for stagingList widget.

  PagingController<ApiPagingParams, dynamic>? stagingListPagingController;
  Function(ApiPagingParams nextPageMarker)? stagingListApiCall;

  // Models for card_list_attendance_daily_log dynamic component.
  late FlutterFlowDynamicModels<CardListAttendanceDailyLogModel>
      cardListAttendanceDailyLogModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    cardListAttendanceDailyLogModels =
        FlutterFlowDynamicModels(() => CardListAttendanceDailyLogModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    stagingListPagingController?.dispose();
    cardListAttendanceDailyLogModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setStagingListController(
    Function(ApiPagingParams) apiCall,
  ) {
    stagingListApiCall = apiCall;
    return stagingListPagingController ??=
        _createStagingListController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createStagingListController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(stagingListListAttendanceDailyLogPage);
  }

  void stagingListListAttendanceDailyLogPage(ApiPagingParams nextPageMarker) =>
      stagingListApiCall!(nextPageMarker)
          .then((stagingListListAttendanceDailyLogResponse) {
        final pageItems = (ProductionHrmsGroup.listAttendanceDailyLogCall
                    .data(
                      stagingListListAttendanceDailyLogResponse.jsonBody,
                    )!
                    .map((e) => e)
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        stagingListPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: stagingListListAttendanceDailyLogResponse,
                )
              : null,
        );
      });
}
