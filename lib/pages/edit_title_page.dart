import 'package:brasileirao/repositories/teams.dart';
import 'package:flutter/material.dart';

import 'package:brasileirao/models/championship.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditTitlePage extends StatefulWidget {
  final Championship championship;

  const EditTitlePage({
    Key? key,
    required this.championship,
  }) : super(key: key);

  @override
  State<EditTitlePage> createState() => _EditTitlePageState();
}

class _EditTitlePageState extends State<EditTitlePage> {
  final _championship = TextEditingController();
  final _year = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _year.text = widget.championship.year;
    _championship.text = widget.championship.competition;
  }

  void handleEditChampionship() {
    Provider.of<TeamsRepository>(context, listen: false).editChampionship(
      championship: widget.championship,
      newChampionshipName: _championship.text,
      newChampionshipYear: _year.text,
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar título'),
        actions: [
          IconButton(
            onPressed: handleEditChampionship,
            icon: const Icon(
              Icons.check,
            ),
          )
        ],
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
          ],
        ),
      ),
    );
  }
}
