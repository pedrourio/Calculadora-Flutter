import 'package:flutter/material.dart';
import 'main.dart';
import 'Calculadora.dart';

class Calculo {
  String _result = '';
  double _value = 0;
  String _selected_operation = '';

  String get result => _result;
  double get value => _value;
  String get selectedOperation => _selected_operation;

  void changeResult(dynamic n) {
      //setState
      _result = _result + '$n';

  }

  void clearResult(){
      //setState
      _result = '';
      _value = 0;
      _selected_operation = '';

    
  }

  void plus(){
    double resultNum = double.tryParse(_result) ?? 0;
    //setState
      _value =  _value + resultNum;
      _result='+';

      _selected_operation = 'plus';
   
  }

  void minus(){
    double resultNum = double.tryParse(_result) ?? 0;
    //setState
      _value = (resultNum - _value)* -1;
      _result='-';

      _selected_operation = 'minus';

  }

  void calculateOperation(){
    switch (_selected_operation) {
        case 'plus':
            _value = _value + (double.tryParse(_result) ?? 0);
            //setState
              _result = '$_value';
              _selected_operation = '';
              _value = 0;
            
          break;
          case 'minus':
            minus();
            _value = double.tryParse(_result) ?? 0 - _value ;
            //setState

              _result = '$_value';
              _selected_operation = '';
              _value = 0;
            
          break;
        default:
          
      }    
  }

}