part 'id.dart';
part 'void_success.dart';

abstract class EitherOf<Failure, Success> {
  const EitherOf();

  T get<T>(
    T Function(Failure reject) ifReject,
    T Function(Success resolve) ifResolve,
  );

  Success getOrElse(Success Function() orElse) => get((_) => orElse(), id);
}

class Reject<Failure, Success> extends EitherOf<Failure, Success> {
  final Failure _failure;
  const Reject(this._failure);

  @override
  T get<T>(
    T Function(Failure reject) ifReject,
    T Function(Success resolve) ifResolve,
  ) =>
      ifReject(_failure);
}

class Resolve<Failure, Success> extends EitherOf<Failure, Success> {
  final Success _success;
  const Resolve(this._success);

  @override
  T get<T>(
    T Function(Failure reject) ifReject,
    T Function(Success resolve) ifResolve,
  ) =>
      ifResolve(_success);
}

EitherOf<Failure, Success> reject<Failure, Success>(Failure reject) =>
    Reject<Failure, Success>(reject);
EitherOf<Failure, Success> resolve<Failure, Success>(Success resolve) =>
    Resolve<Failure, Success>(resolve);
