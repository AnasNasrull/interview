import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/constant/session.dart';
import 'package:interview_task/src/core/core_res_list.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:interview_task/src/helpers/http_helper.dart';
import 'package:interview_task/src/models/home_event.dart';
import 'package:interview_task/src/models/profile.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:interview_task/src/network/result_state.dart';
import 'package:interview_task/src/services/auth_service.dart';
import 'package:interview_task/src/services/home_service.dart';
import 'package:stacked/stacked.dart';

const String _HomeEventData = 'delayedHomeEvent';
const String _UserData = 'delayedUser';
const String _TokenData = 'delayedToken';

class HomeViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _authService = locator<AuthService>();
  final _homeService = locator<HomeService>();

  ResultState<CoreResList<HomeEvent>> get fetchHomeEvent =>
      dataMap?[_HomeEventData];
  Future? get fetchUser => dataMap?[_UserData];
  Future? get fetchToken => dataMap?[_TokenData];

  bool get fetchingHomeEvent => busy(_HomeEventData);
  bool get fetchingUser => busy(_UserData);
  bool get fetchingToken => busy(_TokenData);

  final TextEditingController searchController = TextEditingController();

  Profile? user;
  List<HomeEvent> eventList = [];
  String? token;

  @override
  Map<String, Future Function()> get futuresMap => {
        _HomeEventData: getHomeEvent,
        _UserData: getUser,
        _TokenData: getToken,
      };

  Future getUser() async {
    user = await _authService.getUser();
    notifyListeners();
  }

  Future getToken() async {
    token = await HttpHelper().getToken();
    notifyListeners();
  }

  Future<ResultState<CoreResList<HomeEvent>>> getHomeEvent() async {
    var result = await _homeService.fetchHomeEvent();
    return result.when(
      success: (CoreResList<HomeEvent> data) async {
        eventList = data.data ?? [];
        getToken();
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (
        NetworkExceptions error,
        String? message,
      ) async {
        notifyListeners();
        showMessageError('$error');
        return ResultState.error(error: error);
      },
    );
  }

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);
  void toLandingPage() =>
      navigationService.clearStackAndShow(Routes.landingPageView);
}
