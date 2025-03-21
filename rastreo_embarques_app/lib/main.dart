import 'package:flutter/material.dart';
import 'package:rastreo_embarques_app/pantallas/PaginaHistorial.dart';
import 'package:rastreo_embarques_app/pantallas/PaginaHome.dart';
import 'package:rastreo_embarques_app/pantallas/PaginaStatus.dart';
import 'package:rastreo_embarques_app/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rastreo App',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 73)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const login(), // Pantalla de Login
        '/PaginaHome': (context) => const PaginaHome(),
        '/PaginaStatus': (context) => const PaginaStatus(),
        '/PaginaHistorial': (context) => const PaginaHistorial(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginaActual = 2;

  final List<Widget> _paginas = [
    PaginaHome(),
    PaginaStatus(),
    PaginaHistorial(),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _paginas[_paginaActual],
      //AQUI INICIA LA BARRA DE LOS 3 BOTONES
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_airport), label: "Status"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "Historial"),
        ],
      ),
    );
  }
}
