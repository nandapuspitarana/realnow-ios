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
import 'create_request_attendance_model.dart';
export 'create_request_attendance_model.dart';

class CreateRequestAttendanceWidget extends StatefulWidget {
  const CreateRequestAttendanceWidget({
    Key? key,
    String? duration,
  })  : this.duration = duration ?? 'single_day',
        super(key: key);

  final String duration;

  @override
  _CreateRequestAttendanceWidgetState createState() =>
      _CreateRequestAttendanceWidgetState();
}

class _CreateRequestAttendanceWidgetState
    extends State<CreateRequestAttendanceWidget> {
  late CreateRequestAttendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRequestAttendanceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'create_request_attendance'});
    _model.textController ??= TextEditingController();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: wrapWithModel(
            model: _model.backButtonLightModel,
            updateCallback: () => setState(() {}),
            child: BackButtonLightWidget(),
          ),
          title: Text(
            'Request Attendance',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 22.0,
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.date_range,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: DateTime(1900),
                                  lastDate: getCurrentTimestamp,
                                );

                                if (_datePicked1Date != null) {
                                  setState(() {
                                    _model.datePicked1 = DateTime(
                                      _datePicked1Date.year,
                                      _datePicked1Date.month,
                                      _datePicked1Date.day,
                                    );
                                  });
                                }
                                setState(() {
                                  _model.clockIn = null;
                                  _model.clockOut = null;
                                });
                                setState(() {
                                  _model.clockIn = _model.datePicked1;
                                  _model.clockOut = _model.datePicked1;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'date',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.alarm,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePicked2Time = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(_model.clockIn!),
                                );
                                if (_datePicked2Time != null) {
                                  setState(() {
                                    _model.datePicked2 = DateTime(
                                      _model.clockIn!.year,
                                      _model.clockIn!.month,
                                      _model.clockIn!.day,
                                      _datePicked2Time.hour,
                                      _datePicked2Time.minute,
                                    );
                                  });
                                }
                                setState(() {
                                  _model.clockIn = _model.datePicked2;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'jm',
                                        _model.clockIn,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'clock in',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.alarm,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePicked3Time = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(_model.clockOut!),
                                );
                                if (_datePicked3Time != null) {
                                  setState(() {
                                    _model.datePicked3 = DateTime(
                                      _model.clockOut!.year,
                                      _model.clockOut!.month,
                                      _model.clockOut!.day,
                                      _datePicked3Time.hour,
                                      _datePicked3Time.minute,
                                    );
                                  });
                                }
                                setState(() {
                                  _model.clockOut = _model.datePicked3;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      dateTimeFormat(
                                        'jm',
                                        _model.clockOut,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      'clock out',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.edit_note,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'note',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 3,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          _model.addrequestattendance =
                              await ProdHrmsRequestAttendanceGroup
                                  .addRequestAttendanceCall
                                  .call(
                            userToken: FFAppState().token,
                            employeeId: FFAppState().userId,
                            inTime: functions
                                .parseDateTimeFixingGMTSubmitReqAttendance(
                                    _model.clockIn),
                            outTime: functions
                                .parseDateTimeFixingGMTSubmitReqAttendance(
                                    _model.clockOut),
                            note: _model.textController.text,
                            inDate: functions
                                .parseDateTimeFixingGMTSubmitReqAttendance(
                                    _model.clockIn),
                          );
                          _shouldSetState = true;
                          if (ProdHrmsRequestAttendanceGroup
                              .addRequestAttendanceCall
                              .status(
                            (_model.addrequestattendance?.jsonBody ?? ''),
                          )) {
                            context.pushNamed('success_page');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  valueOrDefault<String>(
                                    ProdHrmsRequestAttendanceGroup
                                        .addRequestAttendanceCall
                                        .message(
                                          (_model.addrequestattendance
                                                  ?.jsonBody ??
                                              ''),
                                        )
                                        .toString(),
                                    'failed error request',
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'Submit Request',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
