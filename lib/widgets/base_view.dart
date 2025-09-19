//Archivo que permite que cualquier pantalla que use BaseView tenga automáticamente 
//el menú lateral personalizado definido en custom_drawer.dart.


import 'package:flutter/material.dart';
import 'custom_drawer.dart'; // Importa el Drawer personalizado

class BaseView extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseView({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const CustomDrawer(), // Drawer persistente para todas las vistas
      body: body,
    );
  }
}

