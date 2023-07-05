// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validations/stores/form_store.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  FormStore store = FormStore();

  @override
  Widget build(BuildContext context) {
    var _formkey;
    var scaffoldKey;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text('Form Widget')),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 200, top: 30, left: 30, right: 30),
        child: Expanded(
          child: Card(
            elevation: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Observer(builder: (_) {
                  return Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18, left: 18),
                            child: TextFormField(
                              onChanged: (value) {
                                store.email = value;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18, left: 18),
                            child: TextFormField(
                              onChanged: (value) {
                                store.password = value;
                              },
                              decoration: InputDecoration(
                                labelText: 'Senha',
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Observer(
                    builder: (_) {
                      return ElevatedButton.icon(
                        onPressed: store.isFormValid
                            ? () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Email digitado: ${store.email} || Senha digitada: ${store.password}',
                                    ),
                                  ),
                                );
                              }
                            : null,
                        icon: Icon(Icons.check),
                        label: Text('ENVIAR'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
