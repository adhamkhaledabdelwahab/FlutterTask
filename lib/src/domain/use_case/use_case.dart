import 'package:equatable/equatable.dart';

abstract class UseCase<R, P> {
  R call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
