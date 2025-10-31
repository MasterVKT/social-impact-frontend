// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KYCData _$KYCDataFromJson(Map<String, dynamic> json) {
  return _KYCData.fromJson(json);
}

/// @nodoc
mixin _$KYCData {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  KYCStatus get status => throw _privateConstructorUsedError;
  KYCLevel get level => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get submittedAt => throw _privateConstructorUsedError;
  DateTime? get reviewedAt => throw _privateConstructorUsedError;
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String? get reviewNotes => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;
  List<String>? get rejectionReasons => throw _privateConstructorUsedError;
  PersonalInfo get personalInfo => throw _privateConstructorUsedError;
  AddressInfo get addressInfo => throw _privateConstructorUsedError;
  List<KYCDocument> get documents => throw _privateConstructorUsedError;
  List<KYCVerificationStep> get verificationSteps =>
      throw _privateConstructorUsedError;
  FinancialInfo? get financialInfo => throw _privateConstructorUsedError;
  BusinessInfo? get businessInfo => throw _privateConstructorUsedError;
  RiskAssessment? get riskAssessment => throw _privateConstructorUsedError;
  BiometricData? get biometricData => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCDataCopyWith<KYCData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCDataCopyWith<$Res> {
  factory $KYCDataCopyWith(KYCData value, $Res Function(KYCData) then) =
      _$KYCDataCopyWithImpl<$Res, KYCData>;
  @useResult
  $Res call(
      {String id,
      String userId,
      KYCStatus status,
      KYCLevel level,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? submittedAt,
      DateTime? reviewedAt,
      DateTime? approvedAt,
      String? reviewNotes,
      String? rejectionReason,
      List<String>? rejectionReasons,
      PersonalInfo personalInfo,
      AddressInfo addressInfo,
      List<KYCDocument> documents,
      List<KYCVerificationStep> verificationSteps,
      FinancialInfo? financialInfo,
      BusinessInfo? businessInfo,
      RiskAssessment? riskAssessment,
      BiometricData? biometricData,
      Map<String, dynamic> metadata});

  $PersonalInfoCopyWith<$Res> get personalInfo;
  $AddressInfoCopyWith<$Res> get addressInfo;
  $FinancialInfoCopyWith<$Res>? get financialInfo;
  $BusinessInfoCopyWith<$Res>? get businessInfo;
  $RiskAssessmentCopyWith<$Res>? get riskAssessment;
  $BiometricDataCopyWith<$Res>? get biometricData;
}

/// @nodoc
class _$KYCDataCopyWithImpl<$Res, $Val extends KYCData>
    implements $KYCDataCopyWith<$Res> {
  _$KYCDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? submittedAt = freezed,
    Object? reviewedAt = freezed,
    Object? approvedAt = freezed,
    Object? reviewNotes = freezed,
    Object? rejectionReason = freezed,
    Object? rejectionReasons = freezed,
    Object? personalInfo = null,
    Object? addressInfo = null,
    Object? documents = null,
    Object? verificationSteps = null,
    Object? financialInfo = freezed,
    Object? businessInfo = freezed,
    Object? riskAssessment = freezed,
    Object? biometricData = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStatus,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewNotes: freezed == reviewNotes
          ? _value.reviewNotes
          : reviewNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReasons: freezed == rejectionReasons
          ? _value.rejectionReasons
          : rejectionReasons // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      personalInfo: null == personalInfo
          ? _value.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfo,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      documents: null == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<KYCDocument>,
      verificationSteps: null == verificationSteps
          ? _value.verificationSteps
          : verificationSteps // ignore: cast_nullable_to_non_nullable
              as List<KYCVerificationStep>,
      financialInfo: freezed == financialInfo
          ? _value.financialInfo
          : financialInfo // ignore: cast_nullable_to_non_nullable
              as FinancialInfo?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      riskAssessment: freezed == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as RiskAssessment?,
      biometricData: freezed == biometricData
          ? _value.biometricData
          : biometricData // ignore: cast_nullable_to_non_nullable
              as BiometricData?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonalInfoCopyWith<$Res> get personalInfo {
    return $PersonalInfoCopyWith<$Res>(_value.personalInfo, (value) {
      return _then(_value.copyWith(personalInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressInfoCopyWith<$Res> get addressInfo {
    return $AddressInfoCopyWith<$Res>(_value.addressInfo, (value) {
      return _then(_value.copyWith(addressInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FinancialInfoCopyWith<$Res>? get financialInfo {
    if (_value.financialInfo == null) {
      return null;
    }

    return $FinancialInfoCopyWith<$Res>(_value.financialInfo!, (value) {
      return _then(_value.copyWith(financialInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessInfoCopyWith<$Res>? get businessInfo {
    if (_value.businessInfo == null) {
      return null;
    }

    return $BusinessInfoCopyWith<$Res>(_value.businessInfo!, (value) {
      return _then(_value.copyWith(businessInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RiskAssessmentCopyWith<$Res>? get riskAssessment {
    if (_value.riskAssessment == null) {
      return null;
    }

    return $RiskAssessmentCopyWith<$Res>(_value.riskAssessment!, (value) {
      return _then(_value.copyWith(riskAssessment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BiometricDataCopyWith<$Res>? get biometricData {
    if (_value.biometricData == null) {
      return null;
    }

    return $BiometricDataCopyWith<$Res>(_value.biometricData!, (value) {
      return _then(_value.copyWith(biometricData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KYCDataImplCopyWith<$Res> implements $KYCDataCopyWith<$Res> {
  factory _$$KYCDataImplCopyWith(
          _$KYCDataImpl value, $Res Function(_$KYCDataImpl) then) =
      __$$KYCDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      KYCStatus status,
      KYCLevel level,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? submittedAt,
      DateTime? reviewedAt,
      DateTime? approvedAt,
      String? reviewNotes,
      String? rejectionReason,
      List<String>? rejectionReasons,
      PersonalInfo personalInfo,
      AddressInfo addressInfo,
      List<KYCDocument> documents,
      List<KYCVerificationStep> verificationSteps,
      FinancialInfo? financialInfo,
      BusinessInfo? businessInfo,
      RiskAssessment? riskAssessment,
      BiometricData? biometricData,
      Map<String, dynamic> metadata});

  @override
  $PersonalInfoCopyWith<$Res> get personalInfo;
  @override
  $AddressInfoCopyWith<$Res> get addressInfo;
  @override
  $FinancialInfoCopyWith<$Res>? get financialInfo;
  @override
  $BusinessInfoCopyWith<$Res>? get businessInfo;
  @override
  $RiskAssessmentCopyWith<$Res>? get riskAssessment;
  @override
  $BiometricDataCopyWith<$Res>? get biometricData;
}

/// @nodoc
class __$$KYCDataImplCopyWithImpl<$Res>
    extends _$KYCDataCopyWithImpl<$Res, _$KYCDataImpl>
    implements _$$KYCDataImplCopyWith<$Res> {
  __$$KYCDataImplCopyWithImpl(
      _$KYCDataImpl _value, $Res Function(_$KYCDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? submittedAt = freezed,
    Object? reviewedAt = freezed,
    Object? approvedAt = freezed,
    Object? reviewNotes = freezed,
    Object? rejectionReason = freezed,
    Object? rejectionReasons = freezed,
    Object? personalInfo = null,
    Object? addressInfo = null,
    Object? documents = null,
    Object? verificationSteps = null,
    Object? financialInfo = freezed,
    Object? businessInfo = freezed,
    Object? riskAssessment = freezed,
    Object? biometricData = freezed,
    Object? metadata = null,
  }) {
    return _then(_$KYCDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStatus,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submittedAt: freezed == submittedAt
          ? _value.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewNotes: freezed == reviewNotes
          ? _value.reviewNotes
          : reviewNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionReasons: freezed == rejectionReasons
          ? _value._rejectionReasons
          : rejectionReasons // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      personalInfo: null == personalInfo
          ? _value.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfo,
      addressInfo: null == addressInfo
          ? _value.addressInfo
          : addressInfo // ignore: cast_nullable_to_non_nullable
              as AddressInfo,
      documents: null == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<KYCDocument>,
      verificationSteps: null == verificationSteps
          ? _value._verificationSteps
          : verificationSteps // ignore: cast_nullable_to_non_nullable
              as List<KYCVerificationStep>,
      financialInfo: freezed == financialInfo
          ? _value.financialInfo
          : financialInfo // ignore: cast_nullable_to_non_nullable
              as FinancialInfo?,
      businessInfo: freezed == businessInfo
          ? _value.businessInfo
          : businessInfo // ignore: cast_nullable_to_non_nullable
              as BusinessInfo?,
      riskAssessment: freezed == riskAssessment
          ? _value.riskAssessment
          : riskAssessment // ignore: cast_nullable_to_non_nullable
              as RiskAssessment?,
      biometricData: freezed == biometricData
          ? _value.biometricData
          : biometricData // ignore: cast_nullable_to_non_nullable
              as BiometricData?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCDataImpl extends _KYCData {
  const _$KYCDataImpl(
      {required this.id,
      required this.userId,
      required this.status,
      required this.level,
      required this.createdAt,
      required this.updatedAt,
      this.submittedAt,
      this.reviewedAt,
      this.approvedAt,
      this.reviewNotes,
      this.rejectionReason,
      final List<String>? rejectionReasons,
      required this.personalInfo,
      required this.addressInfo,
      required final List<KYCDocument> documents,
      final List<KYCVerificationStep> verificationSteps = const [],
      this.financialInfo,
      this.businessInfo,
      this.riskAssessment,
      this.biometricData,
      final Map<String, dynamic> metadata = const {}})
      : _rejectionReasons = rejectionReasons,
        _documents = documents,
        _verificationSteps = verificationSteps,
        _metadata = metadata,
        super._();

  factory _$KYCDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCDataImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final KYCStatus status;
  @override
  final KYCLevel level;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? submittedAt;
  @override
  final DateTime? reviewedAt;
  @override
  final DateTime? approvedAt;
  @override
  final String? reviewNotes;
  @override
  final String? rejectionReason;
  final List<String>? _rejectionReasons;
  @override
  List<String>? get rejectionReasons {
    final value = _rejectionReasons;
    if (value == null) return null;
    if (_rejectionReasons is EqualUnmodifiableListView)
      return _rejectionReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PersonalInfo personalInfo;
  @override
  final AddressInfo addressInfo;
  final List<KYCDocument> _documents;
  @override
  List<KYCDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<KYCVerificationStep> _verificationSteps;
  @override
  @JsonKey()
  List<KYCVerificationStep> get verificationSteps {
    if (_verificationSteps is EqualUnmodifiableListView)
      return _verificationSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verificationSteps);
  }

  @override
  final FinancialInfo? financialInfo;
  @override
  final BusinessInfo? businessInfo;
  @override
  final RiskAssessment? riskAssessment;
  @override
  final BiometricData? biometricData;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'KYCData(id: $id, userId: $userId, status: $status, level: $level, createdAt: $createdAt, updatedAt: $updatedAt, submittedAt: $submittedAt, reviewedAt: $reviewedAt, approvedAt: $approvedAt, reviewNotes: $reviewNotes, rejectionReason: $rejectionReason, rejectionReasons: $rejectionReasons, personalInfo: $personalInfo, addressInfo: $addressInfo, documents: $documents, verificationSteps: $verificationSteps, financialInfo: $financialInfo, businessInfo: $businessInfo, riskAssessment: $riskAssessment, biometricData: $biometricData, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.reviewNotes, reviewNotes) ||
                other.reviewNotes == reviewNotes) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            const DeepCollectionEquality()
                .equals(other._rejectionReasons, _rejectionReasons) &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo) &&
            (identical(other.addressInfo, addressInfo) ||
                other.addressInfo == addressInfo) &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents) &&
            const DeepCollectionEquality()
                .equals(other._verificationSteps, _verificationSteps) &&
            (identical(other.financialInfo, financialInfo) ||
                other.financialInfo == financialInfo) &&
            (identical(other.businessInfo, businessInfo) ||
                other.businessInfo == businessInfo) &&
            (identical(other.riskAssessment, riskAssessment) ||
                other.riskAssessment == riskAssessment) &&
            (identical(other.biometricData, biometricData) ||
                other.biometricData == biometricData) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        status,
        level,
        createdAt,
        updatedAt,
        submittedAt,
        reviewedAt,
        approvedAt,
        reviewNotes,
        rejectionReason,
        const DeepCollectionEquality().hash(_rejectionReasons),
        personalInfo,
        addressInfo,
        const DeepCollectionEquality().hash(_documents),
        const DeepCollectionEquality().hash(_verificationSteps),
        financialInfo,
        businessInfo,
        riskAssessment,
        biometricData,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCDataImplCopyWith<_$KYCDataImpl> get copyWith =>
      __$$KYCDataImplCopyWithImpl<_$KYCDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCDataImplToJson(
      this,
    );
  }
}

abstract class _KYCData extends KYCData {
  const factory _KYCData(
      {required final String id,
      required final String userId,
      required final KYCStatus status,
      required final KYCLevel level,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final DateTime? submittedAt,
      final DateTime? reviewedAt,
      final DateTime? approvedAt,
      final String? reviewNotes,
      final String? rejectionReason,
      final List<String>? rejectionReasons,
      required final PersonalInfo personalInfo,
      required final AddressInfo addressInfo,
      required final List<KYCDocument> documents,
      final List<KYCVerificationStep> verificationSteps,
      final FinancialInfo? financialInfo,
      final BusinessInfo? businessInfo,
      final RiskAssessment? riskAssessment,
      final BiometricData? biometricData,
      final Map<String, dynamic> metadata}) = _$KYCDataImpl;
  const _KYCData._() : super._();

  factory _KYCData.fromJson(Map<String, dynamic> json) = _$KYCDataImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  KYCStatus get status;
  @override
  KYCLevel get level;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get submittedAt;
  @override
  DateTime? get reviewedAt;
  @override
  DateTime? get approvedAt;
  @override
  String? get reviewNotes;
  @override
  String? get rejectionReason;
  @override
  List<String>? get rejectionReasons;
  @override
  PersonalInfo get personalInfo;
  @override
  AddressInfo get addressInfo;
  @override
  List<KYCDocument> get documents;
  @override
  List<KYCVerificationStep> get verificationSteps;
  @override
  FinancialInfo? get financialInfo;
  @override
  BusinessInfo? get businessInfo;
  @override
  RiskAssessment? get riskAssessment;
  @override
  BiometricData? get biometricData;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$KYCDataImplCopyWith<_$KYCDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) {
  return _PersonalInfo.fromJson(json);
}

/// @nodoc
mixin _$PersonalInfo {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String? get countryOfResidence => throw _privateConstructorUsedError;
  String? get placeOfBirth => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  String? get employerName => throw _privateConstructorUsedError;
  double? get annualIncome => throw _privateConstructorUsedError;
  String? get sourceOfFunds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalInfoCopyWith<PersonalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoCopyWith<$Res> {
  factory $PersonalInfoCopyWith(
          PersonalInfo value, $Res Function(PersonalInfo) then) =
      _$PersonalInfoCopyWithImpl<$Res, PersonalInfo>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? middleName,
      DateTime dateOfBirth,
      String nationality,
      String? countryOfResidence,
      String? placeOfBirth,
      String phoneNumber,
      String email,
      String? occupation,
      String? employerName,
      double? annualIncome,
      String? sourceOfFunds});
}

/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res, $Val extends PersonalInfo>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? dateOfBirth = null,
    Object? nationality = null,
    Object? countryOfResidence = freezed,
    Object? placeOfBirth = freezed,
    Object? phoneNumber = null,
    Object? email = null,
    Object? occupation = freezed,
    Object? employerName = freezed,
    Object? annualIncome = freezed,
    Object? sourceOfFunds = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      countryOfResidence: freezed == countryOfResidence
          ? _value.countryOfResidence
          : countryOfResidence // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      annualIncome: freezed == annualIncome
          ? _value.annualIncome
          : annualIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      sourceOfFunds: freezed == sourceOfFunds
          ? _value.sourceOfFunds
          : sourceOfFunds // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalInfoImplCopyWith<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  factory _$$PersonalInfoImplCopyWith(
          _$PersonalInfoImpl value, $Res Function(_$PersonalInfoImpl) then) =
      __$$PersonalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String? middleName,
      DateTime dateOfBirth,
      String nationality,
      String? countryOfResidence,
      String? placeOfBirth,
      String phoneNumber,
      String email,
      String? occupation,
      String? employerName,
      double? annualIncome,
      String? sourceOfFunds});
}

/// @nodoc
class __$$PersonalInfoImplCopyWithImpl<$Res>
    extends _$PersonalInfoCopyWithImpl<$Res, _$PersonalInfoImpl>
    implements _$$PersonalInfoImplCopyWith<$Res> {
  __$$PersonalInfoImplCopyWithImpl(
      _$PersonalInfoImpl _value, $Res Function(_$PersonalInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? dateOfBirth = null,
    Object? nationality = null,
    Object? countryOfResidence = freezed,
    Object? placeOfBirth = freezed,
    Object? phoneNumber = null,
    Object? email = null,
    Object? occupation = freezed,
    Object? employerName = freezed,
    Object? annualIncome = freezed,
    Object? sourceOfFunds = freezed,
  }) {
    return _then(_$PersonalInfoImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      countryOfResidence: freezed == countryOfResidence
          ? _value.countryOfResidence
          : countryOfResidence // ignore: cast_nullable_to_non_nullable
              as String?,
      placeOfBirth: freezed == placeOfBirth
          ? _value.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      annualIncome: freezed == annualIncome
          ? _value.annualIncome
          : annualIncome // ignore: cast_nullable_to_non_nullable
              as double?,
      sourceOfFunds: freezed == sourceOfFunds
          ? _value.sourceOfFunds
          : sourceOfFunds // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalInfoImpl implements _PersonalInfo {
  const _$PersonalInfoImpl(
      {required this.firstName,
      required this.lastName,
      this.middleName,
      required this.dateOfBirth,
      required this.nationality,
      this.countryOfResidence,
      this.placeOfBirth,
      required this.phoneNumber,
      required this.email,
      this.occupation,
      this.employerName,
      this.annualIncome,
      this.sourceOfFunds});

  factory _$PersonalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalInfoImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? middleName;
  @override
  final DateTime dateOfBirth;
  @override
  final String nationality;
  @override
  final String? countryOfResidence;
  @override
  final String? placeOfBirth;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String? occupation;
  @override
  final String? employerName;
  @override
  final double? annualIncome;
  @override
  final String? sourceOfFunds;

  @override
  String toString() {
    return 'PersonalInfo(firstName: $firstName, lastName: $lastName, middleName: $middleName, dateOfBirth: $dateOfBirth, nationality: $nationality, countryOfResidence: $countryOfResidence, placeOfBirth: $placeOfBirth, phoneNumber: $phoneNumber, email: $email, occupation: $occupation, employerName: $employerName, annualIncome: $annualIncome, sourceOfFunds: $sourceOfFunds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.countryOfResidence, countryOfResidence) ||
                other.countryOfResidence == countryOfResidence) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.annualIncome, annualIncome) ||
                other.annualIncome == annualIncome) &&
            (identical(other.sourceOfFunds, sourceOfFunds) ||
                other.sourceOfFunds == sourceOfFunds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      middleName,
      dateOfBirth,
      nationality,
      countryOfResidence,
      placeOfBirth,
      phoneNumber,
      email,
      occupation,
      employerName,
      annualIncome,
      sourceOfFunds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      __$$PersonalInfoImplCopyWithImpl<_$PersonalInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalInfoImplToJson(
      this,
    );
  }
}

abstract class _PersonalInfo implements PersonalInfo {
  const factory _PersonalInfo(
      {required final String firstName,
      required final String lastName,
      final String? middleName,
      required final DateTime dateOfBirth,
      required final String nationality,
      final String? countryOfResidence,
      final String? placeOfBirth,
      required final String phoneNumber,
      required final String email,
      final String? occupation,
      final String? employerName,
      final double? annualIncome,
      final String? sourceOfFunds}) = _$PersonalInfoImpl;

  factory _PersonalInfo.fromJson(Map<String, dynamic> json) =
      _$PersonalInfoImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get middleName;
  @override
  DateTime get dateOfBirth;
  @override
  String get nationality;
  @override
  String? get countryOfResidence;
  @override
  String? get placeOfBirth;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String? get occupation;
  @override
  String? get employerName;
  @override
  double? get annualIncome;
  @override
  String? get sourceOfFunds;
  @override
  @JsonKey(ignore: true)
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressInfo _$AddressInfoFromJson(Map<String, dynamic> json) {
  return _AddressInfo.fromJson(json);
}

/// @nodoc
mixin _$AddressInfo {
  String get street => throw _privateConstructorUsedError;
  String? get apartment => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  bool? get isPrimary => throw _privateConstructorUsedError;
  DateTime? get residenceSince => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressInfoCopyWith<AddressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressInfoCopyWith<$Res> {
  factory $AddressInfoCopyWith(
          AddressInfo value, $Res Function(AddressInfo) then) =
      _$AddressInfoCopyWithImpl<$Res, AddressInfo>;
  @useResult
  $Res call(
      {String street,
      String? apartment,
      String city,
      String state,
      String postalCode,
      String country,
      bool? isPrimary,
      DateTime? residenceSince});
}

/// @nodoc
class _$AddressInfoCopyWithImpl<$Res, $Val extends AddressInfo>
    implements $AddressInfoCopyWith<$Res> {
  _$AddressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? apartment = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
    Object? isPrimary = freezed,
    Object? residenceSince = freezed,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      residenceSince: freezed == residenceSince
          ? _value.residenceSince
          : residenceSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressInfoImplCopyWith<$Res>
    implements $AddressInfoCopyWith<$Res> {
  factory _$$AddressInfoImplCopyWith(
          _$AddressInfoImpl value, $Res Function(_$AddressInfoImpl) then) =
      __$$AddressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String? apartment,
      String city,
      String state,
      String postalCode,
      String country,
      bool? isPrimary,
      DateTime? residenceSince});
}

/// @nodoc
class __$$AddressInfoImplCopyWithImpl<$Res>
    extends _$AddressInfoCopyWithImpl<$Res, _$AddressInfoImpl>
    implements _$$AddressInfoImplCopyWith<$Res> {
  __$$AddressInfoImplCopyWithImpl(
      _$AddressInfoImpl _value, $Res Function(_$AddressInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? apartment = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = null,
    Object? isPrimary = freezed,
    Object? residenceSince = freezed,
  }) {
    return _then(_$AddressInfoImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      residenceSince: freezed == residenceSince
          ? _value.residenceSince
          : residenceSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressInfoImpl implements _AddressInfo {
  const _$AddressInfoImpl(
      {required this.street,
      this.apartment,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country,
      this.isPrimary,
      this.residenceSince});

  factory _$AddressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressInfoImplFromJson(json);

  @override
  final String street;
  @override
  final String? apartment;
  @override
  final String city;
  @override
  final String state;
  @override
  final String postalCode;
  @override
  final String country;
  @override
  final bool? isPrimary;
  @override
  final DateTime? residenceSince;

  @override
  String toString() {
    return 'AddressInfo(street: $street, apartment: $apartment, city: $city, state: $state, postalCode: $postalCode, country: $country, isPrimary: $isPrimary, residenceSince: $residenceSince)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressInfoImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.residenceSince, residenceSince) ||
                other.residenceSince == residenceSince));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, street, apartment, city, state,
      postalCode, country, isPrimary, residenceSince);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressInfoImplCopyWith<_$AddressInfoImpl> get copyWith =>
      __$$AddressInfoImplCopyWithImpl<_$AddressInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressInfoImplToJson(
      this,
    );
  }
}

abstract class _AddressInfo implements AddressInfo {
  const factory _AddressInfo(
      {required final String street,
      final String? apartment,
      required final String city,
      required final String state,
      required final String postalCode,
      required final String country,
      final bool? isPrimary,
      final DateTime? residenceSince}) = _$AddressInfoImpl;

  factory _AddressInfo.fromJson(Map<String, dynamic> json) =
      _$AddressInfoImpl.fromJson;

  @override
  String get street;
  @override
  String? get apartment;
  @override
  String get city;
  @override
  String get state;
  @override
  String get postalCode;
  @override
  String get country;
  @override
  bool? get isPrimary;
  @override
  DateTime? get residenceSince;
  @override
  @JsonKey(ignore: true)
  _$$AddressInfoImplCopyWith<_$AddressInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KYCDocument _$KYCDocumentFromJson(Map<String, dynamic> json) {
  return _KYCDocument.fromJson(json);
}

/// @nodoc
mixin _$KYCDocument {
  String get id => throw _privateConstructorUsedError;
  DocumentType get type => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  String? get fileUrl => throw _privateConstructorUsedError;
  DateTime get uploadedAt => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  String? get verificationNotes => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCDocumentCopyWith<KYCDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCDocumentCopyWith<$Res> {
  factory $KYCDocumentCopyWith(
          KYCDocument value, $Res Function(KYCDocument) then) =
      _$KYCDocumentCopyWithImpl<$Res, KYCDocument>;
  @useResult
  $Res call(
      {String id,
      DocumentType type,
      String fileName,
      String filePath,
      String? fileUrl,
      DateTime uploadedAt,
      bool? isVerified,
      String? verificationNotes,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$KYCDocumentCopyWithImpl<$Res, $Val extends KYCDocument>
    implements $KYCDocumentCopyWith<$Res> {
  _$KYCDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? fileUrl = freezed,
    Object? uploadedAt = null,
    Object? isVerified = freezed,
    Object? verificationNotes = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      verificationNotes: freezed == verificationNotes
          ? _value.verificationNotes
          : verificationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCDocumentImplCopyWith<$Res>
    implements $KYCDocumentCopyWith<$Res> {
  factory _$$KYCDocumentImplCopyWith(
          _$KYCDocumentImpl value, $Res Function(_$KYCDocumentImpl) then) =
      __$$KYCDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DocumentType type,
      String fileName,
      String filePath,
      String? fileUrl,
      DateTime uploadedAt,
      bool? isVerified,
      String? verificationNotes,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$KYCDocumentImplCopyWithImpl<$Res>
    extends _$KYCDocumentCopyWithImpl<$Res, _$KYCDocumentImpl>
    implements _$$KYCDocumentImplCopyWith<$Res> {
  __$$KYCDocumentImplCopyWithImpl(
      _$KYCDocumentImpl _value, $Res Function(_$KYCDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? fileName = null,
    Object? filePath = null,
    Object? fileUrl = freezed,
    Object? uploadedAt = null,
    Object? isVerified = freezed,
    Object? verificationNotes = freezed,
    Object? metadata = null,
  }) {
    return _then(_$KYCDocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      verificationNotes: freezed == verificationNotes
          ? _value.verificationNotes
          : verificationNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCDocumentImpl implements _KYCDocument {
  const _$KYCDocumentImpl(
      {required this.id,
      required this.type,
      required this.fileName,
      required this.filePath,
      this.fileUrl,
      required this.uploadedAt,
      this.isVerified,
      this.verificationNotes,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$KYCDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final DocumentType type;
  @override
  final String fileName;
  @override
  final String filePath;
  @override
  final String? fileUrl;
  @override
  final DateTime uploadedAt;
  @override
  final bool? isVerified;
  @override
  final String? verificationNotes;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'KYCDocument(id: $id, type: $type, fileName: $fileName, filePath: $filePath, fileUrl: $fileUrl, uploadedAt: $uploadedAt, isVerified: $isVerified, verificationNotes: $verificationNotes, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verificationNotes, verificationNotes) ||
                other.verificationNotes == verificationNotes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      fileName,
      filePath,
      fileUrl,
      uploadedAt,
      isVerified,
      verificationNotes,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCDocumentImplCopyWith<_$KYCDocumentImpl> get copyWith =>
      __$$KYCDocumentImplCopyWithImpl<_$KYCDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCDocumentImplToJson(
      this,
    );
  }
}

abstract class _KYCDocument implements KYCDocument {
  const factory _KYCDocument(
      {required final String id,
      required final DocumentType type,
      required final String fileName,
      required final String filePath,
      final String? fileUrl,
      required final DateTime uploadedAt,
      final bool? isVerified,
      final String? verificationNotes,
      final Map<String, dynamic> metadata}) = _$KYCDocumentImpl;

  factory _KYCDocument.fromJson(Map<String, dynamic> json) =
      _$KYCDocumentImpl.fromJson;

  @override
  String get id;
  @override
  DocumentType get type;
  @override
  String get fileName;
  @override
  String get filePath;
  @override
  String? get fileUrl;
  @override
  DateTime get uploadedAt;
  @override
  bool? get isVerified;
  @override
  String? get verificationNotes;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$KYCDocumentImplCopyWith<_$KYCDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BiometricData _$BiometricDataFromJson(Map<String, dynamic> json) {
  return _BiometricData.fromJson(json);
}

/// @nodoc
mixin _$BiometricData {
  String? get faceImagePath => throw _privateConstructorUsedError;
  String? get voiceSamplePath => throw _privateConstructorUsedError;
  DateTime? get capturedAt => throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;
  double? get confidenceScore => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BiometricDataCopyWith<BiometricData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricDataCopyWith<$Res> {
  factory $BiometricDataCopyWith(
          BiometricData value, $Res Function(BiometricData) then) =
      _$BiometricDataCopyWithImpl<$Res, BiometricData>;
  @useResult
  $Res call(
      {String? faceImagePath,
      String? voiceSamplePath,
      DateTime? capturedAt,
      bool? isLive,
      double? confidenceScore,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$BiometricDataCopyWithImpl<$Res, $Val extends BiometricData>
    implements $BiometricDataCopyWith<$Res> {
  _$BiometricDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceImagePath = freezed,
    Object? voiceSamplePath = freezed,
    Object? capturedAt = freezed,
    Object? isLive = freezed,
    Object? confidenceScore = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      faceImagePath: freezed == faceImagePath
          ? _value.faceImagePath
          : faceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceSamplePath: freezed == voiceSamplePath
          ? _value.voiceSamplePath
          : voiceSamplePath // ignore: cast_nullable_to_non_nullable
              as String?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      confidenceScore: freezed == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BiometricDataImplCopyWith<$Res>
    implements $BiometricDataCopyWith<$Res> {
  factory _$$BiometricDataImplCopyWith(
          _$BiometricDataImpl value, $Res Function(_$BiometricDataImpl) then) =
      __$$BiometricDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? faceImagePath,
      String? voiceSamplePath,
      DateTime? capturedAt,
      bool? isLive,
      double? confidenceScore,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$BiometricDataImplCopyWithImpl<$Res>
    extends _$BiometricDataCopyWithImpl<$Res, _$BiometricDataImpl>
    implements _$$BiometricDataImplCopyWith<$Res> {
  __$$BiometricDataImplCopyWithImpl(
      _$BiometricDataImpl _value, $Res Function(_$BiometricDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faceImagePath = freezed,
    Object? voiceSamplePath = freezed,
    Object? capturedAt = freezed,
    Object? isLive = freezed,
    Object? confidenceScore = freezed,
    Object? metadata = null,
  }) {
    return _then(_$BiometricDataImpl(
      faceImagePath: freezed == faceImagePath
          ? _value.faceImagePath
          : faceImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceSamplePath: freezed == voiceSamplePath
          ? _value.voiceSamplePath
          : voiceSamplePath // ignore: cast_nullable_to_non_nullable
              as String?,
      capturedAt: freezed == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
      confidenceScore: freezed == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BiometricDataImpl implements _BiometricData {
  const _$BiometricDataImpl(
      {this.faceImagePath,
      this.voiceSamplePath,
      this.capturedAt,
      this.isLive,
      this.confidenceScore,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$BiometricDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiometricDataImplFromJson(json);

  @override
  final String? faceImagePath;
  @override
  final String? voiceSamplePath;
  @override
  final DateTime? capturedAt;
  @override
  final bool? isLive;
  @override
  final double? confidenceScore;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'BiometricData(faceImagePath: $faceImagePath, voiceSamplePath: $voiceSamplePath, capturedAt: $capturedAt, isLive: $isLive, confidenceScore: $confidenceScore, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricDataImpl &&
            (identical(other.faceImagePath, faceImagePath) ||
                other.faceImagePath == faceImagePath) &&
            (identical(other.voiceSamplePath, voiceSamplePath) ||
                other.voiceSamplePath == voiceSamplePath) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      faceImagePath,
      voiceSamplePath,
      capturedAt,
      isLive,
      confidenceScore,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricDataImplCopyWith<_$BiometricDataImpl> get copyWith =>
      __$$BiometricDataImplCopyWithImpl<_$BiometricDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BiometricDataImplToJson(
      this,
    );
  }
}

abstract class _BiometricData implements BiometricData {
  const factory _BiometricData(
      {final String? faceImagePath,
      final String? voiceSamplePath,
      final DateTime? capturedAt,
      final bool? isLive,
      final double? confidenceScore,
      final Map<String, dynamic> metadata}) = _$BiometricDataImpl;

  factory _BiometricData.fromJson(Map<String, dynamic> json) =
      _$BiometricDataImpl.fromJson;

  @override
  String? get faceImagePath;
  @override
  String? get voiceSamplePath;
  @override
  DateTime? get capturedAt;
  @override
  bool? get isLive;
  @override
  double? get confidenceScore;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$BiometricDataImplCopyWith<_$BiometricDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KYCVerificationResult _$KYCVerificationResultFromJson(
    Map<String, dynamic> json) {
  return _KYCVerificationResult.fromJson(json);
}

/// @nodoc
mixin _$KYCVerificationResult {
  String get kycId => throw _privateConstructorUsedError;
  KYCStatus get status => throw _privateConstructorUsedError;
  KYCLevel get level => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  DateTime? get nextReviewDate => throw _privateConstructorUsedError;
  Map<String, dynamic> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCVerificationResultCopyWith<KYCVerificationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCVerificationResultCopyWith<$Res> {
  factory $KYCVerificationResultCopyWith(KYCVerificationResult value,
          $Res Function(KYCVerificationResult) then) =
      _$KYCVerificationResultCopyWithImpl<$Res, KYCVerificationResult>;
  @useResult
  $Res call(
      {String kycId,
      KYCStatus status,
      KYCLevel level,
      String? message,
      List<String>? errors,
      DateTime? nextReviewDate,
      Map<String, dynamic> details});
}

/// @nodoc
class _$KYCVerificationResultCopyWithImpl<$Res,
        $Val extends KYCVerificationResult>
    implements $KYCVerificationResultCopyWith<$Res> {
  _$KYCVerificationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycId = null,
    Object? status = null,
    Object? level = null,
    Object? message = freezed,
    Object? errors = freezed,
    Object? nextReviewDate = freezed,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      kycId: null == kycId
          ? _value.kycId
          : kycId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStatus,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCVerificationResultImplCopyWith<$Res>
    implements $KYCVerificationResultCopyWith<$Res> {
  factory _$$KYCVerificationResultImplCopyWith(
          _$KYCVerificationResultImpl value,
          $Res Function(_$KYCVerificationResultImpl) then) =
      __$$KYCVerificationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String kycId,
      KYCStatus status,
      KYCLevel level,
      String? message,
      List<String>? errors,
      DateTime? nextReviewDate,
      Map<String, dynamic> details});
}

/// @nodoc
class __$$KYCVerificationResultImplCopyWithImpl<$Res>
    extends _$KYCVerificationResultCopyWithImpl<$Res,
        _$KYCVerificationResultImpl>
    implements _$$KYCVerificationResultImplCopyWith<$Res> {
  __$$KYCVerificationResultImplCopyWithImpl(_$KYCVerificationResultImpl _value,
      $Res Function(_$KYCVerificationResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kycId = null,
    Object? status = null,
    Object? level = null,
    Object? message = freezed,
    Object? errors = freezed,
    Object? nextReviewDate = freezed,
    Object? details = null,
  }) {
    return _then(_$KYCVerificationResultImpl(
      kycId: null == kycId
          ? _value.kycId
          : kycId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStatus,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCVerificationResultImpl implements _KYCVerificationResult {
  const _$KYCVerificationResultImpl(
      {required this.kycId,
      required this.status,
      required this.level,
      this.message,
      final List<String>? errors,
      this.nextReviewDate,
      final Map<String, dynamic> details = const {}})
      : _errors = errors,
        _details = details;

  factory _$KYCVerificationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCVerificationResultImplFromJson(json);

  @override
  final String kycId;
  @override
  final KYCStatus status;
  @override
  final KYCLevel level;
  @override
  final String? message;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? nextReviewDate;
  final Map<String, dynamic> _details;
  @override
  @JsonKey()
  Map<String, dynamic> get details {
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_details);
  }

  @override
  String toString() {
    return 'KYCVerificationResult(kycId: $kycId, status: $status, level: $level, message: $message, errors: $errors, nextReviewDate: $nextReviewDate, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCVerificationResultImpl &&
            (identical(other.kycId, kycId) || other.kycId == kycId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      kycId,
      status,
      level,
      message,
      const DeepCollectionEquality().hash(_errors),
      nextReviewDate,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCVerificationResultImplCopyWith<_$KYCVerificationResultImpl>
      get copyWith => __$$KYCVerificationResultImplCopyWithImpl<
          _$KYCVerificationResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCVerificationResultImplToJson(
      this,
    );
  }
}

abstract class _KYCVerificationResult implements KYCVerificationResult {
  const factory _KYCVerificationResult(
      {required final String kycId,
      required final KYCStatus status,
      required final KYCLevel level,
      final String? message,
      final List<String>? errors,
      final DateTime? nextReviewDate,
      final Map<String, dynamic> details}) = _$KYCVerificationResultImpl;

  factory _KYCVerificationResult.fromJson(Map<String, dynamic> json) =
      _$KYCVerificationResultImpl.fromJson;

  @override
  String get kycId;
  @override
  KYCStatus get status;
  @override
  KYCLevel get level;
  @override
  String? get message;
  @override
  List<String>? get errors;
  @override
  DateTime? get nextReviewDate;
  @override
  Map<String, dynamic> get details;
  @override
  @JsonKey(ignore: true)
  _$$KYCVerificationResultImplCopyWith<_$KYCVerificationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

KYCRequirements _$KYCRequirementsFromJson(Map<String, dynamic> json) {
  return _KYCRequirements.fromJson(json);
}

/// @nodoc
mixin _$KYCRequirements {
  KYCLevel get level => throw _privateConstructorUsedError;
  List<DocumentType> get requiredDocuments =>
      throw _privateConstructorUsedError;
  List<KYCStep> get requiredSteps => throw _privateConstructorUsedError;
  bool? get requiresBiometric => throw _privateConstructorUsedError;
  bool? get requiresAddressVerification => throw _privateConstructorUsedError;
  bool? get requiresIncomeVerification => throw _privateConstructorUsedError;
  Map<String, String> get additionalRequirements =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCRequirementsCopyWith<KYCRequirements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCRequirementsCopyWith<$Res> {
  factory $KYCRequirementsCopyWith(
          KYCRequirements value, $Res Function(KYCRequirements) then) =
      _$KYCRequirementsCopyWithImpl<$Res, KYCRequirements>;
  @useResult
  $Res call(
      {KYCLevel level,
      List<DocumentType> requiredDocuments,
      List<KYCStep> requiredSteps,
      bool? requiresBiometric,
      bool? requiresAddressVerification,
      bool? requiresIncomeVerification,
      Map<String, String> additionalRequirements});
}

/// @nodoc
class _$KYCRequirementsCopyWithImpl<$Res, $Val extends KYCRequirements>
    implements $KYCRequirementsCopyWith<$Res> {
  _$KYCRequirementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? requiredDocuments = null,
    Object? requiredSteps = null,
    Object? requiresBiometric = freezed,
    Object? requiresAddressVerification = freezed,
    Object? requiresIncomeVerification = freezed,
    Object? additionalRequirements = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      requiredDocuments: null == requiredDocuments
          ? _value.requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentType>,
      requiredSteps: null == requiredSteps
          ? _value.requiredSteps
          : requiredSteps // ignore: cast_nullable_to_non_nullable
              as List<KYCStep>,
      requiresBiometric: freezed == requiresBiometric
          ? _value.requiresBiometric
          : requiresBiometric // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresAddressVerification: freezed == requiresAddressVerification
          ? _value.requiresAddressVerification
          : requiresAddressVerification // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresIncomeVerification: freezed == requiresIncomeVerification
          ? _value.requiresIncomeVerification
          : requiresIncomeVerification // ignore: cast_nullable_to_non_nullable
              as bool?,
      additionalRequirements: null == additionalRequirements
          ? _value.additionalRequirements
          : additionalRequirements // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCRequirementsImplCopyWith<$Res>
    implements $KYCRequirementsCopyWith<$Res> {
  factory _$$KYCRequirementsImplCopyWith(_$KYCRequirementsImpl value,
          $Res Function(_$KYCRequirementsImpl) then) =
      __$$KYCRequirementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {KYCLevel level,
      List<DocumentType> requiredDocuments,
      List<KYCStep> requiredSteps,
      bool? requiresBiometric,
      bool? requiresAddressVerification,
      bool? requiresIncomeVerification,
      Map<String, String> additionalRequirements});
}

/// @nodoc
class __$$KYCRequirementsImplCopyWithImpl<$Res>
    extends _$KYCRequirementsCopyWithImpl<$Res, _$KYCRequirementsImpl>
    implements _$$KYCRequirementsImplCopyWith<$Res> {
  __$$KYCRequirementsImplCopyWithImpl(
      _$KYCRequirementsImpl _value, $Res Function(_$KYCRequirementsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? requiredDocuments = null,
    Object? requiredSteps = null,
    Object? requiresBiometric = freezed,
    Object? requiresAddressVerification = freezed,
    Object? requiresIncomeVerification = freezed,
    Object? additionalRequirements = null,
  }) {
    return _then(_$KYCRequirementsImpl(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as KYCLevel,
      requiredDocuments: null == requiredDocuments
          ? _value._requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<DocumentType>,
      requiredSteps: null == requiredSteps
          ? _value._requiredSteps
          : requiredSteps // ignore: cast_nullable_to_non_nullable
              as List<KYCStep>,
      requiresBiometric: freezed == requiresBiometric
          ? _value.requiresBiometric
          : requiresBiometric // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresAddressVerification: freezed == requiresAddressVerification
          ? _value.requiresAddressVerification
          : requiresAddressVerification // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiresIncomeVerification: freezed == requiresIncomeVerification
          ? _value.requiresIncomeVerification
          : requiresIncomeVerification // ignore: cast_nullable_to_non_nullable
              as bool?,
      additionalRequirements: null == additionalRequirements
          ? _value._additionalRequirements
          : additionalRequirements // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCRequirementsImpl implements _KYCRequirements {
  const _$KYCRequirementsImpl(
      {required this.level,
      required final List<DocumentType> requiredDocuments,
      required final List<KYCStep> requiredSteps,
      this.requiresBiometric,
      this.requiresAddressVerification,
      this.requiresIncomeVerification,
      final Map<String, String> additionalRequirements = const {}})
      : _requiredDocuments = requiredDocuments,
        _requiredSteps = requiredSteps,
        _additionalRequirements = additionalRequirements;

  factory _$KYCRequirementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCRequirementsImplFromJson(json);

  @override
  final KYCLevel level;
  final List<DocumentType> _requiredDocuments;
  @override
  List<DocumentType> get requiredDocuments {
    if (_requiredDocuments is EqualUnmodifiableListView)
      return _requiredDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredDocuments);
  }

  final List<KYCStep> _requiredSteps;
  @override
  List<KYCStep> get requiredSteps {
    if (_requiredSteps is EqualUnmodifiableListView) return _requiredSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requiredSteps);
  }

  @override
  final bool? requiresBiometric;
  @override
  final bool? requiresAddressVerification;
  @override
  final bool? requiresIncomeVerification;
  final Map<String, String> _additionalRequirements;
  @override
  @JsonKey()
  Map<String, String> get additionalRequirements {
    if (_additionalRequirements is EqualUnmodifiableMapView)
      return _additionalRequirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalRequirements);
  }

  @override
  String toString() {
    return 'KYCRequirements(level: $level, requiredDocuments: $requiredDocuments, requiredSteps: $requiredSteps, requiresBiometric: $requiresBiometric, requiresAddressVerification: $requiresAddressVerification, requiresIncomeVerification: $requiresIncomeVerification, additionalRequirements: $additionalRequirements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCRequirementsImpl &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality()
                .equals(other._requiredDocuments, _requiredDocuments) &&
            const DeepCollectionEquality()
                .equals(other._requiredSteps, _requiredSteps) &&
            (identical(other.requiresBiometric, requiresBiometric) ||
                other.requiresBiometric == requiresBiometric) &&
            (identical(other.requiresAddressVerification,
                    requiresAddressVerification) ||
                other.requiresAddressVerification ==
                    requiresAddressVerification) &&
            (identical(other.requiresIncomeVerification,
                    requiresIncomeVerification) ||
                other.requiresIncomeVerification ==
                    requiresIncomeVerification) &&
            const DeepCollectionEquality().equals(
                other._additionalRequirements, _additionalRequirements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      level,
      const DeepCollectionEquality().hash(_requiredDocuments),
      const DeepCollectionEquality().hash(_requiredSteps),
      requiresBiometric,
      requiresAddressVerification,
      requiresIncomeVerification,
      const DeepCollectionEquality().hash(_additionalRequirements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCRequirementsImplCopyWith<_$KYCRequirementsImpl> get copyWith =>
      __$$KYCRequirementsImplCopyWithImpl<_$KYCRequirementsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCRequirementsImplToJson(
      this,
    );
  }
}

abstract class _KYCRequirements implements KYCRequirements {
  const factory _KYCRequirements(
          {required final KYCLevel level,
          required final List<DocumentType> requiredDocuments,
          required final List<KYCStep> requiredSteps,
          final bool? requiresBiometric,
          final bool? requiresAddressVerification,
          final bool? requiresIncomeVerification,
          final Map<String, String> additionalRequirements}) =
      _$KYCRequirementsImpl;

  factory _KYCRequirements.fromJson(Map<String, dynamic> json) =
      _$KYCRequirementsImpl.fromJson;

  @override
  KYCLevel get level;
  @override
  List<DocumentType> get requiredDocuments;
  @override
  List<KYCStep> get requiredSteps;
  @override
  bool? get requiresBiometric;
  @override
  bool? get requiresAddressVerification;
  @override
  bool? get requiresIncomeVerification;
  @override
  Map<String, String> get additionalRequirements;
  @override
  @JsonKey(ignore: true)
  _$$KYCRequirementsImplCopyWith<_$KYCRequirementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KYCVerificationStep _$KYCVerificationStepFromJson(Map<String, dynamic> json) {
  return _KYCVerificationStep.fromJson(json);
}

/// @nodoc
mixin _$KYCVerificationStep {
  String get id => throw _privateConstructorUsedError;
  String get stepId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  KYCStepType get type => throw _privateConstructorUsedError;
  KYCStepStatus get status => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCVerificationStepCopyWith<KYCVerificationStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCVerificationStepCopyWith<$Res> {
  factory $KYCVerificationStepCopyWith(
          KYCVerificationStep value, $Res Function(KYCVerificationStep) then) =
      _$KYCVerificationStepCopyWithImpl<$Res, KYCVerificationStep>;
  @useResult
  $Res call(
      {String id,
      String stepId,
      String name,
      KYCStepType type,
      KYCStepStatus status,
      String title,
      String description,
      DateTime? completedAt,
      String? errorMessage,
      Map<String, dynamic> data,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$KYCVerificationStepCopyWithImpl<$Res, $Val extends KYCVerificationStep>
    implements $KYCVerificationStepCopyWith<$Res> {
  _$KYCVerificationStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepId = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
    Object? data = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as KYCStepType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStepStatus,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCVerificationStepImplCopyWith<$Res>
    implements $KYCVerificationStepCopyWith<$Res> {
  factory _$$KYCVerificationStepImplCopyWith(_$KYCVerificationStepImpl value,
          $Res Function(_$KYCVerificationStepImpl) then) =
      __$$KYCVerificationStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String stepId,
      String name,
      KYCStepType type,
      KYCStepStatus status,
      String title,
      String description,
      DateTime? completedAt,
      String? errorMessage,
      Map<String, dynamic> data,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$KYCVerificationStepImplCopyWithImpl<$Res>
    extends _$KYCVerificationStepCopyWithImpl<$Res, _$KYCVerificationStepImpl>
    implements _$$KYCVerificationStepImplCopyWith<$Res> {
  __$$KYCVerificationStepImplCopyWithImpl(_$KYCVerificationStepImpl _value,
      $Res Function(_$KYCVerificationStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepId = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? title = null,
    Object? description = null,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
    Object? data = null,
    Object? metadata = null,
  }) {
    return _then(_$KYCVerificationStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as KYCStepType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as KYCStepStatus,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCVerificationStepImpl implements _KYCVerificationStep {
  const _$KYCVerificationStepImpl(
      {required this.id,
      required this.stepId,
      required this.name,
      required this.type,
      required this.status,
      required this.title,
      required this.description,
      this.completedAt,
      this.errorMessage,
      final Map<String, dynamic> data = const {},
      final Map<String, dynamic> metadata = const {}})
      : _data = data,
        _metadata = metadata;

  factory _$KYCVerificationStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCVerificationStepImplFromJson(json);

  @override
  final String id;
  @override
  final String stepId;
  @override
  final String name;
  @override
  final KYCStepType type;
  @override
  final KYCStepStatus status;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime? completedAt;
  @override
  final String? errorMessage;
  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'KYCVerificationStep(id: $id, stepId: $stepId, name: $name, type: $type, status: $status, title: $title, description: $description, completedAt: $completedAt, errorMessage: $errorMessage, data: $data, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCVerificationStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stepId,
      name,
      type,
      status,
      title,
      description,
      completedAt,
      errorMessage,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCVerificationStepImplCopyWith<_$KYCVerificationStepImpl> get copyWith =>
      __$$KYCVerificationStepImplCopyWithImpl<_$KYCVerificationStepImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCVerificationStepImplToJson(
      this,
    );
  }
}

abstract class _KYCVerificationStep implements KYCVerificationStep {
  const factory _KYCVerificationStep(
      {required final String id,
      required final String stepId,
      required final String name,
      required final KYCStepType type,
      required final KYCStepStatus status,
      required final String title,
      required final String description,
      final DateTime? completedAt,
      final String? errorMessage,
      final Map<String, dynamic> data,
      final Map<String, dynamic> metadata}) = _$KYCVerificationStepImpl;

  factory _KYCVerificationStep.fromJson(Map<String, dynamic> json) =
      _$KYCVerificationStepImpl.fromJson;

  @override
  String get id;
  @override
  String get stepId;
  @override
  String get name;
  @override
  KYCStepType get type;
  @override
  KYCStepStatus get status;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime? get completedAt;
  @override
  String? get errorMessage;
  @override
  Map<String, dynamic> get data;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$KYCVerificationStepImplCopyWith<_$KYCVerificationStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskAssessment _$RiskAssessmentFromJson(Map<String, dynamic> json) {
  return _RiskAssessment.fromJson(json);
}

/// @nodoc
mixin _$RiskAssessment {
  RiskLevel get riskLevel => throw _privateConstructorUsedError;
  double get riskScore => throw _privateConstructorUsedError;
  DateTime get assessedAt => throw _privateConstructorUsedError;
  String get assessedBy => throw _privateConstructorUsedError;
  List<RiskFactor> get riskFactors => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get nextReviewDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskAssessmentCopyWith<RiskAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskAssessmentCopyWith<$Res> {
  factory $RiskAssessmentCopyWith(
          RiskAssessment value, $Res Function(RiskAssessment) then) =
      _$RiskAssessmentCopyWithImpl<$Res, RiskAssessment>;
  @useResult
  $Res call(
      {RiskLevel riskLevel,
      double riskScore,
      DateTime assessedAt,
      String assessedBy,
      List<RiskFactor> riskFactors,
      String? notes,
      DateTime? nextReviewDate});
}

/// @nodoc
class _$RiskAssessmentCopyWithImpl<$Res, $Val extends RiskAssessment>
    implements $RiskAssessmentCopyWith<$Res> {
  _$RiskAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskLevel = null,
    Object? riskScore = null,
    Object? assessedAt = null,
    Object? assessedBy = null,
    Object? riskFactors = null,
    Object? notes = freezed,
    Object? nextReviewDate = freezed,
  }) {
    return _then(_value.copyWith(
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      riskScore: null == riskScore
          ? _value.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double,
      assessedAt: null == assessedAt
          ? _value.assessedAt
          : assessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assessedBy: null == assessedBy
          ? _value.assessedBy
          : assessedBy // ignore: cast_nullable_to_non_nullable
              as String,
      riskFactors: null == riskFactors
          ? _value.riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<RiskFactor>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiskAssessmentImplCopyWith<$Res>
    implements $RiskAssessmentCopyWith<$Res> {
  factory _$$RiskAssessmentImplCopyWith(_$RiskAssessmentImpl value,
          $Res Function(_$RiskAssessmentImpl) then) =
      __$$RiskAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RiskLevel riskLevel,
      double riskScore,
      DateTime assessedAt,
      String assessedBy,
      List<RiskFactor> riskFactors,
      String? notes,
      DateTime? nextReviewDate});
}

/// @nodoc
class __$$RiskAssessmentImplCopyWithImpl<$Res>
    extends _$RiskAssessmentCopyWithImpl<$Res, _$RiskAssessmentImpl>
    implements _$$RiskAssessmentImplCopyWith<$Res> {
  __$$RiskAssessmentImplCopyWithImpl(
      _$RiskAssessmentImpl _value, $Res Function(_$RiskAssessmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? riskLevel = null,
    Object? riskScore = null,
    Object? assessedAt = null,
    Object? assessedBy = null,
    Object? riskFactors = null,
    Object? notes = freezed,
    Object? nextReviewDate = freezed,
  }) {
    return _then(_$RiskAssessmentImpl(
      riskLevel: null == riskLevel
          ? _value.riskLevel
          : riskLevel // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      riskScore: null == riskScore
          ? _value.riskScore
          : riskScore // ignore: cast_nullable_to_non_nullable
              as double,
      assessedAt: null == assessedAt
          ? _value.assessedAt
          : assessedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assessedBy: null == assessedBy
          ? _value.assessedBy
          : assessedBy // ignore: cast_nullable_to_non_nullable
              as String,
      riskFactors: null == riskFactors
          ? _value._riskFactors
          : riskFactors // ignore: cast_nullable_to_non_nullable
              as List<RiskFactor>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskAssessmentImpl implements _RiskAssessment {
  const _$RiskAssessmentImpl(
      {required this.riskLevel,
      required this.riskScore,
      required this.assessedAt,
      required this.assessedBy,
      required final List<RiskFactor> riskFactors,
      this.notes,
      this.nextReviewDate})
      : _riskFactors = riskFactors;

  factory _$RiskAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskAssessmentImplFromJson(json);

  @override
  final RiskLevel riskLevel;
  @override
  final double riskScore;
  @override
  final DateTime assessedAt;
  @override
  final String assessedBy;
  final List<RiskFactor> _riskFactors;
  @override
  List<RiskFactor> get riskFactors {
    if (_riskFactors is EqualUnmodifiableListView) return _riskFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_riskFactors);
  }

  @override
  final String? notes;
  @override
  final DateTime? nextReviewDate;

  @override
  String toString() {
    return 'RiskAssessment(riskLevel: $riskLevel, riskScore: $riskScore, assessedAt: $assessedAt, assessedBy: $assessedBy, riskFactors: $riskFactors, notes: $notes, nextReviewDate: $nextReviewDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskAssessmentImpl &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            (identical(other.assessedAt, assessedAt) ||
                other.assessedAt == assessedAt) &&
            (identical(other.assessedBy, assessedBy) ||
                other.assessedBy == assessedBy) &&
            const DeepCollectionEquality()
                .equals(other._riskFactors, _riskFactors) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      riskLevel,
      riskScore,
      assessedAt,
      assessedBy,
      const DeepCollectionEquality().hash(_riskFactors),
      notes,
      nextReviewDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      __$$RiskAssessmentImplCopyWithImpl<_$RiskAssessmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskAssessmentImplToJson(
      this,
    );
  }
}

abstract class _RiskAssessment implements RiskAssessment {
  const factory _RiskAssessment(
      {required final RiskLevel riskLevel,
      required final double riskScore,
      required final DateTime assessedAt,
      required final String assessedBy,
      required final List<RiskFactor> riskFactors,
      final String? notes,
      final DateTime? nextReviewDate}) = _$RiskAssessmentImpl;

  factory _RiskAssessment.fromJson(Map<String, dynamic> json) =
      _$RiskAssessmentImpl.fromJson;

  @override
  RiskLevel get riskLevel;
  @override
  double get riskScore;
  @override
  DateTime get assessedAt;
  @override
  String get assessedBy;
  @override
  List<RiskFactor> get riskFactors;
  @override
  String? get notes;
  @override
  DateTime? get nextReviewDate;
  @override
  @JsonKey(ignore: true)
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskFactor _$RiskFactorFromJson(Map<String, dynamic> json) {
  return _RiskFactor.fromJson(json);
}

/// @nodoc
mixin _$RiskFactor {
  String get factor => throw _privateConstructorUsedError;
  RiskLevel get level => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RiskFactorCopyWith<RiskFactor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskFactorCopyWith<$Res> {
  factory $RiskFactorCopyWith(
          RiskFactor value, $Res Function(RiskFactor) then) =
      _$RiskFactorCopyWithImpl<$Res, RiskFactor>;
  @useResult
  $Res call(
      {String factor, RiskLevel level, double weight, String description});
}

/// @nodoc
class _$RiskFactorCopyWithImpl<$Res, $Val extends RiskFactor>
    implements $RiskFactorCopyWith<$Res> {
  _$RiskFactorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? level = null,
    Object? weight = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      factor: null == factor
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RiskFactorImplCopyWith<$Res>
    implements $RiskFactorCopyWith<$Res> {
  factory _$$RiskFactorImplCopyWith(
          _$RiskFactorImpl value, $Res Function(_$RiskFactorImpl) then) =
      __$$RiskFactorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String factor, RiskLevel level, double weight, String description});
}

/// @nodoc
class __$$RiskFactorImplCopyWithImpl<$Res>
    extends _$RiskFactorCopyWithImpl<$Res, _$RiskFactorImpl>
    implements _$$RiskFactorImplCopyWith<$Res> {
  __$$RiskFactorImplCopyWithImpl(
      _$RiskFactorImpl _value, $Res Function(_$RiskFactorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? factor = null,
    Object? level = null,
    Object? weight = null,
    Object? description = null,
  }) {
    return _then(_$RiskFactorImpl(
      factor: null == factor
          ? _value.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as RiskLevel,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskFactorImpl implements _RiskFactor {
  const _$RiskFactorImpl(
      {required this.factor,
      required this.level,
      required this.weight,
      required this.description});

  factory _$RiskFactorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskFactorImplFromJson(json);

  @override
  final String factor;
  @override
  final RiskLevel level;
  @override
  final double weight;
  @override
  final String description;

  @override
  String toString() {
    return 'RiskFactor(factor: $factor, level: $level, weight: $weight, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskFactorImpl &&
            (identical(other.factor, factor) || other.factor == factor) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, factor, level, weight, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      __$$RiskFactorImplCopyWithImpl<_$RiskFactorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskFactorImplToJson(
      this,
    );
  }
}

abstract class _RiskFactor implements RiskFactor {
  const factory _RiskFactor(
      {required final String factor,
      required final RiskLevel level,
      required final double weight,
      required final String description}) = _$RiskFactorImpl;

  factory _RiskFactor.fromJson(Map<String, dynamic> json) =
      _$RiskFactorImpl.fromJson;

  @override
  String get factor;
  @override
  RiskLevel get level;
  @override
  double get weight;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$RiskFactorImplCopyWith<_$RiskFactorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinancialInfo _$FinancialInfoFromJson(Map<String, dynamic> json) {
  return _FinancialInfo.fromJson(json);
}

/// @nodoc
mixin _$FinancialInfo {
  IncomeRange get annualIncome => throw _privateConstructorUsedError;
  WealthSource get sourceOfWealth => throw _privateConstructorUsedError;
  String? get employerName => throw _privateConstructorUsedError;
  String? get occupation => throw _privateConstructorUsedError;
  double? get netWorth => throw _privateConstructorUsedError;
  Map<String, dynamic> get additionalInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialInfoCopyWith<FinancialInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialInfoCopyWith<$Res> {
  factory $FinancialInfoCopyWith(
          FinancialInfo value, $Res Function(FinancialInfo) then) =
      _$FinancialInfoCopyWithImpl<$Res, FinancialInfo>;
  @useResult
  $Res call(
      {IncomeRange annualIncome,
      WealthSource sourceOfWealth,
      String? employerName,
      String? occupation,
      double? netWorth,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class _$FinancialInfoCopyWithImpl<$Res, $Val extends FinancialInfo>
    implements $FinancialInfoCopyWith<$Res> {
  _$FinancialInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualIncome = null,
    Object? sourceOfWealth = null,
    Object? employerName = freezed,
    Object? occupation = freezed,
    Object? netWorth = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_value.copyWith(
      annualIncome: null == annualIncome
          ? _value.annualIncome
          : annualIncome // ignore: cast_nullable_to_non_nullable
              as IncomeRange,
      sourceOfWealth: null == sourceOfWealth
          ? _value.sourceOfWealth
          : sourceOfWealth // ignore: cast_nullable_to_non_nullable
              as WealthSource,
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      netWorth: freezed == netWorth
          ? _value.netWorth
          : netWorth // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialInfoImplCopyWith<$Res>
    implements $FinancialInfoCopyWith<$Res> {
  factory _$$FinancialInfoImplCopyWith(
          _$FinancialInfoImpl value, $Res Function(_$FinancialInfoImpl) then) =
      __$$FinancialInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IncomeRange annualIncome,
      WealthSource sourceOfWealth,
      String? employerName,
      String? occupation,
      double? netWorth,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class __$$FinancialInfoImplCopyWithImpl<$Res>
    extends _$FinancialInfoCopyWithImpl<$Res, _$FinancialInfoImpl>
    implements _$$FinancialInfoImplCopyWith<$Res> {
  __$$FinancialInfoImplCopyWithImpl(
      _$FinancialInfoImpl _value, $Res Function(_$FinancialInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? annualIncome = null,
    Object? sourceOfWealth = null,
    Object? employerName = freezed,
    Object? occupation = freezed,
    Object? netWorth = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_$FinancialInfoImpl(
      annualIncome: null == annualIncome
          ? _value.annualIncome
          : annualIncome // ignore: cast_nullable_to_non_nullable
              as IncomeRange,
      sourceOfWealth: null == sourceOfWealth
          ? _value.sourceOfWealth
          : sourceOfWealth // ignore: cast_nullable_to_non_nullable
              as WealthSource,
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      netWorth: freezed == netWorth
          ? _value.netWorth
          : netWorth // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalInfo: null == additionalInfo
          ? _value._additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialInfoImpl implements _FinancialInfo {
  const _$FinancialInfoImpl(
      {required this.annualIncome,
      required this.sourceOfWealth,
      this.employerName,
      this.occupation,
      this.netWorth,
      final Map<String, dynamic> additionalInfo = const {}})
      : _additionalInfo = additionalInfo;

  factory _$FinancialInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialInfoImplFromJson(json);

  @override
  final IncomeRange annualIncome;
  @override
  final WealthSource sourceOfWealth;
  @override
  final String? employerName;
  @override
  final String? occupation;
  @override
  final double? netWorth;
  final Map<String, dynamic> _additionalInfo;
  @override
  @JsonKey()
  Map<String, dynamic> get additionalInfo {
    if (_additionalInfo is EqualUnmodifiableMapView) return _additionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalInfo);
  }

  @override
  String toString() {
    return 'FinancialInfo(annualIncome: $annualIncome, sourceOfWealth: $sourceOfWealth, employerName: $employerName, occupation: $occupation, netWorth: $netWorth, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialInfoImpl &&
            (identical(other.annualIncome, annualIncome) ||
                other.annualIncome == annualIncome) &&
            (identical(other.sourceOfWealth, sourceOfWealth) ||
                other.sourceOfWealth == sourceOfWealth) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.netWorth, netWorth) ||
                other.netWorth == netWorth) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfo, _additionalInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      annualIncome,
      sourceOfWealth,
      employerName,
      occupation,
      netWorth,
      const DeepCollectionEquality().hash(_additionalInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialInfoImplCopyWith<_$FinancialInfoImpl> get copyWith =>
      __$$FinancialInfoImplCopyWithImpl<_$FinancialInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialInfoImplToJson(
      this,
    );
  }
}

abstract class _FinancialInfo implements FinancialInfo {
  const factory _FinancialInfo(
      {required final IncomeRange annualIncome,
      required final WealthSource sourceOfWealth,
      final String? employerName,
      final String? occupation,
      final double? netWorth,
      final Map<String, dynamic> additionalInfo}) = _$FinancialInfoImpl;

  factory _FinancialInfo.fromJson(Map<String, dynamic> json) =
      _$FinancialInfoImpl.fromJson;

  @override
  IncomeRange get annualIncome;
  @override
  WealthSource get sourceOfWealth;
  @override
  String? get employerName;
  @override
  String? get occupation;
  @override
  double? get netWorth;
  @override
  Map<String, dynamic> get additionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$FinancialInfoImplCopyWith<_$FinancialInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BusinessInfo _$BusinessInfoFromJson(Map<String, dynamic> json) {
  return _BusinessInfo.fromJson(json);
}

/// @nodoc
mixin _$BusinessInfo {
  String get legalName => throw _privateConstructorUsedError;
  String get registrationNumber => throw _privateConstructorUsedError;
  String get taxId => throw _privateConstructorUsedError;
  BusinessType get businessType => throw _privateConstructorUsedError;
  DateTime? get incorporationDate => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic> get additionalInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessInfoCopyWith<BusinessInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessInfoCopyWith<$Res> {
  factory $BusinessInfoCopyWith(
          BusinessInfo value, $Res Function(BusinessInfo) then) =
      _$BusinessInfoCopyWithImpl<$Res, BusinessInfo>;
  @useResult
  $Res call(
      {String legalName,
      String registrationNumber,
      String taxId,
      BusinessType businessType,
      DateTime? incorporationDate,
      String? website,
      String? description,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class _$BusinessInfoCopyWithImpl<$Res, $Val extends BusinessInfo>
    implements $BusinessInfoCopyWith<$Res> {
  _$BusinessInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legalName = null,
    Object? registrationNumber = null,
    Object? taxId = null,
    Object? businessType = null,
    Object? incorporationDate = freezed,
    Object? website = freezed,
    Object? description = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_value.copyWith(
      legalName: null == legalName
          ? _value.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as BusinessType,
      incorporationDate: freezed == incorporationDate
          ? _value.incorporationDate
          : incorporationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessInfoImplCopyWith<$Res>
    implements $BusinessInfoCopyWith<$Res> {
  factory _$$BusinessInfoImplCopyWith(
          _$BusinessInfoImpl value, $Res Function(_$BusinessInfoImpl) then) =
      __$$BusinessInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String legalName,
      String registrationNumber,
      String taxId,
      BusinessType businessType,
      DateTime? incorporationDate,
      String? website,
      String? description,
      Map<String, dynamic> additionalInfo});
}

/// @nodoc
class __$$BusinessInfoImplCopyWithImpl<$Res>
    extends _$BusinessInfoCopyWithImpl<$Res, _$BusinessInfoImpl>
    implements _$$BusinessInfoImplCopyWith<$Res> {
  __$$BusinessInfoImplCopyWithImpl(
      _$BusinessInfoImpl _value, $Res Function(_$BusinessInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legalName = null,
    Object? registrationNumber = null,
    Object? taxId = null,
    Object? businessType = null,
    Object? incorporationDate = freezed,
    Object? website = freezed,
    Object? description = freezed,
    Object? additionalInfo = null,
  }) {
    return _then(_$BusinessInfoImpl(
      legalName: null == legalName
          ? _value.legalName
          : legalName // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String,
      businessType: null == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as BusinessType,
      incorporationDate: freezed == incorporationDate
          ? _value.incorporationDate
          : incorporationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalInfo: null == additionalInfo
          ? _value._additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessInfoImpl implements _BusinessInfo {
  const _$BusinessInfoImpl(
      {required this.legalName,
      required this.registrationNumber,
      required this.taxId,
      required this.businessType,
      this.incorporationDate,
      this.website,
      this.description,
      final Map<String, dynamic> additionalInfo = const {}})
      : _additionalInfo = additionalInfo;

  factory _$BusinessInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessInfoImplFromJson(json);

  @override
  final String legalName;
  @override
  final String registrationNumber;
  @override
  final String taxId;
  @override
  final BusinessType businessType;
  @override
  final DateTime? incorporationDate;
  @override
  final String? website;
  @override
  final String? description;
  final Map<String, dynamic> _additionalInfo;
  @override
  @JsonKey()
  Map<String, dynamic> get additionalInfo {
    if (_additionalInfo is EqualUnmodifiableMapView) return _additionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionalInfo);
  }

  @override
  String toString() {
    return 'BusinessInfo(legalName: $legalName, registrationNumber: $registrationNumber, taxId: $taxId, businessType: $businessType, incorporationDate: $incorporationDate, website: $website, description: $description, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessInfoImpl &&
            (identical(other.legalName, legalName) ||
                other.legalName == legalName) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType) &&
            (identical(other.incorporationDate, incorporationDate) ||
                other.incorporationDate == incorporationDate) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfo, _additionalInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      legalName,
      registrationNumber,
      taxId,
      businessType,
      incorporationDate,
      website,
      description,
      const DeepCollectionEquality().hash(_additionalInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessInfoImplCopyWith<_$BusinessInfoImpl> get copyWith =>
      __$$BusinessInfoImplCopyWithImpl<_$BusinessInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessInfoImplToJson(
      this,
    );
  }
}

abstract class _BusinessInfo implements BusinessInfo {
  const factory _BusinessInfo(
      {required final String legalName,
      required final String registrationNumber,
      required final String taxId,
      required final BusinessType businessType,
      final DateTime? incorporationDate,
      final String? website,
      final String? description,
      final Map<String, dynamic> additionalInfo}) = _$BusinessInfoImpl;

  factory _BusinessInfo.fromJson(Map<String, dynamic> json) =
      _$BusinessInfoImpl.fromJson;

  @override
  String get legalName;
  @override
  String get registrationNumber;
  @override
  String get taxId;
  @override
  BusinessType get businessType;
  @override
  DateTime? get incorporationDate;
  @override
  String? get website;
  @override
  String? get description;
  @override
  Map<String, dynamic> get additionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$BusinessInfoImplCopyWith<_$BusinessInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdentityDocument _$IdentityDocumentFromJson(Map<String, dynamic> json) {
  return _IdentityDocument.fromJson(json);
}

/// @nodoc
mixin _$IdentityDocument {
  String get id => throw _privateConstructorUsedError;
  IdentityDocumentType get type => throw _privateConstructorUsedError;
  String get documentNumber => throw _privateConstructorUsedError;
  String get issuingCountry => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  String? get frontImageUrl => throw _privateConstructorUsedError;
  String? get backImageUrl => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdentityDocumentCopyWith<IdentityDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdentityDocumentCopyWith<$Res> {
  factory $IdentityDocumentCopyWith(
          IdentityDocument value, $Res Function(IdentityDocument) then) =
      _$IdentityDocumentCopyWithImpl<$Res, IdentityDocument>;
  @useResult
  $Res call(
      {String id,
      IdentityDocumentType type,
      String documentNumber,
      String issuingCountry,
      DateTime expiryDate,
      String? frontImageUrl,
      String? backImageUrl,
      bool? isVerified,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$IdentityDocumentCopyWithImpl<$Res, $Val extends IdentityDocument>
    implements $IdentityDocumentCopyWith<$Res> {
  _$IdentityDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? documentNumber = null,
    Object? issuingCountry = null,
    Object? expiryDate = null,
    Object? frontImageUrl = freezed,
    Object? backImageUrl = freezed,
    Object? isVerified = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IdentityDocumentType,
      documentNumber: null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frontImageUrl: freezed == frontImageUrl
          ? _value.frontImageUrl
          : frontImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageUrl: freezed == backImageUrl
          ? _value.backImageUrl
          : backImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdentityDocumentImplCopyWith<$Res>
    implements $IdentityDocumentCopyWith<$Res> {
  factory _$$IdentityDocumentImplCopyWith(_$IdentityDocumentImpl value,
          $Res Function(_$IdentityDocumentImpl) then) =
      __$$IdentityDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      IdentityDocumentType type,
      String documentNumber,
      String issuingCountry,
      DateTime expiryDate,
      String? frontImageUrl,
      String? backImageUrl,
      bool? isVerified,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$IdentityDocumentImplCopyWithImpl<$Res>
    extends _$IdentityDocumentCopyWithImpl<$Res, _$IdentityDocumentImpl>
    implements _$$IdentityDocumentImplCopyWith<$Res> {
  __$$IdentityDocumentImplCopyWithImpl(_$IdentityDocumentImpl _value,
      $Res Function(_$IdentityDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? documentNumber = null,
    Object? issuingCountry = null,
    Object? expiryDate = null,
    Object? frontImageUrl = freezed,
    Object? backImageUrl = freezed,
    Object? isVerified = freezed,
    Object? metadata = null,
  }) {
    return _then(_$IdentityDocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IdentityDocumentType,
      documentNumber: null == documentNumber
          ? _value.documentNumber
          : documentNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issuingCountry: null == issuingCountry
          ? _value.issuingCountry
          : issuingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frontImageUrl: freezed == frontImageUrl
          ? _value.frontImageUrl
          : frontImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      backImageUrl: freezed == backImageUrl
          ? _value.backImageUrl
          : backImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdentityDocumentImpl implements _IdentityDocument {
  const _$IdentityDocumentImpl(
      {required this.id,
      required this.type,
      required this.documentNumber,
      required this.issuingCountry,
      required this.expiryDate,
      this.frontImageUrl,
      this.backImageUrl,
      this.isVerified,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$IdentityDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdentityDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final IdentityDocumentType type;
  @override
  final String documentNumber;
  @override
  final String issuingCountry;
  @override
  final DateTime expiryDate;
  @override
  final String? frontImageUrl;
  @override
  final String? backImageUrl;
  @override
  final bool? isVerified;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'IdentityDocument(id: $id, type: $type, documentNumber: $documentNumber, issuingCountry: $issuingCountry, expiryDate: $expiryDate, frontImageUrl: $frontImageUrl, backImageUrl: $backImageUrl, isVerified: $isVerified, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdentityDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.documentNumber, documentNumber) ||
                other.documentNumber == documentNumber) &&
            (identical(other.issuingCountry, issuingCountry) ||
                other.issuingCountry == issuingCountry) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.frontImageUrl, frontImageUrl) ||
                other.frontImageUrl == frontImageUrl) &&
            (identical(other.backImageUrl, backImageUrl) ||
                other.backImageUrl == backImageUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      documentNumber,
      issuingCountry,
      expiryDate,
      frontImageUrl,
      backImageUrl,
      isVerified,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdentityDocumentImplCopyWith<_$IdentityDocumentImpl> get copyWith =>
      __$$IdentityDocumentImplCopyWithImpl<_$IdentityDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdentityDocumentImplToJson(
      this,
    );
  }
}

abstract class _IdentityDocument implements IdentityDocument {
  const factory _IdentityDocument(
      {required final String id,
      required final IdentityDocumentType type,
      required final String documentNumber,
      required final String issuingCountry,
      required final DateTime expiryDate,
      final String? frontImageUrl,
      final String? backImageUrl,
      final bool? isVerified,
      final Map<String, dynamic> metadata}) = _$IdentityDocumentImpl;

  factory _IdentityDocument.fromJson(Map<String, dynamic> json) =
      _$IdentityDocumentImpl.fromJson;

  @override
  String get id;
  @override
  IdentityDocumentType get type;
  @override
  String get documentNumber;
  @override
  String get issuingCountry;
  @override
  DateTime get expiryDate;
  @override
  String? get frontImageUrl;
  @override
  String? get backImageUrl;
  @override
  bool? get isVerified;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$IdentityDocumentImplCopyWith<_$IdentityDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProofOfAddress _$ProofOfAddressFromJson(Map<String, dynamic> json) {
  return _ProofOfAddress.fromJson(json);
}

/// @nodoc
mixin _$ProofOfAddress {
  String get id => throw _privateConstructorUsedError;
  ProofOfAddressType get type => throw _privateConstructorUsedError;
  String get documentName => throw _privateConstructorUsedError;
  DateTime get documentDate => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProofOfAddressCopyWith<ProofOfAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProofOfAddressCopyWith<$Res> {
  factory $ProofOfAddressCopyWith(
          ProofOfAddress value, $Res Function(ProofOfAddress) then) =
      _$ProofOfAddressCopyWithImpl<$Res, ProofOfAddress>;
  @useResult
  $Res call(
      {String id,
      ProofOfAddressType type,
      String documentName,
      DateTime documentDate,
      String? imageUrl,
      bool? isVerified,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$ProofOfAddressCopyWithImpl<$Res, $Val extends ProofOfAddress>
    implements $ProofOfAddressCopyWith<$Res> {
  _$ProofOfAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? documentName = null,
    Object? documentDate = null,
    Object? imageUrl = freezed,
    Object? isVerified = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProofOfAddressType,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProofOfAddressImplCopyWith<$Res>
    implements $ProofOfAddressCopyWith<$Res> {
  factory _$$ProofOfAddressImplCopyWith(_$ProofOfAddressImpl value,
          $Res Function(_$ProofOfAddressImpl) then) =
      __$$ProofOfAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ProofOfAddressType type,
      String documentName,
      DateTime documentDate,
      String? imageUrl,
      bool? isVerified,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$ProofOfAddressImplCopyWithImpl<$Res>
    extends _$ProofOfAddressCopyWithImpl<$Res, _$ProofOfAddressImpl>
    implements _$$ProofOfAddressImplCopyWith<$Res> {
  __$$ProofOfAddressImplCopyWithImpl(
      _$ProofOfAddressImpl _value, $Res Function(_$ProofOfAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? documentName = null,
    Object? documentDate = null,
    Object? imageUrl = freezed,
    Object? isVerified = freezed,
    Object? metadata = null,
  }) {
    return _then(_$ProofOfAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProofOfAddressType,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      documentDate: null == documentDate
          ? _value.documentDate
          : documentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProofOfAddressImpl implements _ProofOfAddress {
  const _$ProofOfAddressImpl(
      {required this.id,
      required this.type,
      required this.documentName,
      required this.documentDate,
      this.imageUrl,
      this.isVerified,
      final Map<String, dynamic> metadata = const {}})
      : _metadata = metadata;

  factory _$ProofOfAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProofOfAddressImplFromJson(json);

  @override
  final String id;
  @override
  final ProofOfAddressType type;
  @override
  final String documentName;
  @override
  final DateTime documentDate;
  @override
  final String? imageUrl;
  @override
  final bool? isVerified;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'ProofOfAddress(id: $id, type: $type, documentName: $documentName, documentDate: $documentDate, imageUrl: $imageUrl, isVerified: $isVerified, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProofOfAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentDate, documentDate) ||
                other.documentDate == documentDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      documentName,
      documentDate,
      imageUrl,
      isVerified,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProofOfAddressImplCopyWith<_$ProofOfAddressImpl> get copyWith =>
      __$$ProofOfAddressImplCopyWithImpl<_$ProofOfAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProofOfAddressImplToJson(
      this,
    );
  }
}

abstract class _ProofOfAddress implements ProofOfAddress {
  const factory _ProofOfAddress(
      {required final String id,
      required final ProofOfAddressType type,
      required final String documentName,
      required final DateTime documentDate,
      final String? imageUrl,
      final bool? isVerified,
      final Map<String, dynamic> metadata}) = _$ProofOfAddressImpl;

  factory _ProofOfAddress.fromJson(Map<String, dynamic> json) =
      _$ProofOfAddressImpl.fromJson;

  @override
  String get id;
  @override
  ProofOfAddressType get type;
  @override
  String get documentName;
  @override
  DateTime get documentDate;
  @override
  String? get imageUrl;
  @override
  bool? get isVerified;
  @override
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ProofOfAddressImplCopyWith<_$ProofOfAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
