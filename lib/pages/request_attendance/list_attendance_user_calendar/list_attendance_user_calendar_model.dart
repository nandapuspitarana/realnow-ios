import '/component/back_button/back_button_widget.dart';
import '/component/requestattendance/calendar_request_attendance_pending/calendar_request_attendance_pending_widget.dart';
import '/component/requestattendance/calendar_request_attendance_reject/calendar_request_attendance_reject_widget.dart';
import '/component/requestattendance/calendar_request_attendance_success/calendar_request_attendance_success_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListAttendanceUserCalendarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for calendarRequestAttendanceSuccess component.
  late CalendarRequestAttendanceSuccessModel
      calendarRequestAttendanceSuccessModel;
  // Model for calendarRequestAttendancePending component.
  late CalendarRequestAttendancePendingModel
      calendarRequestAttendancePendingModel;
  // Model for calendarRequestAttendanceReject component.
  late CalendarRequestAttendanceRejectModel
      calendarRequestAttendanceRejectModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarRequestAttendanceSuccessModel =
        createModel(context, () => CalendarRequestAttendanceSuccessModel());
    calendarRequestAttendancePendingModel =
        createModel(context, () => CalendarRequestAttendancePendingModel());
    calendarRequestAttendanceRejectModel =
        createModel(context, () => CalendarRequestAttendanceRejectModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    calendarRequestAttendanceSuccessModel.dispose();
    calendarRequestAttendancePendingModel.dispose();
    calendarRequestAttendanceRejectModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
