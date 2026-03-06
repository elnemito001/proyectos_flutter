import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/core/theme/theme_notifier.dart';
import 'package:flutter_application_1/Screens/screen_detalle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buttonColor(BuildContext context, Color color, String nombre) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenDetalle(color: color, nombre: nombre),
          ),
        );
      },
      child: Text(nombre),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 80.0),
            SwitchListTile(
              title: const Text('Modo Oscuro'),
              value: Provider.of<ThemeNotifier>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeNotifier>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
            ),
            Text("Hola Mundo"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 1,
        child: Icon(Icons.send),
      ),
      appBar: AppBar(
        title: Text("Mi App en Flutter"),
        backgroundColor: Colors.cyan,
        actions: [
          Icon(Icons.favorite),
          Stack(
            children: [
              Text("1"),
              IconButton(onPressed: () => 1, icon: Icon(Icons.notifications)),
            ],
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              _buttonColor(context, Colors.redAccent, "Rojo"),
              _buttonColor(context, Colors.blueAccent, "Azul"),
              _buttonColor(context, Colors.amber, "Amarillo"),
              _buttonColor(context, Colors.greenAccent, "Verde"),
            ],
          );
        },
      ),
    );
  }
}
