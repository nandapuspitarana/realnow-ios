import '/component/back_button/back_button_widget.dart';
import '/component/reimburse/reimburse_request_pending/reimburse_request_pending_widget.dart';
import '/component/reimburse/reimburse_request_reject/reimburse_request_reject_widget.dart';
import '/component/reimburse/reimburse_request_success/reimburse_request_success_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListRequestReimbursementModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? pageSize = 10;

  int? page = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for ReimburseRequestPending component.
  late ReimburseRequestPendingModel reimburseRequestPendingModel;
  // Model for ReimburseRequestReject component.
  late ReimburseRequestRejectModel reimburseRequestRejectModel;
  // Model for ReimburseRequestSuccess component.
  late ReimburseRequestSuccessModel reimburseRequestSuccessModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    reimburseRequestPendingModel =
        createModel(context, () => ReimburseRequestPendingModel());
    reimburseRequestRejectModel =
        createModel(context, () => ReimburseRequestRejectModel());
    reimburseRequestSuccessModel =
        createModel(context, () => ReimburseRequestSuccessModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    reimburseRequestPendingModel.dispose();
    reimburseRequestRejectModel.dispose();
    reimburseRequestSuccessModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
