import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/blocs/actividad_bloc.dart';
import '../../presentation/constants/app_string.dart';
import '../../presentation/constants/colors.dart';
import '../../presentation/constants/image_assets.dart';
import '../../presentation/constants/styles.dart';
import '../../presentation/screens/show_actividad.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? nombreController;
  //  TextEditingController? descripcionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nombreController = TextEditingController(text: '');
    // descripcionController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final actividadBloc = BlocProvider.of<ActividadBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.actividadForecast,
        ),
        actions: [
          IconButton(
            onPressed: () {
              actividadBloc.add(ResetActividad());
              nombreController!.clear();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ActividadBloc, ActividadState>(
              builder: (context, state) {
                if (state is ActividadIsNotSearched) {
                  return actividadNotSearched(actividadBloc);
                } else if (state is ActividadIsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ActividadIsLoaded) {
                  //return ShowActividad(actividad: state.getActividad, nombre: state.nombre,descripcion:state.descripcion);
                  return ShowActividad(actividad: state.getActividad, nombre: state.nombre);
                } else {
                  return const Center(
                    child: Text(
                      "Nombre not found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Container actividadNotSearched(ActividadBloc actividadBloc) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      child: Column(
        children: [
          SizedBox(
              height: 200, width: 200, child: Image.asset(ImageAssets.actividad)),
          const SizedBox(
            height: 200,
          ),
         Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nombreController,
            decoration: InputDecoration(
              border: textFormBorder,
              prefixIcon: const Icon(
                Icons.search,
              ),
              labelText: AppString.actividadName,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter nombre';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // actividadBloc.add(FechActividad(nombre: nombreController!.text,descripcion:descripcionController!.text));
                  actividadBloc.add(FechActividad(nombre: nombreController!.text));

                }
              },
              child: const Text(
                AppString.search,
                style: TextStyle(color: ColorManager.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    )
        ],
      ),
    );
  }
}
