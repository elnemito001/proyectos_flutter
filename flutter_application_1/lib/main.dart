import 'package:flutter/material.dart';
void main() {
 
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// ── Página principal ──────────────────────────────────────────────
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _favoriteCount = 1;

  void _navigateToColor(BuildContext context, Color color, String colorName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ColorPage(color: color, colorName: colorName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ──
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          'Mi aPp en Flutter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.black),
                onPressed: () {
                  setState(() => _favoriteCount++);
                },
              ),
              Positioned(
                top: 8,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$_favoriteCount',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // ── Drawer ──
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: Text(
                'Mi aPp en Flutter',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            _drawerColorTile(context, Colors.blue, 'Azul'),
            _drawerColorTile(context, Colors.yellow, 'Amarillo'),
            _drawerColorTile(context, Colors.green, 'Verde'),
          ],
        ),
      ),

      // ── Body ──
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _colorButton(context, Colors.blue, 'Azul'),
            const SizedBox(height: 12),
            _colorButton(context, Colors.yellow, 'Amarillo'),
            const SizedBox(height: 12),
            _colorButton(context, Colors.green, 'Verde'),
          ],
        ),
      ),
    );
  }

  // Botón redondeado con sombra (como en la imagen)
  Widget _colorButton(BuildContext context, Color color, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: color,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      ),
      onPressed: () => _navigateToColor(context, color, label),
      child: Text(label, style: TextStyle(fontSize: 18, color: color)),
    );
  }

  // Tile del drawer
  ListTile _drawerColorTile(BuildContext context, Color color, String label) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color, radius: 12),
      title: Text(label),
      onTap: () {
        Navigator.pop(context); // cierra el drawer
        _navigateToColor(context, color, label);
      },
    );
  }
}

// ── Página de color ───────────────────────────────────────────────
class ColorPage extends StatelessWidget {
  final Color color;
  final String colorName;

  const ColorPage({super.key, required this.color, required this.colorName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          colorName,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Text(
          colorName,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
