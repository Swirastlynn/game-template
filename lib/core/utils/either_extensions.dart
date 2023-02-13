import 'package:either_dart/either.dart';

/// Assumption:
/// Left - Failure
/// Right - Success

Either<L, R> success<L, R>(R value) => Right(value);
Either<L, R> failure<L, R>(L value) => Left(value);

extension EitherExtensions<L, R> on Either<L, R> {
  L getFailure() => left;
  R getSuccess() => right;
}

Future<Either<L, R>> successFuture<L, R>(R result) =>
    Future.value(success(result));
Future<Either<L, R>> failureFuture<L, R>(L fail) => Future.value(failure(fail));
