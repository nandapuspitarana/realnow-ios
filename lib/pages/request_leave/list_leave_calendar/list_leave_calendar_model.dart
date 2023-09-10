import '/component/back_button/back_button_widget.dart';
import '/component/leave/calendar_leave_request_pending/calendar_leave_request_pending_widget.dart';
import '/component/leave/calendar_leave_request_reject/calendar_leave_request_reject_widget.dart';
import '/component/leave/calendar_leave_request_success/calendar_leave_request_success_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListLeaveCalendarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for back_button component.
  late BackButtonModel backButtonModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for CalendarLeaveRequestPending component.
  late CalendarLeaveRequestPendingModel calendarLeaveRequestPendingModel;
  // Model for CalendarLeaveRequestSuccess component.
  late CalendarLeaveRequestSuccessModel calendarLeaveRequestSuccessModel;
  // Model for CalendarLeaveRequestReject component.
  late CalendarLeaveRequestRejectModel calendarLeaveRequestRejectModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    backButtonModel = createModel(context, () => BackButtonModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarLeaveRequestPendingModel =
        createModel(context, () => CalendarLeaveRequestPendingModel());
    calendarLeaveRequestSuccessModel =
        createModel(context, () => CalendarLeaveRequestSuccessModel());
    calendarLeaveRequestRejectModel =
        createModel(context, () => CalendarLeaveRequestRejectModel());
  }

  void dispose() {
    unfocusNode.dispose();
    backButtonModel.dispose();
    calendarLeaveRequestPendingModel.dispose();
    calendarLeaveRequestSuccessModel.dispose();
    calendarLeaveRequestRejectModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
