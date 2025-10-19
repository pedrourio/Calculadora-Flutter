import 'package:flutter/material.dart';
import 'main.dart';

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
  int _counter = 0;
  String _result = '';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _changeResult(dynamic n) {
    setState(() {
      // ignore: prefer_interpolation_to_compose_strings
      _result = _result + '$n';
    });
  }

  void _clearResult(){
    setState(() {
      _result = '';
    });
    
  }

  void _plus(){
    
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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(_result, style: Theme.of(context).textTheme.headlineMedium),
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
                              padding: EdgeInsets.all(20),
                              child: FloatingActionButton(
                                onPressed: () => _changeResult(i * 3 + j),
                                tooltip: '${i * 3 + j + 1}',
                                child: Text('${i * 3 + j + 1}'),
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
                            onPressed: _clearResult,
                            tooltip: 'Limpar',
                            child: Text('CE')
                          ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _changeResult(0),
                            tooltip: '0',
                            child: Text('0')
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _plus(),
                            tooltip: 'Soma',
                            child: const Icon(Icons.add),
                          )
                        )
                      ]
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
