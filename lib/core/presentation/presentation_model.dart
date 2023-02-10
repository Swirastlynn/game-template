import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  const Result(this.state, this.result, this.error);

  const Result.empty()
      : result = null,
        error = null,
        state = ResultState.notStarted;

  const Result.pending()
      : result = null,
        error = null,
        state = ResultState.pending;

  final ResultState state;
  final T? result;
  // fixme dynamic?
  final dynamic error;

  @override
  List<Object?> get props => [
        result,
        state,
        error,
      ];

  bool isPending() => state == ResultState.pending;
}

enum ResultState {
  notStarted,
  pending,
  success,
  failure,
}
