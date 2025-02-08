part of 'rol_bloc.dart';

abstract class RolEvent {}

class LoadRolEvent extends RolEvent {}

class AddRolEvent extends RolEvent {
  final String nombre;
  AddRolEvent(this.nombre);
}

class UpdateRolEvent extends RolEvent {
  final int id;
  final String nombre;
  UpdateRolEvent(this.id, this.nombre);
}

class DeleteRolEvent extends RolEvent {
  final int id;
  DeleteRolEvent(this.id);
}