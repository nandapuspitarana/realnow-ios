import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start production hrms Group Code

class ProductionHrmsGroup {
  static String baseUrl = 'https://hrms.realco.co.id';
  static Map<String, String> headers = {};
  static ListRequestAttendanceSuccessCall listRequestAttendanceSuccessCall =
      ListRequestAttendanceSuccessCall();
  static ListAttendanceDailyLogCall listAttendanceDailyLogCall =
      ListAttendanceDailyLogCall();
  static SummaryLeaveCall summaryLeaveCall = SummaryLeaveCall();
  static ListRequestLeavePendingStatusCall listRequestLeavePendingStatusCall =
      ListRequestLeavePendingStatusCall();
  static ListRequestLeaveRejectStatusCall listRequestLeaveRejectStatusCall =
      ListRequestLeaveRejectStatusCall();
  static RequestTypeCall requestTypeCall = RequestTypeCall();
  static AddRequestLeaveMultiCall addRequestLeaveMultiCall =
      AddRequestLeaveMultiCall();
  static AddRequestLeaveSingleCall addRequestLeaveSingleCall =
      AddRequestLeaveSingleCall();
  static ListRequestLeaveSuccessStatusCall listRequestLeaveSuccessStatusCall =
      ListRequestLeaveSuccessStatusCall();
  static DetailRequestLeaveCall detailRequestLeaveCall =
      DetailRequestLeaveCall();
  static UpdateStatusLeaveCall updateStatusLeaveCall = UpdateStatusLeaveCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static ClockInCall clockInCall = ClockInCall();
  static ClockOutCall clockOutCall = ClockOutCall();
  static LogInCall logInCall = LogInCall();
}

class ListRequestAttendanceSuccessCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? pageSize,
    int? page,
    String? userId = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "per_page": ${pageSize},
  "page": ${page},
  "users": "${userId}",
  "orderBy": "desc",
  "access_behavior": "own_departments",
"show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list request attendance Success',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/attendances/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic pageSize(dynamic response) => getJsonField(
        response,
        r'''$.per_page''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].in_date''',
        true,
      );
  dynamic clockIn(dynamic response) => getJsonField(
        response,
        r'''$.data[:].details[0].in_time''',
        true,
      );
  dynamic clockOut(dynamic response) => getJsonField(
        response,
        r'''$.data[:].details[0].out_time''',
        true,
      );
  dynamic page(dynamic response) => getJsonField(
        response,
        r'''$.current_page''',
      );
  dynamic idAttendance(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ListAttendanceDailyLogCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? pageSize,
    int? page,
    String? userId = '',
    String? showAll = 'no',
    String? date = '',
  }) {
    final ffApiRequestBody = '''
{
  "per_page": ${pageSize},
  "page": ${page},
  "users": "${userId}",
  "orderBy": "desc",
  "access_behavior": "own_departments",
  "show_all": "${showAll}",
  "date": "${date}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list attendance daily log',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/attendances/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic pageSize(dynamic response) => getJsonField(
        response,
        r'''$.per_page''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].in_date''',
        true,
      );
  dynamic clockIn(dynamic response) => getJsonField(
        response,
        r'''$.data[:].details[0].in_time''',
        true,
      );
  dynamic clockOut(dynamic response) => getJsonField(
        response,
        r'''$.data[:].details[0].out_time''',
        true,
      );
  dynamic page(dynamic response) => getJsonField(
        response,
        r'''$.current_page''',
      );
  dynamic idAttendance(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class SummaryLeaveCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? year = '',
    String? userToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "year": "${year}",
  "orderBy": "desc",
 
  "access_behavior": "own_departments"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'summary leave',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/summaries/${userId}',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic leaveAvailable(dynamic response) => getJsonField(
        response,
        r'''$.card_summaries.available''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ListRequestLeavePendingStatusCall {
  Future<ApiCallResponse> call({
    int? pageSize,
    int? page,
    String? userToken = '',
    bool? rejected,
    String? showAll = 'no',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'list request leave pending status',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'per_page': pageSize,
        'page': page,
        'orderBy': "desc",
        'rejected': rejected,
        'access_behavior': "own_departments",
        'show_all': showAll,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start_at''',
        true,
      );
  dynamic endDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].end_at''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.translated_name''',
        true,
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ListRequestLeaveRejectStatusCall {
  Future<ApiCallResponse> call({
    int? pageSize,
    int? page,
    String? userToken = '',
    bool? rejected = true,
    String? showAll = 'no',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'list request leave reject status ',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'per_page': pageSize,
        'page': page,
        'orderBy': "desc",
        'rejected': rejected,
        'access_behavior': "own_departments",
        'show_all': showAll,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start_at''',
        true,
      );
  dynamic endDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].end_at''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.translated_name''',
        true,
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class RequestTypeCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'request type',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leave-types',
      callType: ApiCallType.GET,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic value(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic label(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
}

class AddRequestLeaveMultiCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? leaveDuration = '',
    String? dayType = 'first_half',
    String? leaveTypeId = '',
    String? employeeId = '',
    String? startDate = '',
    String? endDate = '',
    String? note = '',
    List<FFUploadedFile>? attachmentsList,
  }) {
    final attachments = attachmentsList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'add request leave multi',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/add',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'leave_duration': leaveDuration,
        'day_type': dayType,
        'leave_type_id': leaveTypeId,
        'employee_id': employeeId,
        'note': note,
        'start_date': startDate,
        'end_date': endDate,
        'attachments[]': attachments,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class AddRequestLeaveSingleCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? leaveDuration = 'single_day',
    String? dayType = 'first_half',
    String? leaveTypeId = '',
    String? employeeId = '',
    String? note = '',
    String? date = '',
    List<FFUploadedFile>? attachmentsList,
  }) {
    final attachments = attachmentsList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'add request leave single',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/add',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'leave_duration': leaveDuration,
        'day_type': dayType,
        'leave_type_id': leaveTypeId,
        'employee_id': employeeId,
        'note': note,
        'date': date,
        'attachments[]': attachments,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ListRequestLeaveSuccessStatusCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? year = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "within": "thisYear",
  "year": "${year}",
  "access_behavior": "own_departments",
  "show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list request leave success status',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start_at''',
      );
  dynamic endDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].end_at''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].user.status.translated_name''',
      );
}

class DetailRequestLeaveCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'detail request leave',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateStatusLeaveCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? id,
    String? statusName = '',
    String? note = '',
  }) {
    final ffApiRequestBody = '''
{
  "status_name": "${statusName}",
  "note": "${note}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update status leave',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/leaves/request/update/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'get profile',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/me',
      callType: ApiCallType.GET,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.full_name''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ClockInCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? note = '',
    bool? isWfh,
    String? ip = '',
    String? latLong = '',
    String? userToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "today": "${date}",
  "note": "${note}",
  "ip_data": {
    "work_from_home": ${isWfh},
    "ip": "${ip}",
    "latLong": "${latLong}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'clock in',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/attendance/clockin',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
}

class ClockOutCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? note = '',
    bool? isWfh,
    String? ip = '',
    String? latLong = '',
    String? userToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "today": "${date}",
  "note": "${note}",
  "ip_data": {
    "work_from_home": ${isWfh},
    "ip": "${ip}",
    "latLong": "${latLong}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'clock out',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/attendance/clockout',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic detailMessage(dynamic response) => getJsonField(
        response,
        r'''$.data.detail''',
      );
}

class LogInCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'log in',
      apiUrl: '${ProductionHrmsGroup.baseUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        ...ProductionHrmsGroup.headers,
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic detailMessage(dynamic response) => getJsonField(
        response,
        r'''$.data.detail''',
      );
  dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.data.token''',
      );
  dynamic fullName(dynamic response) => getJsonField(
        response,
        r'''$.data.name''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.data.role''',
        true,
      );
  dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
}

/// End production hrms Group Code

/// Start prod hrms request attendance Group Code

class ProdHrmsRequestAttendanceGroup {
  static String baseUrl = 'https://hrms.realco.co.id';
  static Map<String, String> headers = {};
  static ListRequestAttendanceCall listRequestAttendanceCall =
      ListRequestAttendanceCall();
  static AddRequestAttendanceCall addRequestAttendanceCall =
      AddRequestAttendanceCall();
  static UpdateRequestAttendanceCall updateRequestAttendanceCall =
      UpdateRequestAttendanceCall();
}

class ListRequestAttendanceCall {
  Future<ApiCallResponse> call({
    int? perPage,
    int? page,
    String? userToken = '',
    String? rejected = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "per_page": "${perPage}",
  "page": "${page}",
  "orderBy": "desc",
  "rejected": "${rejected}",
  "access_behavior": "own_departments",
  "show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list request attendance',
      apiUrl:
          '${ProdHrmsRequestAttendanceGroup.baseUrl}/api/attendances/request/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProdHrmsRequestAttendanceGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class AddRequestAttendanceCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? employeeId = '',
    String? inTime = '',
    String? outTime = '',
    String? note = '',
    String? inDate = '',
    List<FFUploadedFile>? attachmentsList,
  }) {
    final attachments = attachmentsList ?? [];

    final ffApiRequestBody = '''
{
  "employee_id": "${employeeId}",
  "in_time": "${inTime}",
  "out_time": "${outTime}",
  "note": "${note}",
  "in_date": "${inDate}",
  "access_behavior": "own_departments"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'add request attendance',
      apiUrl:
          '${ProdHrmsRequestAttendanceGroup.baseUrl}/api/attendances/request/add',
      callType: ApiCallType.POST,
      headers: {
        ...ProdHrmsRequestAttendanceGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic errors(dynamic response) => getJsonField(
        response,
        r'''$.errors''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class UpdateRequestAttendanceCall {
  Future<ApiCallResponse> call({
    int? id,
    String? statusName = '',
    String? userToken = '',
  }) {
    final ffApiRequestBody = '''
{
    "id": ${id},
    "status_name": "${statusName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update request attendance',
      apiUrl:
          '${ProdHrmsRequestAttendanceGroup.baseUrl}/api/attendances/request/update',
      callType: ApiCallType.POST,
      headers: {
        ...ProdHrmsRequestAttendanceGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End prod hrms request attendance Group Code

/// Start prod hrms announcement Group Code

class ProdHrmsAnnouncementGroup {
  static String baseUrl = 'https://hrms.realco.co.id';
  static Map<String, String> headers = {};
  static ListAnnouncementCall listAnnouncementCall = ListAnnouncementCall();
  static DetailAnnouncementCall detailAnnouncementCall =
      DetailAnnouncementCall();
}

class ListAnnouncementCall {
  Future<ApiCallResponse> call({
    String? orderBy = 'desc',
    int? page = 1,
    int? perPage = 10,
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'list announcement',
      apiUrl: '${ProdHrmsAnnouncementGroup.baseUrl}/api/announcements',
      callType: ApiCallType.GET,
      headers: {
        ...ProdHrmsAnnouncementGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'orderBy': orderBy,
        'page': page,
        'per_page': perPage,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
  dynamic startDate(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start_date''',
      );
  dynamic desc(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
      );
  dynamic perPage(dynamic response) => getJsonField(
        response,
        r'''$.per_page''',
      );
  dynamic toPage(dynamic response) => getJsonField(
        response,
        r'''$.to''',
      );
  dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.total''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class DetailAnnouncementCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'detail announcement',
      apiUrl: '${ProdHrmsAnnouncementGroup.baseUrl}/api/announcements/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ProdHrmsAnnouncementGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic startdate(dynamic response) => getJsonField(
        response,
        r'''$.start_date''',
      );
  dynamic desc(dynamic response) => getJsonField(
        response,
        r'''$.description''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End prod hrms announcement Group Code

/// Start prod hrms notification Group Code

class ProdHrmsNotificationGroup {
  static String baseUrl = 'https://hrms.realco.co.id';
  static Map<String, String> headers = {};
  static ListNotificationCall listNotificationCall = ListNotificationCall();
  static MarkAsReadCall markAsReadCall = MarkAsReadCall();
}

class ListNotificationCall {
  Future<ApiCallResponse> call({
    int? unread = 0,
    int? read = 0,
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'list notification',
      apiUrl: '${ProdHrmsNotificationGroup.baseUrl}/api/user/notifications',
      callType: ApiCallType.GET,
      headers: {
        ...ProdHrmsNotificationGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'unread': unread,
        'read': read,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic receiver(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
        true,
      );
  dynamic notifier(dynamic response) => getJsonField(
        response,
        r'''$.data[:].notifier''',
        true,
      );
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class MarkAsReadCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'mark as read',
      apiUrl:
          '${ProdHrmsNotificationGroup.baseUrl}/api/user/notifications/mark-as-read/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...ProdHrmsNotificationGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic successmessage(dynamic response) => getJsonField(
        response,
        r'''$.data.message''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End prod hrms notification Group Code

/// Start prod reimburstment Group Code

class ProdReimburstmentGroup {
  static String baseUrl = 'https://hrms.realco.co.id';
  static Map<String, String> headers = {};
  static ListReimburstmentPendingCall listReimburstmentPendingCall =
      ListReimburstmentPendingCall();
  static ListReimburstmentSuccessCall listReimburstmentSuccessCall =
      ListReimburstmentSuccessCall();
  static ListReimburstmentRejectedCall listReimburstmentRejectedCall =
      ListReimburstmentRejectedCall();
  static ReimburseTypeCall reimburseTypeCall = ReimburseTypeCall();
  static AddReimburseCall addReimburseCall = AddReimburseCall();
  static UpdateStatusReimburseCall updateStatusReimburseCall =
      UpdateStatusReimburseCall();
}

class ListReimburstmentPendingCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? perPage,
    bool? rejected,
    int? page,
    String? search = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "rejected": ${rejected},
  "per_page": ${perPage},
  "page": ${page},
  "orderBy": "desc",
  "search": "${search}",
  "access_behavior": "own_departments",
  "show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list reimburstment  pending',
      apiUrl: '${ProdReimburstmentGroup.baseUrl}/api/reimburses/request/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].amount''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.translated_name''',
        true,
      );
  dynamic typo(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
        true,
      );
  dynamic note(dynamic response) => getJsonField(
        response,
        r'''$.data[:].comments[:].comment''',
        true,
      );
}

class ListReimburstmentSuccessCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? perPage,
    int? page,
    String? search = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "per_page": ${perPage},
  "page": ${page},
  "within": "thisYear",
  "orderBy": "desc",
  "search": "${search}",
  "access_behavior": "own_departments",
  "show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list reimburstment Success ',
      apiUrl: '${ProdReimburstmentGroup.baseUrl}/api/reimburses/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].amount''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.translated_name''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
      );
}

class ListReimburstmentRejectedCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    int? perPage,
    bool? rejected = true,
    int? page,
    String? search = '',
    String? showAll = 'no',
  }) {
    final ffApiRequestBody = '''
{
  "rejected": ${rejected},
  "per_page": ${perPage},
  "page": ${page},
  "orderBy": "desc",
  "search": "${search}",
  "access_behavior": "own_departments",
  "show_all": "${showAll}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'list reimburstment rejected ',
      apiUrl: '${ProdReimburstmentGroup.baseUrl}/api/reimburses/request/list',
      callType: ApiCallType.POST,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.translated_name''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].amount''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type.name''',
      );
}

class ReimburseTypeCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'reimburse type',
      apiUrl: '${ProdReimburstmentGroup.baseUrl}/api/reimburse-types',
      callType: ApiCallType.GET,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class AddReimburseCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? reimburseTypeId = '',
    String? employeeId = '',
    String? date = '',
    int? amount,
    String? note = '',
    List<FFUploadedFile>? attachmentsList,
  }) {
    final attachments = attachmentsList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'add reimburse',
      apiUrl: '${ProdReimburstmentGroup.baseUrl}/api/reimburses/request/add',
      callType: ApiCallType.POST,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {
        'reimburse_type_id': reimburseTypeId,
        'employee_id': employeeId,
        'date': date,
        'amount': amount,
        'note': note,
        'access_behavior': "own_departments",
        'show_all': "no",
        'attachments[]': attachments,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class UpdateStatusReimburseCall {
  Future<ApiCallResponse> call({
    String? statusName = '',
    String? note = '',
    int? id,
    String? userToken = '',
  }) {
    final ffApiRequestBody = '''
{
  "status_name": "${statusName}",
  "note": "${note}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update status reimburse',
      apiUrl:
          '${ProdReimburstmentGroup.baseUrl}/api/reimburses/request/update/${id}',
      callType: ApiCallType.POST,
      headers: {
        ...ProdReimburstmentGroup.headers,
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End prod reimburstment Group Code

class CheckGeolocationCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'check geolocation',
      apiUrl: 'https://api.ipgeolocation.io/ipgeo',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'apiKey': "123861999fea4dbaac401b558d74f4e4",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProdStatusGlobalCall {
  static Future<ApiCallResponse> call({
    String? userToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'prod status global',
      apiUrl: 'https://hrms.realco.co.id/api/attendance/status',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${userToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic isClockedIn(dynamic response) => getJsonField(
        response,
        r'''$.data.clocked_in''',
      );
  static dynamic isWfh(dynamic response) => getJsonField(
        response,
        r'''$.data.is_wfh''',
      );
}

class GetipCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getip',
      apiUrl: 'http://192.165.10.105:8055/items/ip_address/1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic ip(dynamic response) => getJsonField(
        response,
        r'''$.ip''',
      );
  static dynamic ip2(dynamic response) => getJsonField(
        response,
        r'''$.data.public''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
