import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_tela2/configs/local_routes.dart';
import 'package:login_tela2/routes_app.dart';
import 'segundaPagina.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [Locale('pt', 'BR')],
      initialRoute: LocalRoutes.LOGIN,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nome = 'Eduardo';
  int idade = 27;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(
          'Nome: $nome',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        Text(
          'Idade: $idade',
          style: const TextStyle(fontSize: 24, color: Colors.red),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Navega para a segunda página ao clicar o botão
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SegundaPagina(
                        nomeUsuario: 'admin',
                        idadeUsuario: 27,
                      )),
            );
          },
          child: const Text('Ir para a segunda página'),
        )
      ])),
    ));
  }
}
