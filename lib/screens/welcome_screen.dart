import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LEDES')),
      body: Stack(
        children: [
          // Imagen de fondo desde un enlace
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/fotos-premium/mujer-joven-usando-telefono-movil_1048944-26091302.jpg?w=360',
                ),
                fit: BoxFit.cover, // Asegura que la imagen cubra toda la pantalla
              ),
            ),
          ),
          // Contenido de la pantalla
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BIENVENIDO A NUESTRA APLICACION BANCARIA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Color blanco para que sea legible sobre la imagen
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Iniciar Sesión'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
