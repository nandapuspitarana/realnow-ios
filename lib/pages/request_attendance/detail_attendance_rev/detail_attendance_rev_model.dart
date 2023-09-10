import '/component/back_button/back_button_widget.dart';
import '/component/detail_attendance/detail_card_attendance/detail_card_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailAttendanceRevModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
