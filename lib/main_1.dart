import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Flutter',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Hola, Flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Estudiante: <Maria Jose Ramirez Cardonas>',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Reemplaza por tus assets o por NetworkImage
                Image.asset(
                  'assets/images/hidroponia.png',
                  width: 50,
                  height: 50,
                ),
                Image.network(
                  'https://pbs.twimg.com/media/E-nh14YXEAcw4LK.jpg:large',
                  width: 100,
                  height: 100,
                ),
              ],
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  title = (title == 'Hola, Flutter')
                      ? '¡Título cambiado!'
                      : 'Hola, Flutter';
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Título actualizado')),
                );
              },
              child: const Text('Cambiar título'),
            ),

            Container(
              constraints: BoxConstraints.expand(
                height:
                    Theme.of(context).textTheme.headlineMedium!.fontSize! * .1 +
                    50.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(0.15),
              child: Text(
                'Hello World  😁',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
            ),

            SizedBox(height: 24),
            ListView(
              shrinkWrap:
                  true, // Permite que la lista se muestre dentro de Column
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.place_outlined),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_album_outlined),
                  title: Text('Album'),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android_outlined),
                  title: Text('Phone'),
                ),
              ],
            ),

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
          ],
        ),
      ),
    );
  }
}
