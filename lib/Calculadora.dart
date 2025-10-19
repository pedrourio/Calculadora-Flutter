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
  String _result = '';
  int _value = 0;
  String _selected_operation = '';

  void _changeResult(dynamic n) {
    setState(() {
      // ignore: prefer_interpolation_to_compose_strings
      _result = _result + '$n';
    });
  }

  void _clearResult(){
    setState(() {
      _result = '';
      _value = 0;
      _selected_operation = '';
    });
    
  }

  void _plus(){
    int result_num = int.tryParse(_result) ?? 0;
    setState((){
      _value =  _value + result_num;
      _result='+';

      _selected_operation = 'plus';
    });
  }

  void _minus(){
    int result_num = int.tryParse(_result) ?? 0;
    setState((){
      _value = (result_num - _value)* -1;
      _result='-';

      _selected_operation = 'minus';
    });
  }

  void _calculateOperation(){
    switch (_selected_operation) {
        case 'plus':
            _plus();
            setState(() {
              _result = '$_value';
              _selected_operation = '';
              _value = 0;
            });
          break;
          case 'minus':
            _minus();
            setState(() {
              _result = '$_value';
              _selected_operation = '';
              _value = 0;
            });
          break;
        default:
          setState(() {
              _result = 'Você ainda não inseriu nenhum valor!';
              
            });
      }    
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
                                onPressed: () => _changeResult(i * 3 + j + 1),
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
                            onPressed: _minus,
                            tooltip: 'Subtrair',
                            child: const Icon(Icons.horizontal_rule),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _changeResult(0),
                            tooltip: '0',
                            child: Text('0')
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: ()=> _plus(),
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
                            onPressed: _calculateOperation,
                            tooltip: 'Igual',
                            child: const Icon(Icons.equalizer),
                          ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: FloatingActionButton(
                            onPressed: _clearResult,
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
    );
  }
}
