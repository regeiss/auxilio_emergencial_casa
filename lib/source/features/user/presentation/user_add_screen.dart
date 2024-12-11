import 'package:auxilio_emergencial/source/features/common/extension/column_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserAddScreen extends ConsumerWidget {
  UserAddScreen({
    super.key,
  });

  // final int userId;
  // final User? user;
  final _formKey = GlobalKey<FormBuilderState>();
  final _nomeFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _foneFieldKey = GlobalKey<FormBuilderFieldState>();
  final _ruaFieldKey = GlobalKey<FormBuilderFieldState>();
  final _suiteFieldKey = GlobalKey<FormBuilderFieldState>();
  final _cidadeFieldKey = GlobalKey<FormBuilderFieldState>();
  final _cepFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (user != null) {}
    // final userData = ref.watch(userDataProvider.future);
    return Scaffold(
        appBar: AppBar(
          title: Text('Incluir novo'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Your action here
              },
              child: Text('Salvar'),
            )
          ],
        ),
        // drawer: MainDrawer(),
        body: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormBuilderTextField(
                      name: 'nome',
                      initialValue: '',
                      key: _nomeFieldKey,
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: FormBuilderValidators.required(),
                    ),
                    FormBuilderTextField(
                      name: 'fone',
                      initialValue: '0',
                      key: _foneFieldKey,
                      validator: FormBuilderValidators.phoneNumber(),
                      decoration: InputDecoration(labelText: 'Telefone'),
                      autovalidateMode: AutovalidateMode.always,
                    ),
                    FormBuilderTextField(
                      key: _emailFieldKey,
                      initialValue: '',
                      name: 'email',
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _ruaFieldKey,
                      initialValue: '',
                      name: 'endereço',
                      decoration: const InputDecoration(labelText: 'Endereço'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _suiteFieldKey,
                      initialValue: '',
                      name: 'numero',
                      decoration: const InputDecoration(labelText: 'Numero'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _cidadeFieldKey,
                      initialValue: '',
                      name: 'cidade',
                      decoration: const InputDecoration(labelText: 'Cidade'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _cepFieldKey,
                      initialValue: '',
                      name: 'cep',
                      decoration: const InputDecoration(labelText: 'CEP'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ]).wrap(margin: 2.0),
            )));
  }

  void handleClick(int item, WidgetRef ref) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}