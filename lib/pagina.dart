import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _lista = [
    'Aula 05/07/2023',
    'Aula 04/07/2023',
    'Aula 03/07/2023',
    'Aula 02/07/2023',
    'Aula 01/07/2023'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista De Aulas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(5),
            itemCount: _lista.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.orange,
                child: Center(
                    child: Text(
                  ' ${_lista[index]}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontSize: 19,
                  ),
                )),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
