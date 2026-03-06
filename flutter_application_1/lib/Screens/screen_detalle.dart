import 'package:flutter/material.dart';

class ScreenDetalle extends StatelessWidget {
  final String nombre;
  final Color color;

  const ScreenDetalle({Key? key, required this.color, required this.nombre})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color, title: Text(nombre)),
    );
  }
}
