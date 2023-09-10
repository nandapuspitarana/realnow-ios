import '/backend/api_requests/api_calls.dart';
import '/components/requestreimburst_colom_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (prod status global)] action in home widget.
  ApiCallResponse? apiResult4n2;
  // Model for requestreimburst_colom_card component.
  late RequestreimburstColomCardModel requestreimburstColomCardModel;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController3;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    requestreimburstColomCardModel =
        createModel(context, () => RequestreimburstColomCardModel());
  }

  void dispose() {
    unfocusNode.dispose();
    requestreimburstColomCardModel.dispose();
    listViewPagingController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<ApiPagingParams, dynamic> setListViewController3(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall3 = apiCall;
    return listViewPagingController3 ??= _createListViewController3(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController3(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewListAnnouncementPage3);
  }

  void listViewListAnnouncementPage3(ApiPagingParams nextPageMarker) =>
      listViewApiCall3!(nextPageMarker)
          .then((listViewListAnnouncementResponse) {
        final pageItems = (ProdHrmsAnnouncementGroup.listAnnouncementCall
                    .data(
                      listViewListAnnouncementResponse.jsonBody,
                    )!
                    .map((e) => e)
                    .toList() ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController3?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewListAnnouncementResponse,
                )
              : null,
        );
      });
}
