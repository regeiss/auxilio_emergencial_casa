import 'package:auxilio_emergencial/source/features/common/extension/column_extension.dart';
import 'package:auxilio_emergencial/source/features/user/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetalheScreen extends ConsumerWidget {
  UserDetalheScreen({super.key, required this.userId, required this.user});

  final int userId;
  final User? user;
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
          title: Text('Id: ${user!.id.toString()}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Your action here
              },
              child: Text('Salvar'),
            ),
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
                      initialValue: user!.name,
                      key: _nomeFieldKey,
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: FormBuilderValidators.required(),
                    ),
                    FormBuilderTextField(
                      name: 'fone',
                      initialValue: user!.phone,
                      key: _foneFieldKey,
                      validator: FormBuilderValidators.phoneNumber(),
                      decoration: InputDecoration(labelText: 'Telefone'),
                      autovalidateMode: AutovalidateMode.always,
                    ),
                    FormBuilderTextField(
                      key: _emailFieldKey,
                      initialValue: user!.email,
                      name: 'email',
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _ruaFieldKey,
                      initialValue: user!.address!.street,
                      name: 'endereço',
                      decoration: const InputDecoration(labelText: 'Endereço'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _suiteFieldKey,
                      initialValue: user!.address!.suite,
                      name: 'numero',
                      decoration: const InputDecoration(labelText: 'Numero'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _cidadeFieldKey,
                      initialValue: user!.address!.city,
                      name: 'cidade',
                      decoration: const InputDecoration(labelText: 'Cidade'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    FormBuilderTextField(
                      key: _cepFieldKey,
                      initialValue: user!.address!.zipcode,
                      name: 'cep',
                      decoration: const InputDecoration(labelText: 'CEP'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                    OverflowBar(
                      spacing: 8,
                      overflowAlignment: OverflowBarAlignment.end,
                      overflowSpacing: 4,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            child: const Text('Cancelar'), onPressed: () {}),
                        ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              _formKey.currentState?.saveAndValidate();
                              debugPrint(
                                  _formKey.currentState?.value.toString());
                            }),
                      ],
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
