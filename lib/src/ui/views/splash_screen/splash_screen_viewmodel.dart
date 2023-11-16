import 'dart:async';

import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/constant/session.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreenViewModel extends FutureViewModel with CoreViewModel {
  final _duration = const Duration(seconds: 2);
  final currentTime = DateTime.now();

  @override
  Future futureToRun() => showNextPage();

  Future<void> showNextPage() async {
    final token = sharedPreferencesHelper.getString(Session.token);
    if (token != null) {
      Timer(_duration, showDashboard);
    } else {
      Timer(_duration, showLandingPage);
    }
  }

  void showLandingPage() => navigationService.clearStackAndShow(Routes.landingPageView);

  void showDashboard() => navigationService.clearStackAndShow(Routes.mainView);

  void blankView() => navigationService.clearStackAndShow(Routes.blankView);
}
