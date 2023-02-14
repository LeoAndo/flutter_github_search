abstract class ApplicationException implements Exception {
  const ApplicationException(this.message);
  final String message;
  @override
  String toString() => message;
}
