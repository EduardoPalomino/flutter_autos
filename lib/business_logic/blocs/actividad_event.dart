part of 'actividad_bloc.dart';

class ActividadEvent extends Equatable{
  const ActividadEvent();
  @override
  //defines el propiedades en getter
  List<Object?> get props => [];
}
class FechActividad extends ActividadEvent{
  final String nombre;
  FechActividad({required this.nombre});
  //Map<a,b> es tipa un objeto
  //Map<String, String> get getActividad => {'nombre': nombre, 'descripcion': descripcion};
  Map<String, String> get getActividad => {'nombre': nombre};
  @override
  //asignas sobreescribiendo el getter
  //List<Object?> get props => [nombre,descripcion]; //hace referencia un array
  List<Object?> get props => [nombre];
}
class ResetActividad extends ActividadEvent {}