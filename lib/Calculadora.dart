import 'package:flutter/material.dart';
import 'main.dart';
import 'calculo.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final Calculo _calculator = Calculo();
  int _pressedButton = 0;

  void _handleNumberPress(int number){
    setState((){
      _calculator.changeResult(number);
      
    });
  }

  void _handleMinus(){
    setState(() {
      _calculator.minus();
    });
  }

  void _handlePlus(){
    setState(() {
      _calculator.plus();
    });
  }

  void _handleEquals(){
    setState(() {
      _calculator.calculateOperation();
    });
  }

  void _handleClear(){
    setState(() {
      _calculator.clearResult();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      body: Center(
        child: Container(
          width: 400,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            
            color: Colors.blue[100], 
            borderRadius: BorderRadius.circular(10), 
            border: Border.all(
             
              color: Colors.blue,
              width: 2,
            ),
            boxShadow: [
              // sombra
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                SingleChildScrollView(                 
                  scrollDirection: Axis.horizontal,
                  
                  child: Text(_calculator.result, style: Theme.of(context).textTheme.headlineMedium),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      Row(  
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int j = 0; j < 3; j++)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: GestureDetector(
                                onTapDown: (_) => setState(() {
                                  _pressedButton = i * 3 + j + 1;
                                }),
                                onTapUp: (_) {
                                  _handleNumberPress(i * 3 + j + 1);
                                  Future.delayed(const Duration(milliseconds: 200), () { //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  });
                                },
                                
                                onTapCancel: () {
                                  setState(() {
                                    _pressedButton = -1;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 150), //TEMPO QUE DEMORA PARA FAZER ANIMAÇÃO
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: _pressedButton == i * 3 + j + 1
                                        ? Colors.green[300]
                                        : Colors.blue,
                                    borderRadius: _pressedButton == i * 3 + j + 1
                                        ? BorderRadius.circular(30) // Circular
                                        : BorderRadius.circular(10), // Rounded square
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${i * 3 + j + 1}',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                                                                                   
                        ],
                        
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: _handleMinus,
                            tooltip: 'Subtrair',
                            child: const Icon(Icons.horizontal_rule),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _handleNumberPress(0),
                            tooltip: '0',
                            child: Text('0')
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _handlePlus(),
                            tooltip: 'Somar',
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: _handleEquals,
                            tooltip: 'Igual',
                            child: Text('='),
                          ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: _handleClear,
                            tooltip: 'Limpar',
                            child: Text('CE'),
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
