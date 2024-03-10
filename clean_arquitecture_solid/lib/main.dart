import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/core/di/services_locator.dart'; // Asegúrate de importar tu serviceLocator
import 'package:flutter/material.dart';

void main() {
  serviceLocator(); // Llama a serviceLocator antes de acceder a getIt

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Corrije la sintaxis de la definición del constructor

  @override
  Widget build(BuildContext context) {
    //* Para decirle que muestre las pages por rutas ponemos .router
    //* Llamamos al routerConfig que es el que tiene el config de las rutas
    return MaterialApp.router(
      title: "Example Clean Code",
      //* Configurador de las rutas
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getThemeData(),
    );
  }
}
