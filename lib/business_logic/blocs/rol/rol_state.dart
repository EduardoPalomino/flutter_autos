part of 'rol_bloc.dart';

abstract class RolState {}

class RolInitialState extends RolState {}

class RolLoadingState extends RolState {}

class RolLoadedState extends RolState {
  final List<Rol> items;
  RolLoadedState(this.items);
}

class RolErrorState extends RolState {
  final String message;
  RolErrorState(this.message);
}