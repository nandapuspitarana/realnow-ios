import '/component/back_button/back_button_widget.dart';
import '/component/reimburse/approval_request_pending/approval_request_pending_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApprovalRequestReimbursementModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? pageSize = 10;

  int? page = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // Model for ApprovalRequestreimbursPending.
  late ApprovalRequestPendingModel approvalRequestreimbursPendingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    approvalRequestreimbursPendingModel =
        createModel(context, () => ApprovalRequestPendingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    approvalRequestreimbursPendingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
