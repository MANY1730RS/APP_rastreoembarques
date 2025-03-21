import 'package:flutter/material.dart';
import 'package:rastreo_embarques_app/pantallas/PaginaHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => login(),
        '/PaginaHome': (context) => PaginaHome(),
      },
    );
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  _login createState() => _login();
}

class _login extends State<login> {
  String usuarioText = ""; // Variable para guardar el nombre de usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 244, 141),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://scontent.fqro1-1.fna.fbcdn.net/v/t1.6435-9/96258639_2990287924383412_422139691140120576_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=25d718&_nc_eui2=AeGwh-ZVyB_nFQloUPk2YH5FH_2M3Dy4FWAf_YzcPLgVYHLqFA6CVQ5WeSXK6JaxNA0&_nc_ohc=CwpGnF1x-qIQ7kNvgEg1wPr&_nc_zt=23&_nc_ht=scontent.fqro1-1.fna&_nc_gid=ASAFXhvQJpQJ2Dq-qFhS9rH&oh=00_AYCWBi5HM6BJAKf1Q1Gl16RW4MJ3AWpCg7WxHwnWMBGz4g&oe=6730CBAA"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            nombre(),
            usuario(), // Campo de texto para el usuario
            password(), // Campo de texto para la contraseña
            SizedBox(
              height: 10,
            ),
            boton(context) // Botón para iniciar sesión
          ],
        )));
  }

  Widget nombre() {
    return Text(
      "BIENVENIDO",
      style: TextStyle(
          color: Colors.grey, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
  }

  Widget usuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: "User",
          fillColor: Colors.white,
          filled: true,
        ),
        onChanged: (value) {
          // Guardamos el valor del usuario ingresado
          usuarioText = value;
        },
      ),
    );
  }

  Widget password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Widget boton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color.fromARGB(255, 58, 183, 73), // Color de fondo
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        ),
        onPressed: () {
          try {
            // Navegamos a la pantalla de productos y pasamos el nombre de usuario
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PaginaHome()),
              // Cambio: Pasamos el usuario como argumento
            );
          } catch (e) {
            // Captura cualquier error y muestra un mensaje
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error al navegar: $e'),
              ),
            );
          }
        },
        child: Text(
          "Entrar",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ));
  }
}
