import '/backend/api_requests/api_calls.dart';
import '/component/back_button_light/back_button_light_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClockInFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getip)] action in clock_in_form widget.
  ApiCallResponse? apiResult3eb;
  // Model for back_button_light component.
  late BackButtonLightModel backButtonLightModel;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for notes widget.
  TextEditingController? notesController;
  String? Function(BuildContext, String?)? notesControllerValidator;
  // Stores action output result for [Backend Call - API (clock in)] action in clockin widget.
  ApiCallResponse? stagingClockinRes;
  // Stores action output result for [Backend Call - API (clock out)] action in clockout widget.
  ApiCallResponse? stagClockOutRslt;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonLightModel = createModel(context, () => BackButtonLightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonLightModel.dispose();
    notesController?.dispose();
  }

  /// Action blocks are added here.

  Future clockInV1(BuildContext context) async {}

  /// Additional helper methods are added here.
}
