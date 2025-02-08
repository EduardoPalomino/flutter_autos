part of 'rol_bloc.dart';

abstract class RolState extends Equatable { // <-- Extiende Equatable
  const RolState();

  @override
  List<Object> get props => [];
}
class RolInitialState extends RolState {}

class RolLoadingState extends RolState {}

class RolSuccessState extends RolState {
  final List<Rol> roles;
  const RolSuccessState(this.roles);
  @override
  List<Object> get props => [roles];
}

class RolErrorState extends RolState {
  final String message;
  RolErrorState(this.message);

  @override
  List<Object> get props => [message];
}