import 'package:flutter/material.dart';

class _HomePageState extends State<HomePage> {
  final TextEditingController activityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _listActivitys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 247, 248),
        appBar: AppBar(
          title: const Text('Lista de Atividade!'),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Row(children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: activityController,
                      style:
                          const TextStyle(fontSize: 32, color: Colors.black87),
                      decoration: const InputDecoration(
                          hintText: 'Digite a atividade...',
                          hintStyle: TextStyle(fontSize: 20)),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'informe uma atividade';
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Clicou");
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _listActivitys.add(activityController.text);
                          });
                          print(_listActivitys);
                          activityController.clear();
                        }
                        return;
                      },
                      child: const Text('ADD'),
                    ),
                  ),
                ]),
              ),
              Column(children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _listActivitys.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Center(
                        child: SizedBox(
                          height: 100,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: <Widget>[
                                  Text(_listActivitys[index]),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _listActivitys
                                            .remove(_listActivitys[index]);
                                            print(_listActivitys);
                                      });
                                    },
                                    child: const Text("REMOVER"),
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ],
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
