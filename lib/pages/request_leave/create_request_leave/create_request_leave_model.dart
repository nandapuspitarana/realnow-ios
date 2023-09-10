import '/backend/api_requests/api_calls.dart';
import '/component/back_button_light/back_button_light_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestLeaveModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button_light component.
  late BackButtonLightModel backButtonLightModel;
  // State field(s) for duration widget.
  String? durationValue;
  FormFieldController<String>? durationValueController;
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  // Stores action output result for [Backend Call - API (add request leave single)] action in single_day widget.
  ApiCallResponse? apiResultxb9;
  // Stores action output result for [Backend Call - API (add request leave multi)] action in multi_day widget.
  ApiCallResponse? multileave11;

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
