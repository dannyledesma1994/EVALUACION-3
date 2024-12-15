import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
        leading: Icon(Icons.send), // Ícono de transferencia en el AppBar
      ),
      body: Container(
        color: Colors.grey[300], // Fondo plomo claro
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_balance_wallet, // Ícono de billetera
                size: 80,
                color: Colors.grey[700], // Color del ícono
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Número de cuenta destino',
                  prefixIcon: Icon(Icons.account_circle), // Ícono en el campo
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco en el campo
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Monto a transferir',
                  prefixIcon: Icon(Icons.attach_money), // Ícono de dinero
                  filled: true,
                  fillColor: Colors.white, // Fondo blanco en el campo
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí iría la lógica para realizar una transferencia
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Transferencia realizada')));
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle), // Ícono de confirmación
                    SizedBox(width: 8),
                    Text('Confirmar Transferencia'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back), // Ícono de volver
                    SizedBox(width: 8),
                    Text('Volver al Menú Principal'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
