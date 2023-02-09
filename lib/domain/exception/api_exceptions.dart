enum ApiExceptionType {
  unAuthorized,
  forbidden,
  network,
  unprocessableEntity,
  unknown,
  notFound,
  redirect,
  server,
}

/// 通信処理時の例外用クラス.
abstract class ApiException implements Exception {
  const ApiException(this.message, this.type);
  final String message;
  final ApiExceptionType type;
  @override
  String toString() => message;
}

class UnAuthorizedException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.unAuthorized;
  const UnAuthorizedException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class ForbiddenExeption implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.forbidden;
  const ForbiddenExeption(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class NetworkException implements ApiException {
  @override
  final String message;
  @override
  final ApiExceptionType type = ApiExceptionType.network;
  const NetworkException(this.message);
}

class UnprocessableEntityException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.unprocessableEntity;
  const UnprocessableEntityException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class UnknownException implements ApiException {
  @override
  final String message;
  @override
  final ApiExceptionType type = ApiExceptionType.unknown;
  const UnknownException(this.message);
}

class NotFoundException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.notFound;
  const NotFoundException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class RedirectException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.redirect;
  const RedirectException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class ServerException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  @override
  final ApiExceptionType type = ApiExceptionType.server;
  const ServerException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}
