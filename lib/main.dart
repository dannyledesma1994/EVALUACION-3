import 'package:evaluacion/screens/deposit_screen.dart';
import 'package:evaluacion/screens/login_screen.dart';
import 'package:evaluacion/screens/register_screen.dart';
import 'package:evaluacion/screens/transfer_screen.dart';
import 'package:evaluacion/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación Bancaria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[400], // Color plomo para el encabezado
          foregroundColor: Colors.black, // Color del texto en el encabezado
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/transfer': (context) => TransferScreen(),
        '/deposit': (context) => DepositScreen(),
      },
    );
  }
}
