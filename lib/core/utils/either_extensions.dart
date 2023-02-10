import 'package:either_dart/either.dart';

typedef Success<L, R> = Right<L, R>;
typedef Failure<L, R> = Left<L, R>;

Either<L, R> success<L, R>(R value) => Right(value);
Either<L, R> failure<L, R>(L value) => Left(value);

extension EitherExtensions<L, R> on Either<L, R> {
  L getFailure() => left;
  R getSuccess() => right;
}
