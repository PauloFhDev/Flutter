import 'package:flutter/material.dart';

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(title: const Text('Nomes dos componentes:')),
        body: const Center(
          child: Text(
            'Iago Lacerda \nPaulo Barbosa \nRonaldo Santos',
            style: TextStyle(
              fontSize: 25, 
              color: Colors.black, 
            ),
            
          ),
        ),
      ),
    );
  }
}
