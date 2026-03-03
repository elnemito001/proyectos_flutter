import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/screen_detalle.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Widget _buttonColor(BuildContext context, Color color, String colorName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ScreenDetalle(color: color, nombre: colorName),
          ),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(colorName, style: const TextStyle(color: Colors.white)),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
