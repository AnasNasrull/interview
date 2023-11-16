import 'package:interview_task/src/models/profile.dart';
import 'package:interview_task/src/models/module.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'profile')
  Profile? profile;

  @JsonKey(name: 'modules')
  List<Module>? modules;

  Auth({
    this.token,
    this.profile,
    this.modules,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
