/// 通信処理時の例外用クラス.
abstract class ApiException implements Exception {
  const ApiException(this.message);
  final String message;
  @override
  String toString() => message;
}

class UnAuthorizedException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
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
  const ForbiddenExeption(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class NetworkException implements ApiException {
  @override
  final String message;
  const NetworkException(this.message);
}

class UnprocessableEntityException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
  const UnprocessableEntityException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}

class UnknownException implements ApiException {
  @override
  final String message;
  const UnknownException(this.message);
}

class NotFoundException implements ApiException {
  @override
  final String message;
  final String documentationUrl;
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
  const ServerException(this.message, this.documentationUrl);
  @override
  String toString() {
    return '$message : $documentationUrl';
  }
}
