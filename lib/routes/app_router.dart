import 'package:flutter_application_1/views/autenticacion/login.dart';
import 'package:flutter_application_1/views/universidad/universidad_fb_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/views/ciclo_vida/ciclo_vida.dart';
import 'package:flutter_application_1/views/home/home.dart';
import 'package:flutter_application_1/views/paso_parametros/detalle_parametros.dart';
import 'package:flutter_application_1/views/paso_parametros/paso_parametros.dart';
import 'package:flutter_application_1/views/future/future_view.dart';
import 'package:flutter_application_1/views/isolate/isolate_view.dart';
import 'package:flutter_application_1/views/timer/timer_view.dart';
import 'package:flutter_application_1/main_1.dart';
import 'package:flutter_application_1/views/widgets_2/widgets_2.dart';

final GoRouter appRouter = GoRouter(

  routes: [
    
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(), // Usa HomeView
    ),

    GoRoute(path: '/login', builder: (context, state) => const Login()),


    GoRoute(
            path: '/ListUniversidad',
            builder: (context, state) => const UniversidadFbListView(),
    ),
    
    
    GoRoute(
          path: '/timer',
          builder: (context, state) => const TimerView(),
    ),


    GoRoute(
      path: '/isolate',
      builder: (context, state) => const IsolateView(),
    ),


    // Ruta para Future View
    GoRoute(
      path: '/future',
      builder: (context, state) => const FutureView(),
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

    GoRoute(
      path: '/widgets_2',
      builder: (context, state) => const HomePage2(),

      
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

    
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),

    
  ],
);
