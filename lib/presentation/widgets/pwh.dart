import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/actividad_bloc.dart';
import '../constants/app_string.dart';
import '../constants/image_assets.dart';
import 'column_data_widget.dart';

class PwhWidget extends StatelessWidget {
  const PwhWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActividadBloc, ActividadState>(
      builder: (context, state) {
        if (state is ActividadIsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnDataWidget(
                      title: AppString.pressure,
                      imageFile: ImageAssets.pressure,
                      data: "${state.getActividad.nombre.toString()} hPA",
                    ),
                    ColumnDataWidget(
                      title: AppString.wind,
                      imageFile: ImageAssets.wind,
                      data: "${state.getActividad.icon.toString()} m/s",
                    ),
                    ColumnDataWidget(
                      title: AppString.humidity,
                      imageFile: ImageAssets.humidity,
                      data: "${state.getActividad.icon.toString()}%",
                    ),
                    ColumnDataWidget(
                      title: AppString.feelLike,
                      imageFile: ImageAssets.feelsLike,
                      data: "${state.getActividad.icon.toString()}°C",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
