import '/backend/api_requests/api_calls.dart';
import '/component/leave/card_request_leave/card_request_leave_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_leave_request_success_model.dart';
export 'calendar_leave_request_success_model.dart';

class CalendarLeaveRequestSuccessWidget extends StatefulWidget {
  const CalendarLeaveRequestSuccessWidget({
    Key? key,
    int? pageSize,
    int? page,
    required this.date,
  })  : this.pageSize = pageSize ?? 10,
        this.page = page ?? 1,
        super(key: key);

  final int pageSize;
  final int page;
  final DateTime? date;

  @override
  _CalendarLeaveRequestSuccessWidgetState createState() =>
      _CalendarLeaveRequestSuccessWidgetState();
}

class _CalendarLeaveRequestSuccessWidgetState
    extends State<CalendarLeaveRequestSuccessWidget> {
  late CalendarLeaveRequestSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarLeaveRequestSuccessModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder<ApiCallResponse>(
            future: ProductionHrmsGroup.listRequestLeaveSuccessStatusCall.call(
              userToken: FFAppState().token,
              year: valueOrDefault<String>(
                functions.parseYear(getCurrentTimestamp.toString()),
                '2023',
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final listViewListRequestLeaveSuccessStatusResponse =
                  snapshot.data!;
              return Builder(
                builder: (context) {
                  final requestLeave =
                      ProductionHrmsGroup.listRequestLeaveSuccessStatusCall
                              .data(
                                listViewListRequestLeaveSuccessStatusResponse
                                    .jsonBody,
                              )
                              ?.map((e) => e)
                              .toList()
                              ?.toList() ??
                          [];
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: requestLeave.length,
                    itemBuilder: (context, requestLeaveIndex) {
                      final requestLeaveItem = requestLeave[requestLeaveIndex];
                      return Visibility(
                        visible: functions.parsedate(widget.date?.toString()) ==
                            getJsonField(
                              requestLeaveItem,
                              r'''$.date''',
                            ),
                        child: CardRequestLeaveWidget(
                          key: Key(
                              'Keyse4_${requestLeaveIndex}_of_${requestLeave.length}'),
                          data: requestLeaveItem,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
