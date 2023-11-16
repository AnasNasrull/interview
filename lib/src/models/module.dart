import 'package:json_annotation/json_annotation.dart';

part 'module.g.dart';

@JsonSerializable()
class Module {
  @JsonKey(name: 'rule_code')
  String? ruleCode;

  @JsonKey(name: 'rule_text')
  String? ruleText;

  @JsonKey(name: 'rule_type')
  num? ruleType;

  @JsonKey(name: 'can_access')
  bool? canAccess;

  @JsonKey(name: 'can_add')
  bool? canAdd;

  @JsonKey(name: 'can_edit')
  bool? canEdit;

  @JsonKey(name: 'can_delete')
  bool? canDelete;

  Module({
    this.ruleCode,
    this.ruleText,
    this.ruleType,
    this.canAccess,
    this.canAdd,
    this.canEdit,
    this.canDelete,
  });

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleToJson(this);
}
