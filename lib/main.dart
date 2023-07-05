import 'package:cronogramas_form/cadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ScreenAula());
}

class ScreenAula extends StatelessWidget {
  const ScreenAula({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro De Aulas',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
