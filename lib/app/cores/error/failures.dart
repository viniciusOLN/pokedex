import 'package:pokedex/app/cores/error/exceptions.dart';

abstract class Failure {
  String? message = '';

  @override
  bool operator ==(Object other) => other is Failure;

  Failure({this.message});
}

class NotFoundFailure extends Failure {
  NotFoundFailure({
    final String? message,
  }) : super(message: message);
}

class TimeOutFailure extends Failure {
  TimeOutFailure({
    final String? message,
  }) : super(message: message);
}

class ServerFailure extends Failure {
  ServerFailure({
    final String? message,
  }) : super(message: message);
}

class OtherFailure extends Failure {
  OtherFailure({
    final String? message,
  }) : super(message: message);
}

class Failures {
  String notFoundMessage;
  String timeOutMessage;
  String serverMessage;
  String otherMessage;

  Failures({
    this.notFoundMessage = 'Pokemon não encontrado.',
    this.timeOutMessage = 'Tempo limite de resposta do servidor esgotado.',
    this.serverMessage = 'Erro ao tentar acessar o servidor.',
    this.otherMessage = 'Erro ao tentar encontrar o pokemon, tente novamente.',
  });

  Failure handleFailures(Object e) {
    if (e is NotFoundException) {
      return NotFoundFailure(message: notFoundMessage);
    }

    if (e is TimeOutException) {
      return TimeOutFailure(message: timeOutMessage);
    }

    if (e is ServerException) {
      return ServerFailure(message: serverMessage);
    }

    if (e is OtherError) {
      return OtherFailure(message: otherMessage);
    }

    return OtherFailure(message: otherMessage);
  }
}
