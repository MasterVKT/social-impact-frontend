// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContributionFiltersImpl _$$ContributionFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$ContributionFiltersImpl(
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ContributionStatusEnumMap, e))
          .toList(),
      projectId: json['projectId'] as String?,
      minAmountCents: (json['minAmountCents'] as num?)?.toInt(),
      maxAmountCents: (json['maxAmountCents'] as num?)?.toInt(),
      searchText: json['searchText'] as String?,
    );

Map<String, dynamic> _$$ContributionFiltersImplToJson(
        _$ContributionFiltersImpl instance) =>
    <String, dynamic>{
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'statuses': instance.statuses
          ?.map((e) => _$ContributionStatusEnumMap[e]!)
          .toList(),
      'projectId': instance.projectId,
      'minAmountCents': instance.minAmountCents,
      'maxAmountCents': instance.maxAmountCents,
      'searchText': instance.searchText,
    };

const _$ContributionStatusEnumMap = {
  ContributionStatus.pending: 'pending',
  ContributionStatus.confirmed: 'confirmed',
  ContributionStatus.failed: 'failed',
  ContributionStatus.refunded: 'refunded',
};
