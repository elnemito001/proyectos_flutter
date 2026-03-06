import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LlamarFlaskScreen extends StatelessWidget {
  const LlamarFlaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enviar petición a Flask")),
      body: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _controladorDeTexto = TextEditingController();
  String _serverResponse = "Aquí aparecerá la respuesta del servidor";
  bool _isLoading = false;
  final String _urlNgrok = "https://wailingly-voluminous-malcom.ngrok-free.dev";

  Future<void> _enviarDatosAFlask() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.post(
        Uri.parse(_urlNgrok),
        headers: {
          'content-type': 'application/json',
          'ngrok-skip-browser-warning': 'true',
        },
        body: jsonEncode({'mensaje': _controladorDeTexto.text}),
      );
      setState(() {
        _serverResponse = response.body;
      });
    } catch (errorMessage) {
      setState(() {
        _serverResponse = "Error del servidor $errorMessage";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controladorDeTexto,
            decoration: const InputDecoration(labelText: 'Mensaje'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLoading ? null : _enviarDatosAFlask,
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Text('Enviar'),
          ),
          const SizedBox(height: 20),
          Text(_serverResponse),
        ],
      ),
    );
  }
}
