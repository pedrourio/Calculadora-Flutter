import 'package:flutter/material.dart';
import 'main.dart';

class BotaoCalculadora extends StatelessWidget{
  final Color? backGroundColor;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCancelCallback? onTapCancel;
  final bool? buttonState;
  final int? buttonText;
  final Icon? buttonIcon;

  const BotaoCalculadora({
    super.key,
    this.backGroundColor,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.buttonState,
    this.buttonText,
    this.buttonIcon,

  });


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTapUp:onTapUp,      
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: buttonState == true
              ? Colors.green[300]
              : backGroundColor,
          borderRadius: buttonState == true
              ? BorderRadius.circular(30) 
              : BorderRadius.circular(10), 
        ),
        child: Center(
          child: Text(
            '$buttonText',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }
}