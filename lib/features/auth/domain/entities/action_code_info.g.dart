// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_code_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActionCodeInfoImpl _$$ActionCodeInfoImplFromJson(Map<String, dynamic> json) =>
    _$ActionCodeInfoImpl(
      operation: json['operation'] as String,
      email: json['email'] as String,
      previousEmail: json['previousEmail'] as String?,
      data: json['data'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$ActionCodeInfoImplToJson(
        _$ActionCodeInfoImpl instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'email': instance.email,
      'previousEmail': instance.previousEmail,
      'data': instance.data,
    };
