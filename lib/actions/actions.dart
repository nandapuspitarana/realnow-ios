import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/component/modal_bottom_attendance/modal_bottom_attendance_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future authappverification(BuildContext context) async {
  if (FFAppState().token == null || FFAppState().token == '') {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'token not found',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  } else {
    return;
  }

  context.pushNamed('login_page');
}

Future checkIsWfh(BuildContext context) async {
  if (true == true) {
    context.pushNamed('clock_in_form');

    return;
  } else {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: ModalBottomAttendanceWidget(),
        );
      },
    );

    return;
  }
}

Future checkIsAuthApi(BuildContext context) async {}
