import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  const Result(this.status, this.result, this.error);

  const Result.init()
      : status = ResultStatus.notStarted,
        result = null,
        error = null;

  const Result.pending()
      : status = ResultStatus.pending,
        result = null,
        error = null;

  final ResultStatus status;
  final T? result;
  final dynamic error;

  @override
  List<Object?> get props => [
        result,
        status,
        error,
      ];

  bool isPending() => status == ResultStatus.pending;
}

enum ResultStatus {
  notStarted,
  pending,
  success,
  failure,
}
