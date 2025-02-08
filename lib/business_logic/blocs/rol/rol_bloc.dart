import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/rol.dart';
import '../../../data/repositories/rol_repository.dart';

part 'rol_event.dart';
part 'rol_state.dart';

class RolBloc extends Bloc<RolEvent, RolState> {
  final RolRepository rolRepository;

  //RolBloc({required this.rolRepository}) : super(RolInitialState());
  RolBloc({required this.rolRepository}) : super(RolInitialState()) {
    // Registra los manejadores de eventos
    on<LoadRolEvent>(_onLoadRol);
    on<AddRolEvent>(_onAddRol); // <-- Agrega esta línea
    on<UpdateRolEvent>(_onUpdateRol);
    on<DeleteRolEvent>(_onDeleteRol);
  }

  // Manejador para LoadRolEvent
  Future<void> _onLoadRol(LoadRolEvent event, Emitter<RolState> emit) async {
    emit(RolLoadingState());
    try {
      final items = await rolRepository.getRols();
      emit(RolSuccessState(items));
    } catch (e) {
      emit(RolErrorState(e.toString()));
      print("getRols : ${e.toString()}");
    }
  }

  // Manejador para AddRolEvent
  Future<void> _onAddRol(AddRolEvent event, Emitter<RolState> emit) async {
    try {
      await rolRepository.addRol(event.nombre);
      await _reloadRols(emit); // Actualiza la lista después de agregar
    } catch (e) {
      emit(RolErrorState(e.toString()));
      print("addRol : ${e.toString()}");
    }
  }

  // Manejador para UpdateRolEvent
  Future<void> _onUpdateRol(UpdateRolEvent event, Emitter<RolState> emit) async {
    try {
      print("UPDATE ROL");
      await rolRepository.updateRol(event.id, event.nombre);
      await _reloadRols(emit); // Actualiza la lista después de actualizar
    } catch (e) {
      emit(RolErrorState(e.toString()));
    }
  }
/*
  // Manejador para DeleteRolEvent
  Future<void> _onDeleteRol(DeleteRolEvent event, Emitter<RolState> emit) async {
    try {
      await rolRepository.deleteRol(event.id);
      await _reloadRols(emit); // Actualiza la lista después de eliminar
    } catch (e) {
      emit(RolErrorState(e.toString()));
    }
  }
*/
 /*
  Future<void> _onDeleteRol(DeleteRolEvent event, Emitter<RolState> emit) async {
    try {
      // Elimina el rol del backend
      await rolRepository.deleteRol(event.id);

      // Si el estado actual es RolSuccessState, actualiza la lista localmente
      if (state is RolSuccessState) {
        final currentRoles = (state as RolSuccessState).roles;
        final updatedRoles = currentRoles.where((rol) => rol.id != event.id).toList();

        // Emite el nuevo estado con la lista actualizada
        emit(RolSuccessState(updatedRoles));
        print("Response _onDeleteRol updatedRoles : ${updatedRoles}");
      }
    } catch (e) {
      // Maneja el error y emite un estado de error
      emit(RolErrorState("Error al eliminar el rol: ${e.toString()}"));
      print('Response _onDeleteRol: ${e.toString()}');
    }
  }
*/
/*
  Future<void> _onDeleteRol(DeleteRolEvent event, Emitter<RolState> emit) async {
    try {
      await rolRepository.deleteRol(event.id);

      if (state is RolSuccessState) {
        final currentRoles = (state as RolSuccessState).roles;
        final updatedRoles = currentRoles.where((rol) => rol.id != event.id).toList();

        // Emite una nueva lista usando spread
        emit(RolSuccessState([...updatedRoles])); // <-- ¡Clave aquí!
        print("Lista actualizada: ${updatedRoles.map((r) => r.id).toList()}");

        print("IDs antes de eliminar: ${currentRoles.map((r) => r.id).toList()}");
        print("ID a eliminar: ${event.id}");
        print("IDs después de eliminar: ${updatedRoles.map((r) => r.id).toList()}");

      }
    } catch (e) {
      emit(RolErrorState("Error al eliminar rol: ${e.toString()}"));
      print('Error en _onDeleteRol: $e');
    }

  }
*/


  Future<void> _onDeleteRol(DeleteRolEvent event, Emitter<RolState> emit) async {
    try {
      print("DELETE ROL");
      await rolRepository.deleteRol(event.id);
      await _reloadRols(emit);

      //if (state is RolSuccessState) {
        //final currentRoles = (state as RolSuccessState).roles;
        //final updatedRoles = List<Rol>.from(currentRoles.where((rol) => rol.id != event.id)); // <-- Usa List.from
        //await _reloadRols(emit);
        //emit(RolSuccessState(updatedRoles)); // Emite la nueva lista
        //print("Lista actualizada: ${updatedRoles.map((r) => r.id).toList()}");
      //}
    } catch (e) {
      emit(RolErrorState("Error al eliminar rol: ${e.toString()}"));
    }
  }


  // Método para recargar la lista de roles
  Future<void> _reloadRols(Emitter<RolState> emit) async {
    emit(RolLoadingState());
    try {
      final items = await rolRepository.getRols();
      emit(RolSuccessState(items));
    } catch (e) {
      emit(RolErrorState(e.toString()));
    }
  }

}