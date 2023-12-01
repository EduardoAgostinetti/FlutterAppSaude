import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class Paciente extends StatefulWidget {
  final String nome;
  final String horario;
  final int pressao;
  final String observacao;
  final Null receita;
  final String horarioSaida;
  Paciente(
      {required this.nome,
      required this.horario,
      required this.pressao,
      required this.observacao,
      required this.receita,
      required this.horarioSaida});
  @override
  PacienteState createState() => PacienteState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController pacienteController = TextEditingController();
  late String notification = "";
  late String nomePaciente;
  late int pressao;
  late String horario;
  late Null receita;
  late String observacao;
  late String horarios;

  void _sendData() async {
    final String apiUrl =
        'http://192.168.3.48:3000/user/paciente'; // Substitua pela sua URL de destino

    var data = {
      'paciente': pacienteController.text,
    };

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Lógica para manipular a resposta de sucesso aqui
      print('Requisição bem-sucedida. Resposta: ${response.body}');

      var jsonRes = jsonDecode(response.body);
      print(jsonRes['success']);
      if (jsonRes['success'] == true) {
        if (jsonRes['user'] != null) {
          var paciente = jsonRes['user'];

          for (var pacientes in paciente) {
            nomePaciente = pacientes['paciente'];
            pressao = pacientes['Pressao_Paciente'];
            horario = pacientes['Horario_Entrada'];
            receita = pacientes['receita'];
            observacao = pacientes['Observacoes'];
            horarios = pacientes['Horario_Saida'];

            print(nomePaciente);
          }
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Paciente(
              nome: nomePaciente,
              horario: horario,
              pressao: pressao,
              observacao: observacao,
              receita: receita,
              horarioSaida: horarios,
            ),
          ),
        );
      } else {
        setState(() {
          notification = "Não encontramos prontuário para este Paciente.";
        });
      }
    } else {
      // Lógica para manipular a resposta de erro aqui
      print('Falha na requisição. Código de status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página de Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: pacienteController,
              decoration: InputDecoration(
                hintText: 'Insira o Nome',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            ElevatedButton(
              onPressed: _sendData,
              child: Text('Pesquisar'),
            ),
            Text(
              notification,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PacienteState extends State<Paciente> {
  late String nome;
  late int pressao;
  late String observacao;
  late Null receita;
  late String horarioEntrada;
  late String horarioSaida;

  void initState() {
    super.initState();
    nome = widget.nome;
    horarioEntrada = widget.horario;
    horarioSaida = widget.horarioSaida;
    receita = widget.receita;
    observacao = widget.observacao;
    pressao = widget.pressao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Paciente")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: " + nome),
            Text("Pressão: " + pressao.toString()),
            Text("Receita: " + receita.toString()),
            Text("Observação: " + observacao),
            Text("Horario de Entrada: " + horarioEntrada),
            Text("Horario de Saida: " + horarioSaida),
          ],
        ),
      ),
    );
  }
}
