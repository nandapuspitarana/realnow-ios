import '/backend/api_requests/api_calls.dart';
import '/component/back_button_light/back_button_light_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestAttendanceModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? clockIn;

  DateTime? clockOut;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button_light component.
  late BackButtonLightModel backButtonLightModel;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (add request attendance)] action in submit_req_attendance widget.
  ApiCallResponse? addrequestattendance;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonLightModel = createModel(context, () => BackButtonLightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonLightModel.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  Future clockInV1(BuildContext context) async {}

  /// Additional helper methods are added here.
}
