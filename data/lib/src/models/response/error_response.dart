
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@Freezed()
class ErrorResponse with _$ErrorResponse {
  const ErrorResponse._();

  const factory ErrorResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'status_code') @Default(-1) int statusCode,
    @JsonKey(name: 'status_message') @Default('') String statusMessage
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}
