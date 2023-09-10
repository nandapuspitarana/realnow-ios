import '/component/back_button/back_button_widget.dart';
import '/component/detail_attendance/detail_card_attendance/detail_card_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_attendance_rev_model.dart';
export 'detail_attendance_rev_model.dart';

class DetailAttendanceRevWidget extends StatefulWidget {
  const DetailAttendanceRevWidget({
    Key? key,
    int? id,
    required this.date,
    required this.detail,
    String? status,
  })  : this.id = id ?? 0,
        this.status = status ?? 'Pending',
        super(key: key);

  final int id;
  final String? date;
  final List<dynamic>? detail;
  final String status;

  @override
  _DetailAttendanceRevWidgetState createState() =>
      _DetailAttendanceRevWidgetState();
}

class _DetailAttendanceRevWidgetState extends State<DetailAttendanceRevWidget> {
  late DetailAttendanceRevModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailAttendanceRevModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detail_attendance_rev'});
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Detail attendance',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                  ),
                            ),
                            Text(
                              widget.date!,
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
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Builder(
                            builder: (context) {
                              final listAttendance =
                                  widget.detail!.map((e) => e).toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listAttendance.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, listAttendanceIndex) {
                                  final listAttendanceItem =
                                      listAttendance[listAttendanceIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: DetailCardAttendanceWidget(
                                      key: Key(
                                          'Keyltk_${listAttendanceIndex}_of_${listAttendance.length}'),
                                      parameter1: listAttendanceIndex,
                                      parameter2: getJsonField(
                                        listAttendanceItem,
                                        r'''$.in_time''',
                                      ).toString(),
                                      parameter3: getJsonField(
                                        listAttendanceItem,
                                        r'''$.out_time''',
                                      ).toString(),
                                      parameter4: getJsonField(
                                        listAttendanceItem,
                                        r'''$.status.translated_name''',
                                      ),
                                      parameter5: getJsonField(
                                        listAttendanceItem,
                                        r'''$.comments[0].comment''',
                                      ),
                                      parameter6: widget.id,
                                      parameter7: widget.status,
                                      parameter8: widget.status,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
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
