import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_card_reimburst_model.dart';
export 'detail_card_reimburst_model.dart';

class DetailCardReimburstWidget extends StatefulWidget {
  const DetailCardReimburstWidget({
    Key? key,
    this.parameter1,
    required this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    String? parameter6,
    int? parameter7,
    required this.userId,
  })  : this.parameter6 = parameter6 ?? '-',
        this.parameter7 = parameter7 ?? 0,
        super(key: key);

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final List<dynamic>? parameter5;
  final String parameter6;
  final int parameter7;
  final String? userId;

  @override
  _DetailCardReimburstWidgetState createState() =>
      _DetailCardReimburstWidgetState();
}

class _DetailCardReimburstWidgetState extends State<DetailCardReimburstWidget> {
  late DetailCardReimburstModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailCardReimburstModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
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
                              Icons.align_horizontal_left_outlined,
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
                                    'Status',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter1!,
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
                                    'Type',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter2!,
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
                              Icons.person_rounded,
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
                                    'User',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter3!,
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
                              Icons.account_balance_wallet_rounded,
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
                                    'Amount',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter4!,
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
                              Icons.attach_file,
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
                                    'Attachement',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  final attachementsList =
                                      widget.parameter5?.toList() ?? [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: attachementsList.length,
                                    itemBuilder:
                                        (context, attachementsListIndex) {
                                      final attachementsListItem =
                                          attachementsList[
                                              attachementsListIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(getJsonField(
                                            attachementsListItem,
                                            r'''$.full_url''',
                                          ).toString());
                                        },
                                        child: Text(
                                          valueOrDefault<String>(
                                            'Attachment ${(attachementsListIndex + 1).toString()}',
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                        ),
                                      );
                                    },
                                  );
                                },
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
                                    'Reason :',
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter6,
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
            if (FFAppState().roleCanProve &&
                (widget.parameter1 == 'Pending') &&
                _model.canAprove &&
                (widget.userId != FFAppState().userId))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.apiResultesi = await ProdReimburstmentGroup
                            .updateStatusReimburseCall
                            .call(
                          statusName: 'approved',
                          id: widget.parameter7,
                          userToken: FFAppState().token,
                        );
                        _shouldSetState = true;
                        if ((_model.apiResultesi?.succeeded ?? true)) {
                          context.goNamed('success_page');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                valueOrDefault<String>(
                                  ProdReimburstmentGroup
                                      .updateStatusReimburseCall
                                      .message(
                                        (_model.apiResultesi?.jsonBody ?? ''),
                                      )
                                      .toString(),
                                  'error not found',
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          setState(() {
                            _model.canAprove = false;
                          });
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Approve ',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                    FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.apiResultreject = await ProdReimburstmentGroup
                            .updateStatusReimburseCall
                            .call(
                          statusName: 'rejected',
                          id: widget.parameter7,
                          userToken: FFAppState().token,
                        );
                        _shouldSetState = true;
                        if (ProdReimburstmentGroup.updateStatusReimburseCall
                            .status(
                          (_model.apiResultreject?.jsonBody ?? ''),
                        )) {
                          context.goNamed('success_page');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                ProdReimburstmentGroup.updateStatusReimburseCall
                                    .message(
                                      (_model.apiResultreject?.jsonBody ?? ''),
                                    )
                                    .toString(),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          setState(() {
                            _model.canAprove = false;
                          });
                          if (_shouldSetState) setState(() {});
                          return;
                        }

                        if (_shouldSetState) setState(() {});
                      },
                      text: 'Reject',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent1,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
