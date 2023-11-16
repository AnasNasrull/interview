import 'package:json_annotation/json_annotation.dart';

part 'core_res_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResList<T> {
  String? status;
  String? message;
  List<T>? data;
  dynamic meta;

  CoreResList({
    this.status,
    this.message,
    this.data,
    this.meta,
  });

  factory CoreResList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResListToJson(this, toJsonT);
}
