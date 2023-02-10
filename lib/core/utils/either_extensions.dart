import 'package:either_dart/either.dart';

Either<L, R> success<L, R>(R value) => Right(value);
Either<L, R> failure<L, R>(L value) => Left(value);

extension EitherExtensions<L, R> on Either<L, R> {
  L getFailure() => left;
  R getSuccess() => right;
}
