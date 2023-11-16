import 'package:json_annotation/json_annotation.dart';

part 'core_res_single.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreResSingle<T> {
  String? status;
  String? message;
  T? data;
  dynamic meta;

  CoreResSingle({
    this.status,
    this.message,
    this.data,
    this.meta,
  });

  factory CoreResSingle.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResSingleFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResSingleToJson(this, toJsonT);
}
