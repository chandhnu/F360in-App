class ServiceException implements Exception {
  final String code;
  final String message;
  final Map<String, dynamic> details;

  ServiceException({required this.code, required this.message, this.details = const {}});

  @override
  String toString() => 'ServiceException[$code]: $message';
}

class RepositoryException implements Exception {
  final String message;
  final dynamic originalError;

  RepositoryException(this.message, [this.originalError]);

  @override
  String toString() => 'RepositoryException: $message';
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => 'ValidationException: $message';
}
