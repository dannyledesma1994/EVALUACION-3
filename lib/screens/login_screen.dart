import 'package:evaluacion/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Validación simple: Cambia estos valores según tu lógica real
    const correctEmail = "usuario@example.com";
    const correctPassword = "123456";

    if (email != correctEmail || password != correctPassword) {
      // Mostrar alerta si los datos no coinciden
      _showAlertDialog(
        context,
        "Error de Inicio de Sesión",
        "Correo electrónico o contraseña incorrectos.",
      );
    } else {
      // Redirigir a la pantalla de transferencias si es correcto
      Navigator.pushNamed(context, '/transfer');
    }
  }

  void _showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de alerta
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio de Sesión')),
      body: Container(
        color: Colors.grey[400], // Fondo plomo
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Letra azul oscuro
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.blue[900]), // Letra azul oscuro
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900], // Botón azul oscuro
                ),
                child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Registrarse', style: TextStyle(color: Colors.blue[900])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> login(email,pass,context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: pass
  
  );
  Navigator.push(context,MaterialPageRoute(builder: (context)=>TransferScreen ()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}
