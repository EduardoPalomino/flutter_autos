import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/actividad.dart';
import '../../data/repositories/actividad_repository.dart';
part 'actividad_event.dart';
part 'actividad_state.dart';

class ActividadBloc extends Bloc<ActividadEvent, ActividadState> {
  final ActividadRepo actividadRepo;
  ActividadBloc({required this.actividadRepo}) : super(ActividadIsNotSearched()) {
    on<ActividadEvent>((event, emit) async {
      //print("Evento recibido en Bloc: $event");  // 👈 Verificar si se ejecuta el evento
      if (event is FechActividad) {
        emit(ActividadIsLoading());
        try {
          final actividad = await actividadRepo.getActividad(event.nombre);
          //print('EVENTO2');

          final nombre = event.nombre;
          //final descripcion = event.descripcion;
          // emit(ActividadIsLoaded(actividad, nombre,descripcion));

          //print('resultado: ${actividad}');
         // print('nombre: ${nombre}');
          emit(ActividadIsLoaded(actividad, nombre));
        } catch (_) {
          emit(ActividadIsNotLoaded());
        }
      } else if (event is ResetActividad) {
        emit(ActividadIsNotSearched());
      }
    });
  }
}
