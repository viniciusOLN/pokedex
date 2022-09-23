class ServerException implements Exception {
  final String? message;

  @override
  bool operator ==(Object other) => other is ServerException;

  ServerException({this.message});
}

class NotFoundException implements Exception {
  final String? message;

  @override
  bool operator ==(Object other) => other is NotFoundException;

  NotFoundException({this.message});
}

class TimeOutException implements Exception {
  final String? message;

  @override
  bool operator ==(Object other) => other is TimeOutException;

  TimeOutException({this.message});
}

class OtherError implements Exception {
  final String? message;

  @override
  bool operator ==(Object other) => other is OtherError;

  OtherError({this.message});
}

class Errors {
  static handleError({int? statusCode}) {
    print(statusCode);
    switch (statusCode) {
      case 404:
        return NotFoundException();
      case 408:
        return TimeOutException();
      case 500:
        return ServerException();
      default:
        return OtherError(message: '${statusCode}');
    }
  }
}
