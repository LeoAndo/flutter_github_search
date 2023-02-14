// Project imports:
import 'package:flutter_github_search/domain/exception/application_exception.dart';

enum ValidationExceptionType {
  input, // 検索ワード系
}

/// 検査の例外用クラス.
abstract class ValidationException implements ApplicationException {
  const ValidationException(this.message, this.type);
  @override
  final String message;
  final ValidationExceptionType type;
}

class InputValidationException implements ValidationException {
  @override
  final String message;

  @override
  final ValidationExceptionType type = ValidationExceptionType.input;

  const InputValidationException(this.message);
}
