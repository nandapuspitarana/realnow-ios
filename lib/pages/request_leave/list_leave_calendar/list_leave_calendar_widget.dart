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
import 'list_leave_calendar_model.dart';
export 'list_leave_calendar_model.dart';

class ListLeaveCalendarWidget extends StatefulWidget {
  const ListLeaveCalendarWidget({
    Key? key,
    int? pageSize,
    int? page,
    int? userId,
  })  : this.pageSize = pageSize ?? 5,
        this.page = page ?? 1,
        this.userId = userId ?? 0,
        super(key: key);

  final int pageSize;
  final int page;
  final int userId;

  @override
  _ListLeaveCalendarWidgetState createState() =>
      _ListLeaveCalendarWidgetState();
}

class _ListLeaveCalendarWidgetState extends State<ListLeaveCalendarWidget> {
  late ListLeaveCalendarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListLeaveCalendarModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'list_leave_calendar'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('create_request_leave');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add_outlined,
            color: FlutterFlowTheme.of(context).primaryBackground,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: wrapWithModel(
            model: _model.backButtonModel,
            updateCallback: () => setState(() {}),
            child: BackButtonWidget(),
          ),
          title: Text(
            'Request Leave',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  fontSize: 28.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Container(
                      width: double.infinity,
                      height: 440.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: FlutterFlowCalendar(
                        color: FlutterFlowTheme.of(context).primary,
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        weekFormat: false,
                        weekStartsMonday: false,
                        initialDate: getCurrentTimestamp,
                        rowHeight: 60.0,
                        onChange: (DateTimeRange? newSelectedDate) async {
                          _model.calendarSelectedDay = newSelectedDate;
                          setState(() {
                            FFAppState().RequestAttendanceDate =
                                _model.calendarSelectedDay?.end;
                          });
                          setState(() {});
                        },
                        titleStyle: FlutterFlowTheme.of(context).headlineSmall,
                        dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
                        dateStyle: FlutterFlowTheme.of(context).bodyMedium,
                        selectedDateStyle:
                            FlutterFlowTheme.of(context).titleSmall,
                        inactiveDateStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).accent1,
                                ),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Text(
                                  'List',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= '',
                                ),
                                options: ['pending', 'reject', 'success'],
                                optionLabels: ['pending', 'reject', 'success'],
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue = val);
                                  setState(() {
                                    FFAppState().requestAttendanceDropdown =
                                        _model.dropDownValue!;
                                  });
                                },
                                width: 120.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Status',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                          if (_model.dropDownValue == 'pending')
                            wrapWithModel(
                              model: _model.calendarLeaveRequestPendingModel,
                              updateCallback: () => setState(() {}),
                              child: CalendarLeaveRequestPendingWidget(
                                calendar: _model.calendarSelectedDay!.start,
                              ),
                            ),
                          if (_model.dropDownValue == 'success')
                            wrapWithModel(
                              model: _model.calendarLeaveRequestSuccessModel,
                              updateCallback: () => setState(() {}),
                              child: CalendarLeaveRequestSuccessWidget(
                                date: _model.calendarSelectedDay!.start,
                              ),
                            ),
                          if (_model.dropDownValue == 'reject')
                            wrapWithModel(
                              model: _model.calendarLeaveRequestRejectModel,
                              updateCallback: () => setState(() {}),
                              child: CalendarLeaveRequestRejectWidget(
                                calendar: _model.calendarSelectedDay!.start,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
