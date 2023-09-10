import '/component/back_button/back_button_widget.dart';
import '/component/detail_leave/detail_card_leave/detail_card_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_request_leave_model.dart';
export 'detail_request_leave_model.dart';

class DetailRequestLeaveWidget extends StatefulWidget {
  const DetailRequestLeaveWidget({
    Key? key,
    int? id,
    this.date,
    this.startDate,
    this.endDate,
    this.status,
    this.type,
    String? reason,
    this.attachments,
    required this.userId,
    required this.hasReview,
  })  : this.id = id ?? 0,
        this.reason = reason ?? '-',
        super(key: key);

  final int id;
  final String? date;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? type;
  final String reason;
  final List<dynamic>? attachments;
  final String? userId;
  final List<dynamic>? hasReview;

  @override
  _DetailRequestLeaveWidgetState createState() =>
      _DetailRequestLeaveWidgetState();
}

class _DetailRequestLeaveWidgetState extends State<DetailRequestLeaveWidget> {
  late DetailRequestLeaveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailRequestLeaveModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detail_request_leave'});
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Detail leave',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                functions.parsedate(widget.date),
                                '2023-07-24',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 32.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.detailCardLeaveModel,
                      updateCallback: () => setState(() {}),
                      child: DetailCardLeaveWidget(
                        parameter1: widget.startDate,
                        parameter2: widget.endDate,
                        parameter3: widget.status,
                        parameter4: widget.type,
                        parameter5: widget.attachments?.map((e) => e).toList(),
                        parameter6: widget.reason,
                        parameter7: widget.id,
                        parameter8: widget.status,
                        userId: widget.userId,
                        hasReview: widget.hasReview,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
