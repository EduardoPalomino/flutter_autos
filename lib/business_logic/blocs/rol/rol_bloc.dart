import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/rol.dart';
import '../../../data/repositories/rol_repository.dart';

part 'rol_event.dart';
part 'rol_state.dart';

class RolBloc extends Bloc<RolEvent, RolState> {
  final RolRepository rolRepository;

  RolBloc(this.rolRepository) : super(RolInitialState());

  @override
  Stream<RolState> mapEventToState(RolEvent event) async* {
    if (event is LoadRolEvent) {
      yield RolLoadingState();
      try {
        final items = await rolRepository.getRols();
        yield RolLoadedState(items);
      } catch (e) {
        yield RolErrorState(e.toString());
      }
    } else if (event is AddRolEvent) {
      try {
        await rolRepository.addRol(event.nombre);
        yield* _reloadRols();
      } catch (e) {
        yield RolErrorState(e.toString());
      }
    } else if (event is UpdateRolEvent) {
      try {
        await rolRepository.updateRol(event.id, event.nombre);
        yield* _reloadRols();
      } catch (e) {
        yield RolErrorState(e.toString());
      }
    } else if (event is DeleteRolEvent) {
      try {
        await rolRepository.deleteRol(event.id);
        yield* _reloadRols();
      } catch (e) {
        yield RolErrorState(e.toString());
      }
    }
  }

  Stream<RolState> _reloadRols() async* {
    yield RolLoadingState();
    try {
      final items = await rolRepository.getRols();
      yield RolLoadedState(items);
    } catch (e) {
      yield RolErrorState(e.toString());
    }
  }
}