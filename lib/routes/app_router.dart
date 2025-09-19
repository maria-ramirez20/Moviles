import 'package:go_router/go_router.dart';
//import 'package:flutter_application_1/lib/views/ciclo_vida/ciclo_vida.dart';
import 'package:flutter_application_1/views/home/home.dart';
import 'package:flutter_application_1/views/paso_parametros/detalle_parametros.dart';
import 'package:flutter_application_1/views/paso_parametros/paso_parametros.dart';
import 'package:flutter_application_1/main_1.dart';

final GoRouter appRouter = GoRouter(

  routes: [
    
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(), // Usa HomeView
    ),


    // Rutas para el paso de parámetros
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametros(),

      
    ),

    GoRoute(
      path: '/main_1',
      builder: (context, state) => const HomePage(),

      
    ),



    // !Ruta para el detalle con parámetros
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleParametros(parametro: parametro, metodoNavegacion: metodo);
      },
    ),

    /* 
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
*/
    
  ],
);
