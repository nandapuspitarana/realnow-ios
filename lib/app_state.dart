import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _userClockIn = prefs.getBool('ff_userClockIn') ?? _userClockIn;
    });
    _safeInit(() {
      _userWfh = prefs.getBool('ff_userWfh') ?? _userWfh;
    });
    _safeInit(() {
      _roleCanProve = prefs.getBool('ff_roleCanProve') ?? _roleCanProve;
    });
    _safeInit(() {
      _isDev = prefs.getBool('ff_isDev') ?? _isDev;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
    prefs.setString('ff_userName', _value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  bool _userClockIn = false;
  bool get userClockIn => _userClockIn;
  set userClockIn(bool _value) {
    _userClockIn = _value;
    prefs.setBool('ff_userClockIn', _value);
  }

  bool _userWfh = false;
  bool get userWfh => _userWfh;
  set userWfh(bool _value) {
    _userWfh = _value;
    prefs.setBool('ff_userWfh', _value);
  }

  bool _roleCanProve = false;
  bool get roleCanProve => _roleCanProve;
  set roleCanProve(bool _value) {
    _roleCanProve = _value;
    prefs.setBool('ff_roleCanProve', _value);
  }

  String _requestLeaveType = 'pending';
  String get requestLeaveType => _requestLeaveType;
  set requestLeaveType(String _value) {
    _requestLeaveType = _value;
  }

  String _requestReimburseDropdown = 'pending';
  String get requestReimburseDropdown => _requestReimburseDropdown;
  set requestReimburseDropdown(String _value) {
    _requestReimburseDropdown = _value;
  }

  DateTime? _RequestAttendanceDate =
      DateTime.fromMillisecondsSinceEpoch(1691081520000);
  DateTime? get RequestAttendanceDate => _RequestAttendanceDate;
  set RequestAttendanceDate(DateTime? _value) {
    _RequestAttendanceDate = _value;
  }

  String _requestAttendanceDropdown = 'succcess';
  String get requestAttendanceDropdown => _requestAttendanceDropdown;
  set requestAttendanceDropdown(String _value) {
    _requestAttendanceDropdown = _value;
  }

  String _ip = '';
  String get ip => _ip;
  set ip(String _value) {
    _ip = _value;
  }

  bool _isDev = true;
  bool get isDev => _isDev;
  set isDev(bool _value) {
    _isDev = _value;
    prefs.setBool('ff_isDev', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
