import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_announcement_model.dart';
export 'detail_announcement_model.dart';

class DetailAnnouncementWidget extends StatefulWidget {
  const DetailAnnouncementWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int? id;

  @override
  _DetailAnnouncementWidgetState createState() =>
      _DetailAnnouncementWidgetState();
}

class _DetailAnnouncementWidgetState extends State<DetailAnnouncementWidget> {
  late DetailAnnouncementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailAnnouncementModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detailAnnouncement'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: ProdHrmsAnnouncementGroup.detailAnnouncementCall.call(
        userToken: FFAppState().token,
        id: widget.id,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailAnnouncementDetailAnnouncementResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 32.0,
              ),
            ),
            title: Text(
              'Detail Announcement',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 24.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ProdHrmsAnnouncementGroup.detailAnnouncementCall
                            .title(
                              detailAnnouncementDetailAnnouncementResponse
                                  .jsonBody,
                            )
                            .toString(),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Text(
                          ProdHrmsAnnouncementGroup.detailAnnouncementCall
                              .startdate(
                                detailAnnouncementDetailAnnouncementResponse
                                    .jsonBody,
                              )
                              .toString(),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Html(
                    data: ProdHrmsAnnouncementGroup.detailAnnouncementCall
                        .desc(
                          detailAnnouncementDetailAnnouncementResponse.jsonBody,
                        )
                        .toString(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
