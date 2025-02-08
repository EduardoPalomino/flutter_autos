import 'package:autos/presentation/screens/dashboard_screen.dart';
import 'package:autos/presentation/screens/pantalla_prueba.dart';
import 'package:autos/presentation/screens/rol/rol_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/blocs/actividad_bloc.dart';
import 'business_logic/blocs/rol/rol_bloc.dart';
import 'data/repositories/actividad_repository.dart';
import 'data/repositories/rol_repository.dart';
import 'presentation/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provee ActividadBloc
        BlocProvider(
          create: (context) => ActividadBloc(
            actividadRepo: ActividadRepo(),
          ),
        ),
        // Provee RolBloc
        BlocProvider(
          create: (context) => RolBloc(
            rolRepository: RolRepository(), // Asegúrate de tener esta clase
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff7869f3),
          primarySwatch: Colors.purple,),
        //home: const SearchPage(),
        //home:  PantallaPrueba(),
        //home:DashboardScreen(),
        home:RoleListScreen(),
      ),
    );
  }
}
