class AppException implements Exception {
  final AppExceptionType type;
  final String? msg;

  const AppException({required this.type, this.msg});

  const AppException.databaseError({String? msg}) : this(type: AppExceptionType.database, msg: msg);
  const AppException.networkError({String? msg}) : this(type: AppExceptionType.network, msg: msg);
  const AppException.apiError({String? msg}) : this(type: AppExceptionType.api, msg: msg);

  @override
  String toString() => msg ?? 'AppException of type $type';
}

enum AppExceptionType {database, network, api}