import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/actividad.dart';
import '../constants/colors.dart';
import '../widgets/pwh.dart';

class ShowActividad extends StatelessWidget {
  final ActividadModel? actividad;
  final String? nombre;
  final String? descripcion;
  const ShowActividad({Key? key, required this.actividad, this.nombre, this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat("yMMMMd").format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorManager.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: ColorManager.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      nombre!,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white),
                    ),
                  ],
                ),
                getActividadIcon(actividad!.icon),
                Text(
                  actividad!.icon.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${actividad!.id}°",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                    fontSize: 100,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
        const PwhWidget(),
      ],
    );
  }

  Image getActividadIcon(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 250,
      height: 250,
    );
  }
}
