import 'package:dio/dio.dart';

//* Como vamos a llamar a las peticiones, si queremos cambiar de paquete como HTTP, no habría muchos lugares donde cambiarla.

class DioRest {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
      receiveTimeout: const Duration(
        seconds: 5,
      ), // Configuración del receiveTimeout a 5 segundos
    ),
  );
}
