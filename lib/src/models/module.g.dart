// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Module _$ModuleFromJson(Map<String, dynamic> json) => Module(
      ruleCode: json['rule_code'] as String?,
      ruleText: json['rule_text'] as String?,
      ruleType: json['rule_type'] as num?,
      canAccess: json['can_access'] as bool?,
      canAdd: json['can_add'] as bool?,
      canEdit: json['can_edit'] as bool?,
      canDelete: json['can_delete'] as bool?,
    );

Map<String, dynamic> _$ModuleToJson(Module instance) => <String, dynamic>{
      'rule_code': instance.ruleCode,
      'rule_text': instance.ruleText,
      'rule_type': instance.ruleType,
      'can_access': instance.canAccess,
      'can_add': instance.canAdd,
      'can_edit': instance.canEdit,
      'can_delete': instance.canDelete,
    };
