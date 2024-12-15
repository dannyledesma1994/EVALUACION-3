import 'package:flutter/material.dart';

class DepositScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Depósitos')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Monto a depositar'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí iría la lógica para realizar un depósito
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Depósito realizado')));
                Navigator.pop(context);
              },
              child: Text('Confirmar Depósito'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver al Menú Principal'),
            ),
          ],
        ),
      ),
    );
  }
}
