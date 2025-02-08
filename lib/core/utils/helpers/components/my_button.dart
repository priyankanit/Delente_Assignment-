import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData iconSymbol;
  const MyButton({super.key, 
  required this.text, 
  required this.iconSymbol,

  this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconSymbol, color: Theme.of(context).colorScheme.inversePrimary,),
              const SizedBox(width: 5,),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

      ));
  }
}