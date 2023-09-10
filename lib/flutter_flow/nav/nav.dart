import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
        ),
        FFRoute(
          name: 'login_page',
          path: '/loginPage',
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
        ),
        FFRoute(
          name: 'list_daily_attendance',
          path: '/listDailyAttendance',
          builder: (context, params) => ListDailyAttendanceWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            userId: params.getParam('userId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'clock_in_form',
          path: '/clockInForm',
          builder: (context, params) => ClockInFormWidget(
            userWfh: params.getParam('userWfh', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: 'inbox',
          path: '/inbox',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'inbox') : InboxWidget(),
        ),
        FFRoute(
          name: 'success_page',
          path: '/successPage',
          builder: (context, params) => SuccessPageWidget(),
        ),
        FFRoute(
          name: 'list_request_attendance_pendin',
          path: '/listRequestAttendancePendin',
          builder: (context, params) => ListRequestAttendancePendinWidget(),
        ),
        FFRoute(
          name: 'detail_attendance_rev',
          path: '/detailAttendanceRev',
          builder: (context, params) => DetailAttendanceRevWidget(
            id: params.getParam('id', ParamType.int),
            date: params.getParam('date', ParamType.String),
            detail: params.getParam<dynamic>('detail', ParamType.JSON, true),
            status: params.getParam('status', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'create_request_leave',
          path: '/create_request_leave',
          builder: (context, params) => CreateRequestLeaveWidget(),
        ),
        FFRoute(
          name: 'create_request_attendance',
          path: '/create_request_attendance',
          builder: (context, params) => CreateRequestAttendanceWidget(
            duration: params.getParam('duration', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'detail_request_leave',
          path: '/detailRequestLeave',
          builder: (context, params) => DetailRequestLeaveWidget(
            id: params.getParam('id', ParamType.int),
            date: params.getParam('date', ParamType.String),
            startDate: params.getParam('startDate', ParamType.String),
            endDate: params.getParam('endDate', ParamType.String),
            status: params.getParam('status', ParamType.String),
            type: params.getParam('type', ParamType.String),
            reason: params.getParam('reason', ParamType.String),
            attachments:
                params.getParam<dynamic>('attachments', ParamType.JSON, true),
            userId: params.getParam('userId', ParamType.String),
            hasReview:
                params.getParam<dynamic>('hasReview', ParamType.JSON, true),
          ),
        ),
        FFRoute(
          name: 'detailAnnouncement',
          path: '/detailAnnouncement',
          builder: (context, params) => DetailAnnouncementWidget(
            id: params.getParam('id', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'list_request_reimbursement',
          path: '/listRequestReimbursement',
          builder: (context, params) => ListRequestReimbursementWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            status: params.getParam('status', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'create_request_reimburs',
          path: '/create_request_reimburstment',
          builder: (context, params) => CreateRequestReimbursWidget(
            duration: params.getParam('duration', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'detail_request_reimburst',
          path: '/detailRequestReimburst',
          builder: (context, params) => DetailRequestReimburstWidget(
            id: params.getParam('id', ParamType.int),
            date: params.getParam('date', ParamType.String),
            status: params.getParam('status', ParamType.String),
            reason: params.getParam('reason', ParamType.String),
            attachments:
                params.getParam<dynamic>('attachments', ParamType.JSON, true),
            amount: params.getParam('amount', ParamType.int),
            full: params.getParam('full', ParamType.String),
            type: params.getParam('type', ParamType.String),
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'list_attendance_user_calendar',
          path: '/listAttendanceUserCalendar',
          builder: (context, params) => ListAttendanceUserCalendarWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            userId: params.getParam('userId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'list_leave_calendar',
          path: '/listLeaveCalendar',
          builder: (context, params) => ListLeaveCalendarWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            userId: params.getParam('userId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'list_request_leave_pending',
          path: '/listRequestLeavePending',
          builder: (context, params) => ListRequestLeavePendingWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            userId: params.getParam('userId', ParamType.String),
            status: params.getParam('status', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'approval_request_reimbursement',
          path: '/approvalRequestReimbursement',
          builder: (context, params) => ApprovalRequestReimbursementWidget(
            pageSize: params.getParam('pageSize', ParamType.int),
            page: params.getParam('page', ParamType.int),
            status: params.getParam('status', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Color(0xFFF3EDD5),
                  child: Center(
                    child: Image.asset(
                      'assets/images/RealNow_Green.gif',
                      width: 135.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
