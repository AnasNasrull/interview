import 'package:json_annotation/json_annotation.dart';

part 'home_event.g.dart';

@JsonSerializable()
class HomeEvent {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'city')
  String? city;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'date_start')
  String? dateStart;

  @JsonKey(name: 'date_finish')
  String? dateFinish;

  @JsonKey(name: 'time_start')
  String? timeStart;

  @JsonKey(name: 'time_finish')
  String? timeFinish;

  @JsonKey(name: 'event_group_id')
  String? eventGroupId;

  @JsonKey(name: 'pic_event')
  String? picEvent;

  @JsonKey(name: 'team_a_id')
  String? teamAId;

  @JsonKey(name: 'team_a_name')
  String? teamAName;

  @JsonKey(name: 'team_b_id')
  String? teamBId;

  @JsonKey(name: 'team_b_name')
  String? teamBName;

  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  @JsonKey(name: 'photo_price')
  String? photoPrice;

  @JsonKey(name: 'video_price')
  String? videoPrice;

  @JsonKey(name: 'cover_image')
  String? coverImage;

  @JsonKey(name: 'link_youtube')
  String? linkYoutube;

  @JsonKey(name: 'created_by')
  String? createdBy;

  @JsonKey(name: 'group_code')
  String? groupCode;

  @JsonKey(name: 'group_name')
  String? groupName;

  @JsonKey(name: 'event_type')
  String? eventType;

  @JsonKey(name: 'jersey_no')
  String? jerseyNo;

  @JsonKey(name: 'is_single')
  bool? isSingle;

  HomeEvent({
    this.id,
    this.code,
    this.name,
    this.location,
    this.city,
    this.description,
    this.dateStart,
    this.dateFinish,
    this.timeStart,
    this.timeFinish,
    this.eventGroupId,
    this.picEvent,
    this.teamAId,
    this.teamAName,
    this.teamBId,
    this.teamBName,
    this.paymentMethod,
    this.photoPrice,
    this.videoPrice,
    this.coverImage,
    this.linkYoutube,
    this.createdBy,
    this.groupCode,
    this.groupName,
    this.eventType,
    this.jerseyNo,
    this.isSingle,
  });

  factory HomeEvent.fromJson(Map<String, dynamic> json) =>
      _$HomeEventFromJson(json);

  Map<String, dynamic> toJson() => _$HomeEventToJson(this);
}
