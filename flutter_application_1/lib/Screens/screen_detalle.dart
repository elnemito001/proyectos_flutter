import 'package:flutter/material.dart';

class ScreenDetalle extends StatelessWidget {
  final String nombre;
  final Color color;

  const ScreenDetalle({super.key, required this.color, required this.nombre});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: color, title: Text(nombre)),
    );
  }
}
