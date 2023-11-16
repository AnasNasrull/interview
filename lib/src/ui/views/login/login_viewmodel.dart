import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.locator.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:interview_task/src/models/auth.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:interview_task/src/network/result_state.dart';
import 'package:interview_task/src/services/auth_service.dart';

import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel with CoreViewModel {
  final _authService = locator<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscure = true;

  void validate() async {
    if (formKey.currentState?.validate() ?? false) login();
  }

  Future<ResultState<CoreResSingle<Auth>>> login() async {
    setBusy(true);
    var result = await _authService.login(
      emailController.text,
      passwordController.text,
    );
    setBusy(false);
    return result.when(
      success: (CoreResSingle<Auth> data) async {
        showDashboard();
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (
        NetworkExceptions error,
        String? message,
      ) async {
        showMessageError(message ?? '');
        notifyListeners();
        return ResultState.error(error: error);
      },
    );
  }

  void showDashboard() => navigationService.clearStackAndShow(Routes.mainView);
  void toSignUp() => navigationService.clearStackAndShow(Routes.signUpView);
  void toLandingPage() =>
      navigationService.clearStackAndShow(Routes.landingPageView);
}
