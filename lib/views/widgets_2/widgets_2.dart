import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});
  @override
  State<HomePage2> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  String title = 'Hola, Flutter';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Cat"),
              Tab(text: "Dog"),
              Tab(text: "Rabbit"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: GridView.count(
                  mainAxisSpacing: 20.0,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(120, 255, 0, 155),
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(120, 149, 0, 254),
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(120, 191, 254, 1),
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromARGB(120, 0, 255, 128),
                      child: const Text('Who scream'),
                    ),
                  ],
                ),
              ),
              // Puedes agregar aquí el contenido de cada tab usando TabBarView si lo necesitas
            ],
          ),
        ),
      ),
    );
  }
}