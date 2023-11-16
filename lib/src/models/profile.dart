import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'fullname')
  String? fullname;

  @JsonKey(name: 'user_code')
  String? userCode;

  @JsonKey(name: 'gender')
  num? gender;

  @JsonKey(name: 'birth_place')
  String? birthPlace;

  @JsonKey(name: 'birth_date')
  String? birthDate;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'instagram')
  String? instagram;

  @JsonKey(name: 'tiktok')
  String? tiktok;

  @JsonKey(name: 'facebook')
  String? facebook;

  @JsonKey(name: 'status')
  num? status;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'wallet')
  double? wallet;

  @JsonKey(name: 'user_type')
  String? userType;

  @JsonKey(name: 'delete_request_at')
  String? deleteRequestAt;

  @JsonKey(name: 'active_event')
  num? activeEvent;

  @JsonKey(name: 'faces')
  List? faces;

  Profile({
    this.id,
    this.email,
    this.fullname,
    this.userCode,
    this.gender,
    this.birthPlace,
    this.birthDate,
    this.address,
    this.phoneNumber,
    this.instagram,
    this.tiktok,
    this.facebook,
    this.status,
    this.profileImage,
    this.wallet,
    this.userType,
    this.deleteRequestAt,
    this.activeEvent,
    this.faces,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
