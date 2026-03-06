import 'package:flutter_application_1/core/theme/theme_notifier.dart';
import 'package:flutter_application_1/pagina_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MainApp(),
    ),
  );
}
