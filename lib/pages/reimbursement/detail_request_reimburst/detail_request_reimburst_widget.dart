import '/component/back_button/back_button_widget.dart';
import '/component/detail_reimburs/detail_card_reimburst/detail_card_reimburst_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_request_reimburst_model.dart';
export 'detail_request_reimburst_model.dart';

class DetailRequestReimburstWidget extends StatefulWidget {
  const DetailRequestReimburstWidget({
    Key? key,
    int? id,
    this.date,
    this.status,
    String? reason,
    this.attachments,
    this.amount,
    this.full,
    required this.type,
    required this.userId,
  })  : this.id = id ?? 0,
        this.reason = reason ?? '-',
        super(key: key);

  final int id;
  final String? date;
  final String? status;
  final String reason;
  final List<dynamic>? attachments;
  final int? amount;
  final String? full;
  final String? type;
  final String? userId;

  @override
  _DetailRequestReimburstWidgetState createState() =>
      _DetailRequestReimburstWidgetState();
}

class _DetailRequestReimburstWidgetState
    extends State<DetailRequestReimburstWidget> {
  late DetailRequestReimburstModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailRequestReimburstModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detail_request_reimburst'});
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                'Detail reimburse',
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
                    ),
                    wrapWithModel(
                      model: _model.detailCardReimburstModel,
                      updateCallback: () => setState(() {}),
                      child: DetailCardReimburstWidget(
                        parameter1: widget.status,
                        parameter2: valueOrDefault<String>(
                          widget.type,
                          '-',
                        ),
                        parameter3: valueOrDefault<String>(
                          widget.full,
                          '-',
                        ),
                        parameter4: valueOrDefault<String>(
                          formatNumber(
                            widget.amount,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                          ),
                          '125000',
                        ),
                        parameter5: widget.attachments?.map((e) => e).toList(),
                        parameter6: widget.reason,
                        parameter7: widget.id,
                        userId: widget.userId!,
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
