import 'package:brasileirao/models/championship.dart';
import 'package:flutter/material.dart';

import 'package:brasileirao/models/team.dart';

class AddTitlePage extends StatefulWidget {
  final Team team;
  final ValueChanged<Championship> onSubmit;

  const AddTitlePage({
    Key? key,
    required this.team,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AddTitlePage> createState() => _AddTitlePageState();
}

class _AddTitlePageState extends State<AddTitlePage> {
  final _championship = TextEditingController();
  final _year = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar título'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: 12,
              ),
              child: TextFormField(
                controller: _year,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ano do título';
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: TextFormField(
                controller: _championship,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Título',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do título';
                  }

                  if (value.length < 4) {
                    return 'O nome deve conter no mínimo 4 letras';
                  }

                  return null;
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Salvar'),
                      ),
                    ],
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSubmit(
                        Championship(
                          competition: _championship.text,
                          year: _year.text,
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
