import '/backend/api_requests/api_calls.dart';
import '/component/card_notif_component/card_notif_component_widget.dart';
import '/component/empty_data/empty_data_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inbox_model.dart';
export 'inbox_model.dart';

class InboxWidget extends StatefulWidget {
  const InboxWidget({Key? key}) : super(key: key);

  @override
  _InboxWidgetState createState() => _InboxWidgetState();
}

class _InboxWidgetState extends State<InboxWidget>
    with TickerProviderStateMixin {
  late InboxModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InboxModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'inbox'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Inbox',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Below are a summary of your inbox.',
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          unselectedLabelStyle: TextStyle(),
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 12.0,
                          elevation: 0.0,
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          tabs: [
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Read',
                            ),
                            Tab(
                              text: 'Unread',
                            ),
                          ],
                          controller: _model.tabBarController,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Notification',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: ProdHrmsNotificationGroup
                                        .listNotificationCall
                                        .call(
                                      userToken: FFAppState().token,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewListNotificationResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final allnotif =
                                              ProdHrmsNotificationGroup
                                                      .listNotificationCall
                                                      .data(
                                                        listViewListNotificationResponse
                                                            .jsonBody,
                                                      )
                                                      ?.map((e) => e)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          if (allnotif.isEmpty) {
                                            return EmptyDataWidget();
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allnotif.length,
                                            itemBuilder:
                                                (context, allnotifIndex) {
                                              final allnotifItem =
                                                  allnotif[allnotifIndex];
                                              return CardNotifComponentWidget(
                                                key: Key(
                                                    'Keyoaw_${allnotifIndex}_of_${allnotif.length}'),
                                                data: allnotifItem,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Notification',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: ProdHrmsNotificationGroup
                                        .listNotificationCall
                                        .call(
                                      userToken: FFAppState().token,
                                      read: 1,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewListNotificationResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final allnotif =
                                              ProdHrmsNotificationGroup
                                                      .listNotificationCall
                                                      .data(
                                                        listViewListNotificationResponse
                                                            .jsonBody,
                                                      )
                                                      ?.map((e) => e)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          if (allnotif.isEmpty) {
                                            return Center(
                                              child: EmptyDataWidget(),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allnotif.length,
                                            itemBuilder:
                                                (context, allnotifIndex) {
                                              final allnotifItem =
                                                  allnotif[allnotifIndex];
                                              return CardNotifComponentWidget(
                                                key: Key(
                                                    'Key7oq_${allnotifIndex}_of_${allnotif.length}'),
                                                data: allnotifItem,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Notification',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                    ),
                                  ),
                                  FutureBuilder<ApiCallResponse>(
                                    future: ProdHrmsNotificationGroup
                                        .listNotificationCall
                                        .call(
                                      userToken: FFAppState().token,
                                      unread: 1,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final listViewListNotificationResponse =
                                          snapshot.data!;
                                      return Builder(
                                        builder: (context) {
                                          final allnotif =
                                              ProdHrmsNotificationGroup
                                                      .listNotificationCall
                                                      .data(
                                                        listViewListNotificationResponse
                                                            .jsonBody,
                                                      )
                                                      ?.map((e) => e)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                          if (allnotif.isEmpty) {
                                            return EmptyDataWidget();
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: allnotif.length,
                                            itemBuilder:
                                                (context, allnotifIndex) {
                                              final allnotifItem =
                                                  allnotif[allnotifIndex];
                                              return CardNotifComponentWidget(
                                                key: Key(
                                                    'Keykmq_${allnotifIndex}_of_${allnotif.length}'),
                                                data: allnotifItem,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
