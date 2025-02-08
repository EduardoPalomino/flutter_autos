part of 'actividad_bloc.dart';
class ActividadState extends Equatable {
  const ActividadState();

  @override
  List<Object> get props => [];
}

class ActividadIsNotSearched extends ActividadState {}

class ActividadIsLoading extends ActividadState {}

class ActividadIsLoaded extends ActividadState {
  final dynamic _Actividad;
  final dynamic nombre;
  //final dynamic descripcion;
  // const ActividadIsLoaded(this._Actividad, this.nombre, this.descripcion);
  const ActividadIsLoaded(this._Actividad, this.nombre);
  ActividadModel get getActividad => _Actividad;

  @override
  //List<Object> get props => [_Actividad,nombre,descripcion];
  List<Object> get props => [_Actividad,nombre];
}

class ActividadIsNotLoaded extends ActividadState {}