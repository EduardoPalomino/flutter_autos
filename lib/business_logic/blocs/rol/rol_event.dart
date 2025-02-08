part of 'rol_bloc.dart';

//abstract class RolEvent {}
abstract class RolEvent extends Equatable {
  const RolEvent();

  @override
  List<Object> get props => [];
}
class LoadRolEvent extends RolEvent {}

class AddRolEvent extends RolEvent {
  final String nombre;
  AddRolEvent(this.nombre);
  @override
  List<Object> get props => [nombre];
}

class UpdateRolEvent extends RolEvent {
  final String id;
  final String nombre;
  UpdateRolEvent(this.id, this.nombre);
}

class DeleteRolEvent extends RolEvent {
  final String id;
  DeleteRolEvent(this.id);
}