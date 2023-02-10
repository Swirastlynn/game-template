import 'package:game_template/core/presentation/presentation_model_result.dart';

extension ObservedFuture<T> on Future<T> {
  Future<T> observeStatusChanges(void Function(Result<T> result) emitChange) {
    emitChange(
      const Result.pending(),
    );
    return then((result) {
      emitChange(
        Result(ResultStatus.success, result, null),
      );
      return result;
    }).catchError((error) {
      emitChange(
        Result(ResultStatus.failure, null, error),
      );
      throw error;
    });
  }
}
