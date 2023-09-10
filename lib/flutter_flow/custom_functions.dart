import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? parsedate(String? dateString) {
  // show me code in dart to make function parse date year-month-day
  if (dateString == null) {
    return null;
  }
  var date = DateTime.parse(dateString);
  var formatter = DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(date);
  return formatted;
}

String? parseMMMd(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return "-";
  }

  DateTime dateTime = DateTime.parse(dateString);
  DateFormat formatter = DateFormat.MMMd();
  String formattedDate = formatter.format(dateTime);
  return formattedDate;
}

String? parseDateTimeFixingGMTSubmitReqAttendance(DateTime? dateString) {
  // ubah waktu yyyy-MM-dd HH:mm:ss dan kurangi jam dari gmt +7 dengan gmt 0
  if (dateString == null) return null;

  final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  final dateTimeString = dateFormat.format(dateString);

  final dateTime = DateTime.parse(dateTimeString).subtract(Duration(hours: 7));

  final timeAgo = dateFormat.format(dateTime);

  return timeAgo;
}

String? parseTime(String? timeString) {
  // show me code in dart to make function parse date year-month-day
  if (timeString == null || timeString.isEmpty) {
    return "-";
  } else {
    var date = DateTime.parse(timeString).add(Duration(hours: 7));
    var formatter = DateFormat('HH:mm');
    String formatted = formatter.format(date);
    return formatted;
  }
}

int roundNumber(double? number) {
  // set round number
  if (number == null) {
    return 0;
  } else {
    return number.round();
  }
}

String? parseDateTime(DateTime? dateString) {
  // parse date year-month-day detail second
  if (dateString == null) {
    return null;
  } else {
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formatted = formatter.format(dateString);
    return formatted;
  }
}

String? parseYear(String? currentDate) {
  // get only year with argument current date
  if (currentDate == null || currentDate.isEmpty) {
    return null;
  } else {
    var date = DateTime.parse(currentDate);
    var formatter = DateFormat('yyyy');
    String formatted = formatter.format(date);
    return formatted;
  }
}

String? countDateTime(
  String? startDate,
  String? endDate,
) {
  // menghitung durasi hari dengan pembulatan 1 hari
  if (startDate == null || endDate == null) {
    return null;
  } else {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    Duration duration = end.difference(start);
    int days = duration.inDays + 1;
    if (duration.inHours.remainder(24) >= 12) {
      days++;
    }
    return days.toString();
  }
}

String? parserGetKeyUrlParameter(String? url) {
  // Parsing a URI to extract query parameters get key, regex include "_id"
  final uri = Uri.parse(url ?? '');
  final queryParams = uri.queryParameters;
  final regex = RegExp(r'_id$');
  for (final key in queryParams.keys) {
    if (regex.hasMatch(key)) {
      return key;
    }
  }
  return null;
}

bool? roleCanProve(List<String>? roles) {
  // check dengan regex apakah ada role "manager", "admin" tanpa dipengaruhi besar kecil huruf
  if (roles == null) {
    return false;
  }

  final regex = RegExp(r'(manager|admin)', caseSensitive: false);

  for (final role in roles) {
    if (regex.hasMatch(role)) {
      return true;
    }
  }

  return false;
}

bool? canReview(
  List<dynamic>? data,
  String? userId,
) {
  // find data.reviewed_by same userId on object
  if (data == null || userId == null) {
    return false;
  }
  for (var item in data) {
    if (item['reviewed_by'] == int.parse(userId)) {
      return true;
    }
  }
  return false;
}
