// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeEvent _$HomeEventFromJson(Map<String, dynamic> json) => HomeEvent(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      city: json['city'] as String?,
      description: json['description'] as String?,
      dateStart: json['date_start'] as String?,
      dateFinish: json['date_finish'] as String?,
      timeStart: json['time_start'] as String?,
      timeFinish: json['time_finish'] as String?,
      eventGroupId: json['event_group_id'] as String?,
      picEvent: json['pic_event'] as String?,
      teamAId: json['team_a_id'] as String?,
      teamAName: json['team_a_name'] as String?,
      teamBId: json['team_b_id'] as String?,
      teamBName: json['team_b_name'] as String?,
      paymentMethod: json['payment_method'] as String?,
      photoPrice: json['photo_price'] as String?,
      videoPrice: json['video_price'] as String?,
      coverImage: json['cover_image'] as String?,
      linkYoutube: json['link_youtube'] as String?,
      createdBy: json['created_by'] as String?,
      groupCode: json['group_code'] as String?,
      groupName: json['group_name'] as String?,
      eventType: json['event_type'] as String?,
      jerseyNo: json['jersey_no'] as String?,
      isSingle: json['is_single'] as bool?,
    );

Map<String, dynamic> _$HomeEventToJson(HomeEvent instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'location': instance.location,
      'city': instance.city,
      'description': instance.description,
      'date_start': instance.dateStart,
      'date_finish': instance.dateFinish,
      'time_start': instance.timeStart,
      'time_finish': instance.timeFinish,
      'event_group_id': instance.eventGroupId,
      'pic_event': instance.picEvent,
      'team_a_id': instance.teamAId,
      'team_a_name': instance.teamAName,
      'team_b_id': instance.teamBId,
      'team_b_name': instance.teamBName,
      'payment_method': instance.paymentMethod,
      'photo_price': instance.photoPrice,
      'video_price': instance.videoPrice,
      'cover_image': instance.coverImage,
      'link_youtube': instance.linkYoutube,
      'created_by': instance.createdBy,
      'group_code': instance.groupCode,
      'group_name': instance.groupName,
      'event_type': instance.eventType,
      'jersey_no': instance.jerseyNo,
      'is_single': instance.isSingle,
    };
