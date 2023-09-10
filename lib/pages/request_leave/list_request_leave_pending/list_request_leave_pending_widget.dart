import '/component/back_button/back_button_widget.dart';
import '/component/leave/leave_request_pending/leave_request_pending_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_request_leave_pending_model.dart';
export 'list_request_leave_pending_model.dart';

class ListRequestLeavePendingWidget extends StatefulWidget {
  const ListRequestLeavePendingWidget({
    Key? key,
    int? pageSize,
    int? page,
    required this.userId,
    String? status,
  })  : this.pageSize = pageSize ?? 5,
        this.page = page ?? 1,
        this.status = status ?? 'pending',
        super(key: key);

  final int pageSize;
  final int page;
  final String? userId;
  final String status;

  @override
  _ListRequestLeavePendingWidgetState createState() =>
      _ListRequestLeavePendingWidgetState();
}

class _ListRequestLeavePendingWidgetState
    extends State<ListRequestLeavePendingWidget> {
  late ListRequestLeavePendingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListRequestLeavePendingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'list_request_leave_pending'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().requestLeaveType = widget.status;
      });
    });
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
                  fontSize: 32.0,
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
                      height: 170.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Text(
                                'Time',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  '${dateTimeFormat(
                                    'yMMMd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )} ${dateTimeFormat(
                                    'jm',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 24.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('create_request_leave');
                                  },
                                  text: 'Create request leave',
                                  options: FFButtonOptions(
                                    width: double.infinity,
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
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                                  'Need Approval',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.leaveRequestPendingModel,
                            updateCallback: () => setState(() {}),
                            child: LeaveRequestPendingWidget(
                              pageSize: 10,
                              page: 1,
                              rejected: false,
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
