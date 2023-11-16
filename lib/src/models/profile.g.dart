// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      userCode: json['user_code'] as String?,
      gender: json['gender'] as num?,
      birthPlace: json['birth_place'] as String?,
      birthDate: json['birth_date'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      instagram: json['instagram'] as String?,
      tiktok: json['tiktok'] as String?,
      facebook: json['facebook'] as String?,
      status: json['status'] as num?,
      profileImage: json['profile_image'] as String?,
      wallet: (json['wallet'] as num?)?.toDouble(),
      userType: json['user_type'] as String?,
      deleteRequestAt: json['delete_request_at'] as String?,
      activeEvent: json['active_event'] as num?,
      faces: json['faces'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullname': instance.fullname,
      'user_code': instance.userCode,
      'gender': instance.gender,
      'birth_place': instance.birthPlace,
      'birth_date': instance.birthDate,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'instagram': instance.instagram,
      'tiktok': instance.tiktok,
      'facebook': instance.facebook,
      'status': instance.status,
      'profile_image': instance.profileImage,
      'wallet': instance.wallet,
      'user_type': instance.userType,
      'delete_request_at': instance.deleteRequestAt,
      'active_event': instance.activeEvent,
      'faces': instance.faces,
    };
