import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_code_info.freezed.dart';
part 'action_code_info.g.dart';

/// Action code information for email operations
@freezed
class ActionCodeInfo with _$ActionCodeInfo {
  const factory ActionCodeInfo({
    required String operation,
    required String email,
    String? previousEmail,
    @Default({}) Map<String, dynamic> data,
  }) = _ActionCodeInfo;
  
  factory ActionCodeInfo.fromJson(Map<String, dynamic> json) => _$ActionCodeInfoFromJson(json);
}