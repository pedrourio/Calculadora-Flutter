import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'calculo.dart';
import 'botao_calculadora.dart';

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
  //final FloatingActionButton backgoundButon;

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final Calculo _calculator = Calculo();
  int _pressedButton = 0;

  void _handleNumberPress(int number) {
    setState(() {
      _calculator.changeResult(number);
    });
  }

  void _handleMinus() {
    setState(() {
      _calculator.minus();
    });
  }

  void _handlePlus() {
    setState(() {
      _calculator.plus();
    });
  }

  void _handleEquals() {
    setState(() {
      _calculator.calculateOperation();
    });
  }

  void _handleClear() {
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
          width: 500,
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.amber, width: 2),
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
            child: Stack(
            
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  width: _pressedButton != -1 
                    ? 310 
                    : 300,
                  height: _pressedButton != -1 
                    ? 55 
                    : 50,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                  decoration: BoxDecoration(
                    color: _pressedButton != -1
                        ? Colors.red[200]
                        : Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: _pressedButton != -1
                        ? BorderRadius.circular(4) // Circular
                        : BorderRadius.circular(10),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.down,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      primary: true,

                      child: Text(
                        _calculator.result,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 80), // Espaço adicional no topo
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < 3; j++)
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: BotaoCalculadora(
                                  backGroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  buttonText: '${(i * 3 + j + 1)}',
                                  buttonState: _pressedButton == i * 3 + j + 1
                                      ? true
                                      : false,
                                  onTapDown: (_) => setState(() {
                                    _pressedButton = (i * 3 + j + 1);
                                  }),
                                  onTapUp: (_) {
                                    _handleNumberPress(i * 3 + j + 1);
                                    Future.delayed(
                                      const Duration(milliseconds: 200),
                                      () {
                                        //TEMPO QUE FICA APERTADO
                                        if (mounted) {
                                          setState(() {
                                            _pressedButton = -1;
                                          });
                                        }
                                      },
                                    );
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      _pressedButton = -1;
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Subtração
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: BotaoCalculadora(
                              backGroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              buttonText: "-",
                              buttonState: _pressedButton == 0 ? true : false,
                              onTapDown: (_) => setState(() {
                                _pressedButton = 0;
                              }),
                              onTapUp: (_) {
                                _handleMinus();
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  },
                                );
                              },
                              onTapCancel: () {
                                setState(() {
                                  _pressedButton = -1;
                                });
                              },
                            ),
                          ),

                          //NÚMERO 0
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: BotaoCalculadora(
                              backGroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              buttonText: '${0}',
                              buttonState: _pressedButton == 0 ? true : false,
                              onTapDown: (_) => setState(() {
                                _pressedButton = 0;
                              }),
                              onTapUp: (_) {
                                _handleNumberPress(0);
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  },
                                );
                              },
                              onTapCancel: () {
                                setState(() {
                                  _pressedButton = -1;
                                });
                              },
                            ),
                          ),

                          //SOMA
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: BotaoCalculadora(
                              backGroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              buttonText: "+",
                              buttonState: _pressedButton == 0 ? true : false,
                              onTapDown: (_) => setState(() {
                                _pressedButton = 0;
                              }),
                              onTapUp: (_) {
                                _handlePlus();
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  },
                                );
                              },
                              onTapCancel: () {
                                setState(() {
                                  _pressedButton = -1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //IGUAL
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: BotaoCalculadora(
                              backGroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              buttonText: "=",
                              buttonState: _pressedButton == 0 ? true : false,
                              onTapDown: (_) => setState(() {
                                _pressedButton = 0;
                              }),
                              onTapUp: (_) {
                                _handleEquals();
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  },
                                );
                              },
                              onTapCancel: () {
                                setState(() {
                                  _pressedButton = -1;
                                });
                              },
                            ),
                          ),

                          //LIMPAR
                          Padding(
                            padding: EdgeInsets.all(10),
                            child:BotaoCalculadora(
                              backGroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              buttonText: "CE",
                              buttonState: _pressedButton == 0 ? true : false,
                              onTapDown: (_) => setState(() {
                                _pressedButton = 0;
                              }),
                              onTapUp: (_) {
                                _handleClear();
                                Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () {
                                    //TEMPO QUE FICA APERTADO
                                    if (mounted) {
                                      setState(() {
                                        _pressedButton = -1;
                                      });
                                    }
                                  },
                                );
                              },
                              onTapCancel: () {
                                setState(() {
                                  _pressedButton = -1;
                                });
                              },
                            ),
                          ),

                          //BOTÃO TESTE
                          
                        ],
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
