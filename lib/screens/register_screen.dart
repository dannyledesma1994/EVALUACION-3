import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Validación básica
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showAlertDialog(
        "Error de Registro",
        "Por favor, complete todos los campos.",
      );
    } else if (password != confirmPassword) {
      _showAlertDialog(
        "Error de Registro",
        "Las contraseñas no coinciden.",
      );
    } else {
      // Registro exitoso
      _showAlertDialog(
        "Registro Exitoso",
        "El registro se completó correctamente.",
        onConfirm: () {
          Navigator.pushNamed(context, '/transfer');
        },
      );
    }
  }

  void _showAlertDialog(String title, String message, {VoidCallback? onConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                if (onConfirm != null) onConfirm();
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
      appBar: AppBar(title: Text('Registro')),
      body: Container(
        color: Colors.blue[900], // Fondo azul marino
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre completo',
                    labelStyle: TextStyle(color: Colors.white), // Letras blancas
                    filled: true,
                    fillColor: Colors.blue[700], // Fondo del campo azul más claro
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blue[700],
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Número de teléfono',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blue[700],
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blue[700],
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.blue[700],
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Botón blanco
                    foregroundColor: Colors.blue[900], // Texto azul marino
                  ),
                  child: Text('Registrarse'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Volver a Iniciar Sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
