class AppException implements Exception {
  final AppExceptionType type;
  final String? message;

  const AppException({required this.type, this.message});

  const AppException.databaseError({String? message}) : this(type: AppExceptionType.database, message: message);
  const AppException.networkError({String? message}) : this(type: AppExceptionType.network, message: message);
  const AppException.apiError({String? message}) : this(type: AppExceptionType.api, message: message);

  @override
  String toString() => message ?? 'AppException of type $type';
}

enum AppExceptionType {database, network, api}