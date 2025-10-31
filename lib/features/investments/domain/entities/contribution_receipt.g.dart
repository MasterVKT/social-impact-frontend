// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution_receipt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContributionReceiptImpl _$$ContributionReceiptImplFromJson(
        Map<String, dynamic> json) =>
    _$ContributionReceiptImpl(
      id: json['id'] as String,
      contributionId: json['contributionId'] as String,
      userId: json['userId'] as String,
      url: json['url'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      kind: json['kind'] as String? ?? 'contribution',
    );

Map<String, dynamic> _$$ContributionReceiptImplToJson(
        _$ContributionReceiptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contributionId': instance.contributionId,
      'userId': instance.userId,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'kind': instance.kind,
    };
