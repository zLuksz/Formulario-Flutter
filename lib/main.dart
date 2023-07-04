import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _turmaController = TextEditingController();
  final TextEditingController _unidadeController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy");
  String dropdownValue = 'Pendente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Cadastro De Aulas',
          style: TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Data Aula
                  DateTimeField(
                    decoration: const InputDecoration(
                        icon: Icon(FontAwesomeIcons.clock),
                        border: OutlineInputBorder()),
                    controller: _dataController,
                    format: format,
                    validator: (value) {
                      if (value == null) {
                        return 'Campo Obrigatorio!';
                      } else {
                        return null;
                      }
                    },
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                  ),
                  // Status Aula
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['Pendente', 'Ministrada', 'Cancelada']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 19),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = _dropController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  // Turma
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: _turmaController,
                      decoration: const InputDecoration(
                          labelText: 'Turma',
                          icon: Icon(FontAwesomeIcons.peopleGroup),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  // Unidade
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: TextFormField(
                      controller: _unidadeController,
                      decoration: const InputDecoration(
                          labelText: 'Unidade',
                          icon: Icon(FontAwesomeIcons.u),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatorio!';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _showDialog(context);
                          }
                        },
                        child: const Text('Cadastrar Aula')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Alerta!!",
          style: TextStyle(color: Colors.black),
        ),
        content: const Text("Aula Cadastrada Com Sucesso"),
        titleTextStyle: const TextStyle(
          fontSize: 30,
        ),
        actions: <Widget>[
          FloatingActionButton(
            child: const Text(
              "Ok",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
