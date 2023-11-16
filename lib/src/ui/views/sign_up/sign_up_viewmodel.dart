import 'package:flutter/material.dart';
import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';

import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel with CoreViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscure = true;

  void toLogin() => navigationService.clearStackAndShow(Routes.loginView);
  void toLandingPage() =>
      navigationService.clearStackAndShow(Routes.landingPageView);
}
