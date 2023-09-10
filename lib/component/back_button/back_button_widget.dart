import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'back_button_model.dart';
export 'back_button_model.dart';

class BackButtonWidget extends StatefulWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  _BackButtonWidgetState createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget> {
  late BackButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderRadius: 20.0,
      borderWidth: 1.0,
      buttonSize: 60.0,
      icon: Icon(
        Icons.arrow_back,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
      onPressed: () async {
        context.safePop();
      },
    );
  }
}
