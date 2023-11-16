import 'package:interview_task/src/app/app.router.dart';
import 'package:interview_task/src/core/core_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LandingPageViewModel extends BaseViewModel with CoreViewModel {
  void toLogin() => navigationService.navigateTo(Routes.loginView);
  void toSignUp() => navigationService.navigateTo(Routes.signUpView);

  void showDashboard() => navigationService.clearStackAndShow(Routes.mainView);
}
