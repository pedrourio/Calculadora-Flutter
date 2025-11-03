import 'package:flutter/material.dart';
import 'Calculadora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Calculadora em Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        
      ),
      home: const MainLayout(title: 'Calc1!',),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.title});

  final String title;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: CalculadoraPage(title: "Angry Calc >:("),
    bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.window),
            label: 'Dashboard',
            
          ),
        ],
        backgroundColor: Colors.amber,
      ),
    );
    
  }
}
