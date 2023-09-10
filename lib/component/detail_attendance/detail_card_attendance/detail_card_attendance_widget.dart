import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_card_attendance_model.dart';
export 'detail_card_attendance_model.dart';

class DetailCardAttendanceWidget extends StatefulWidget {
  const DetailCardAttendanceWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    int? parameter6,
    String? parameter7,
    String? parameter8,
  })  : this.parameter6 = parameter6 ?? 0,
        this.parameter7 = parameter7 ?? 'Pending',
        this.parameter8 = parameter8 ?? 'Pending',
        super(key: key);

  final int? parameter1;
  final String? parameter2;
  final String? parameter3;
  final dynamic parameter4;
  final dynamic parameter5;
  final int parameter6;
  final String parameter7;
  final String parameter8;

  @override
  _DetailCardAttendanceWidgetState createState() =>
      _DetailCardAttendanceWidgetState();
}

class _DetailCardAttendanceWidgetState
    extends State<DetailCardAttendanceWidget> {
  late DetailCardAttendanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailCardAttendanceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Text(
                  'List ${(widget.parameter1! + 1).toString()}',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              '1',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Clock in',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.parseTime(widget.parameter2),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              '1',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Clock out',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.parseTime(widget.parameter3),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Text(
                              '1',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Icon(
                              Icons.account_balance_outlined,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'status',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter4!.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Notes :',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.parameter5 == null
                                        ? '-'
                                        : widget.parameter5?.toString(),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
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
          ],
        ),
      ),
    );
  }
}
