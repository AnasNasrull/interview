import 'dart:convert';

import 'package:interview_task/src/constant/session.dart';
import 'package:interview_task/src/core/core_res_single.dart';
import 'package:interview_task/src/core/core_service.dart';
import 'package:interview_task/src/models/auth.dart';
import 'package:interview_task/src/models/profile.dart';
import 'package:interview_task/src/network/api_result.dart';
import 'package:interview_task/src/network/network_exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class AuthService extends CoreService {
  Future<void> saveUser(Profile? data) async {
    final Profile? user = data;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Session.user, jsonEncode(user));
  }

  Future<Profile> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> userMap;
    final String userStr = prefs.getString(Session.user) ?? '{}';
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    final Profile user = Profile.fromJson(userMap);
    return user;
  }

  Future<ApiResult<CoreResSingle<Auth>>> login(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      var result = await apiService.auth(body);
      sharedPreferencesHelper.putString(
        Session.token,
        result.data?.token ?? '',
      );

      saveUser(result.data?.profile);

      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        message: NetworkExceptions.getMessage(e, true),
      );
    }
  }
}
