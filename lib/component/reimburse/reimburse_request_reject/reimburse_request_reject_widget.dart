import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'reimburse_request_reject_model.dart';
export 'reimburse_request_reject_model.dart';

class ReimburseRequestRejectWidget extends StatefulWidget {
  const ReimburseRequestRejectWidget({
    Key? key,
    int? pageSize,
    int? page,
  })  : this.pageSize = pageSize ?? 10,
        this.page = page ?? 1,
        super(key: key);

  final int pageSize;
  final int page;

  @override
  _ReimburseRequestRejectWidgetState createState() =>
      _ReimburseRequestRejectWidgetState();
}

class _ReimburseRequestRejectWidgetState
    extends State<ReimburseRequestRejectWidget> with TickerProviderStateMixin {
  late ReimburseRequestRejectModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReimburseRequestRejectModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return PagedListView<ApiPagingParams, dynamic>(
      pagingController: _model.setListViewController(
        (nextPageMarker) =>
            ProdReimburstmentGroup.listReimburstmentRejectedCall.call(
          userToken: FFAppState().token,
          perPage: 10,
          page: nextPageMarker.nextPageNumber + 1,
        ),
      ),
      padding: EdgeInsets.zero,
      primary: false,
      shrinkWrap: true,
      reverse: false,
      scrollDirection: Axis.vertical,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        // Customize what your widget looks like when it's loading the first page.
        firstPageProgressIndicatorBuilder: (_) => Center(
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
        // Customize what your widget looks like when it's loading another page.
        newPageProgressIndicatorBuilder: (_) => Center(
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

        itemBuilder: (context, _, reimbursementDataIndex) {
          final reimbursementDataItem = _model
              .listViewPagingController!.itemList![reimbursementDataIndex];
          return Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'detail_request_reimburst',
                  queryParameters: {
                    'id': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.id''',
                      ),
                      ParamType.int,
                    ),
                    'date': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.date''',
                      ).toString(),
                      ParamType.String,
                    ),
                    'status': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.status.translated_name''',
                      ).toString(),
                      ParamType.String,
                    ),
                    'reason': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.comments[0].comment''',
                      ).toString(),
                      ParamType.String,
                    ),
                    'attachments': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.attachments''',
                      ),
                      ParamType.JSON,
                      true,
                    ),
                    'amount': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.amount''',
                      ),
                      ParamType.int,
                    ),
                    'full': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.user.full_name''',
                      ).toString(),
                      ParamType.String,
                    ),
                    'type': serializeParam(
                      getJsonField(
                        reimbursementDataItem,
                        r'''$.type.name''',
                      ).toString(),
                      ParamType.String,
                    ),
                    'userId': serializeParam(
                      (int var1) {
                        return "$var1";
                      }(getJsonField(
                        reimbursementDataItem,
                        r'''$.user.id''',
                      )),
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Color(0x32171717),
                      offset: Offset(0.0, 3.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getJsonField(
                                  reimbursementDataItem,
                                  r'''$.type.name''',
                                ).toString(),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    reimbursementDataItem,
                                    r'''$.date''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    reimbursementDataItem,
                                    r'''$.amount''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    reimbursementDataItem,
                                    r'''$.user.full_name''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    reimbursementDataItem,
                                    r'''$.status.translated_name''',
                                  ).toString(),
                                  style:
                                      FlutterFlowTheme.of(context).labelSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.chevron_right_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          );
        },
      ),
    );
  }
}
