// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContributionImpl _$$ContributionImplFromJson(Map<String, dynamic> json) =>
    _$ContributionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      projectId: json['projectId'] as String,
      amountCents: (json['amountCents'] as num).toInt(),
      currency: json['currency'] as String? ?? 'EUR',
      status:
          $enumDecodeNullable(_$ContributionStatusEnumMap, json['status']) ??
              ContributionStatus.pending,
      createdAt: DateTime.parse(json['createdAt'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      anonymous: json['anonymous'] as bool? ?? false,
      fees: json['fees'] == null
          ? null
          : ContributionFees.fromJson(json['fees'] as Map<String, dynamic>),
      receiptUrl: json['receiptUrl'] as String?,
      paymentIntentId: json['paymentIntentId'] as String?,
      stripeClientSecret: json['stripeClientSecret'] as String?,
    );

Map<String, dynamic> _$$ContributionImplToJson(_$ContributionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'projectId': instance.projectId,
      'amountCents': instance.amountCents,
      'currency': instance.currency,
      'status': _$ContributionStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'anonymous': instance.anonymous,
      'fees': instance.fees,
      'receiptUrl': instance.receiptUrl,
      'paymentIntentId': instance.paymentIntentId,
      'stripeClientSecret': instance.stripeClientSecret,
    };

const _$ContributionStatusEnumMap = {
  ContributionStatus.pending: 'pending',
  ContributionStatus.confirmed: 'confirmed',
  ContributionStatus.failed: 'failed',
  ContributionStatus.refunded: 'refunded',
};

_$ContributionFeesImpl _$$ContributionFeesImplFromJson(
        Map<String, dynamic> json) =>
    _$ContributionFeesImpl(
      platformCents: (json['platformCents'] as num?)?.toInt() ?? 0,
      auditCents: (json['auditCents'] as num?)?.toInt() ?? 0,
      stripeCents: (json['stripeCents'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ContributionFeesImplToJson(
        _$ContributionFeesImpl instance) =>
    <String, dynamic>{
      'platformCents': instance.platformCents,
      'auditCents': instance.auditCents,
      'stripeCents': instance.stripeCents,
    };
