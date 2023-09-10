import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'requestreimburst_colom_card_model.dart';
export 'requestreimburst_colom_card_model.dart';

class RequestreimburstColomCardWidget extends StatefulWidget {
  const RequestreimburstColomCardWidget({Key? key}) : super(key: key);

  @override
  _RequestreimburstColomCardWidgetState createState() =>
      _RequestreimburstColomCardWidgetState();
}

class _RequestreimburstColomCardWidgetState
    extends State<RequestreimburstColomCardWidget> {
  late RequestreimburstColomCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestreimburstColomCardModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed('list_request_reimbursement');
        },
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                child: Icon(
                  Icons.attach_money,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ),
              Text(
                'Request Reimburse',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
