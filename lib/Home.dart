import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/about.dart';

import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController txtcep = TextEditingController();
  String? resultado;
  String? componentes;

  _consultarCep() async {
    String cep = txtcep.text;
    var url = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String cidade = retorno["localidade"];
    String estado = retorno["uf"];

    setState(() {
      resultado = "\n\n$logradouro\n$bairro\n$cidade - $estado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultando um CEP via API"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o Cep, ex: 1833400",
              ),
              style: const TextStyle(fontSize: 30),
              controller: txtcep,
            ),
            Text(
              "Resultado: $resultado",
              style: const TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: _consultarCep,
              child: const Text(
                "Consultar",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const about()),
                );
              },
              child: const Text(
                "Componentes do projeto",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
