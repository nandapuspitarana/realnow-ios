import '/component/back_button/back_button_widget.dart';
import '/component/detail_leave/detail_card_leave/detail_card_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailRequestLeaveModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // Model for detail_card_leave component.
  late DetailCardLeaveModel detailCardLeaveModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    detailCardLeaveModel = createModel(context, () => DetailCardLeaveModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    detailCardLeaveModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
