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
import 'create_request_leave_model.dart';
export 'create_request_leave_model.dart';

class CreateRequestLeaveWidget extends StatefulWidget {
  const CreateRequestLeaveWidget({Key? key}) : super(key: key);

  @override
  _CreateRequestLeaveWidgetState createState() =>
      _CreateRequestLeaveWidgetState();
}

class _CreateRequestLeaveWidgetState extends State<CreateRequestLeaveWidget> {
  late CreateRequestLeaveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRequestLeaveModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'create_request_leave'});
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
            'Request Leave',
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
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.durationValueController ??=
                                FormFieldController<String>(
                              _model.durationValue ??= 'single_day',
                            ),
                            options: ['single_day', 'multi_day'],
                            optionLabels: ['Single Day', 'Multi Day'],
                            onChanged: (val) =>
                                setState(() => _model.durationValue = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hintText: 'Duration leave',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: ProductionHrmsGroup.requestTypeCall.call(
                              userToken: FFAppState().token,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final typeRequestTypeResponse = snapshot.data!;
                              return FlutterFlowDropDown<String>(
                                controller: _model.typeValueController ??=
                                    FormFieldController<String>(null),
                                options:
                                    (ProductionHrmsGroup.requestTypeCall.value(
                                  typeRequestTypeResponse.jsonBody,
                                ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()!
                                        .map((e) => e.toString())
                                        .toList(),
                                optionLabels:
                                    (ProductionHrmsGroup.requestTypeCall.label(
                                  typeRequestTypeResponse.jsonBody,
                                ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()!
                                        .map((e) => e.toString())
                                        .toList(),
                                onChanged: (val) =>
                                    setState(() => _model.typeValue = val),
                                width: 300.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'type',
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
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_model.durationValue == 'multi_day')
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
                                  final _datePicked1Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
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
                                },
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.datePicked1,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.alarm,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
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
                                  final _datePicked2Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePicked2Date != null) {
                                    setState(() {
                                      _model.datePicked2 = DateTime(
                                        _datePicked2Date.year,
                                        _datePicked2Date.month,
                                        _datePicked2Date.day,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.datePicked2,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (_model.durationValue == 'single_day')
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
                                  final _datePicked3Date = await showDatePicker(
                                    context: context,
                                    initialDate: getCurrentTimestamp,
                                    firstDate: getCurrentTimestamp,
                                    lastDate: DateTime(2050),
                                  );

                                  if (_datePicked3Date != null) {
                                    setState(() {
                                      _model.datePicked3 = DateTime(
                                        _datePicked3Date.year,
                                        _datePicked3Date.month,
                                        _datePicked3Date.day,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        dateTimeFormat(
                                          'yMMMd',
                                          _model.datePicked3,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.attach_file,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final selectedFiles = await selectFiles(
                              multiFile: true,
                            );
                            if (selectedFiles != null) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                selectedUploadedFiles = selectedFiles
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                        ))
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedFiles.length) {
                                setState(() {
                                  _model.uploadedLocalFiles =
                                      selectedUploadedFiles;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }
                          },
                          text: 'attachement',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            () {
                              if (_model.isDataUploading) {
                                return 'Uploading Data';
                              } else if (_model.uploadedLocalFiles.length > 0) {
                                return 'Uploaded';
                              } else {
                                return '-';
                              }
                            }(),
                            '-',
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  if (_model.durationValue == 'single_day')
                    Align(
                      alignment: AlignmentDirectional(1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.apiResultxb9 = await ProductionHrmsGroup
                                .addRequestLeaveSingleCall
                                .call(
                              userToken: FFAppState().token,
                              leaveDuration: _model.durationValue,
                              dayType: 'first_half',
                              leaveTypeId: _model.typeValue,
                              employeeId: FFAppState().userId,
                              note: _model.textController.text,
                              date: functions
                                  .parsedate(_model.datePicked3?.toString()),
                              attachmentsList: _model.uploadedLocalFiles,
                            );
                            _shouldSetState = true;
                            if ((_model.apiResultxb9?.succeeded ?? true)) {
                              context.pushNamed('success_page');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ProductionHrmsGroup
                                        .addRequestLeaveSingleCall
                                        .message(
                                          (_model.apiResultxb9?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                            width: 140.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                  if (_model.durationValue == 'multi_day')
                    Align(
                      alignment: AlignmentDirectional(1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            _model.multileave11 = await ProductionHrmsGroup
                                .addRequestLeaveMultiCall
                                .call(
                              userToken: FFAppState().token,
                              leaveDuration: _model.durationValue,
                              dayType: 'first_half',
                              leaveTypeId: _model.typeValue,
                              employeeId: FFAppState().userId,
                              startDate: functions
                                  .parsedate(_model.datePicked1?.toString()),
                              endDate: functions
                                  .parsedate(_model.datePicked2?.toString()),
                              note: _model.textController.text,
                              attachmentsList: _model.uploadedLocalFiles,
                            );
                            _shouldSetState = true;
                            if ((_model.multileave11?.succeeded ?? true)) {
                              context.pushNamed('success_page');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ProductionHrmsGroup.addRequestLeaveMultiCall
                                        .message(
                                          (_model.multileave11?.jsonBody ?? ''),
                                        )
                                        .toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
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
                            width: 140.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
