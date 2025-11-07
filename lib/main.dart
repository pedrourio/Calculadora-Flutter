import 'package:flutter/material.dart';
import 'Calculadora.dart';

void main() {
  runApp(const MyApp());
}
int _mainTheme = 0;
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      theme: ThemeData(
        colorScheme: _mainTheme == 0 
        ? ColorScheme.fromSeed(seedColor: Colors.green)
        : ColorScheme.fromSeed(seedColor: Colors.purple, surface: Colors.grey, ),
        useMaterial3: true,
        
      ),
      title: 'Calculadora em Flutter',
      
      home: const MainLayout(title: 'Calc1!'),
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
  void handleTheme(){
    setState(() {
      _mainTheme = _mainTheme == 0 ? 1 : 0;
    });
  }
  
  int _selectedIndex = 0;
  


  final List<Widget> _pages = [
    CalculadoraPage(title: "Angry Calc >:("),
    Center(child: Text('Dashboard')),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        
      
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
        FloatingActionButton(
          onPressed: (){handleTheme();},
          backgroundColor: Colors.deepPurple,
          child: Text(
            _mainTheme == 0 ? "1" : "0"
          ),
        ),
        _pages[_selectedIndex],

        ]
      ),
      
      
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
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}

  // O que precisa ser feito:

  //  1. Converter MyApp de
  //     StatelessWidget para
  //     StatefulWidget.
  //  2. Mover a variável _mainTheme a
  //      lógica da função handleTheme
  //     para dentro do estado do MyA.
  //  3. Passar a função handleTheme
  //     como um parâmetro para o widt
  //      MainLayout, para que o botão
  //     dentro dele possa chamar a
  //     função que está no estado do
  //     MyApp.

  // Isso pode parecer um pouco
  // complexo, mas é o jeito certo de
  // lidar com estados que afetam o
  // aplicativo inteiro em Flutter.

  // Eu posso fazer essa alteração
  // para você no arquivo
  // lib/main.dart. Quer que eu
  // prossiga?