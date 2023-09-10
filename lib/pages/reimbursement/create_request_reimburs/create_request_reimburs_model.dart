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
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestReimbursModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button_light component.
  late BackButtonLightModel backButtonLightModel;
  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  // Stores action output result for [Backend Call - API (add reimburse)] action in single_day widget.
  ApiCallResponse? addreimburse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonLightModel = createModel(context, () => BackButtonLightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonLightModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  Future clockInV1(BuildContext context) async {}

  /// Additional helper methods are added here.
}
