import 'package:flutter/material.dart';
import 'package:login_tela2/configs/local_routes.dart';
import 'package:login_tela2/widgets/cs_text_field.dart';
import '../../segundaPagina.dart';

class LoginView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginView({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // ignore: prefer_final_fields
  TextEditingController _usuarioController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _senhaController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _emailController = TextEditingController();
  String _mensagemErro = '';

  final FocusNode _usuarioFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _senhaFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_init_to_null
    // ignore: avoid_init_to_null
    // ignore: avoid_init_to_null
    // ignore: avoid_init_to_null
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36, 200, 36, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CsTextField(
                    label: 'Usuário',
                    hintText: 'Informe o seu Usuário',
                    controller: _usuarioController,
                    onChanged: (usuario) {
                      setState(() {});
                    },
                    focusNode: _usuarioFocus,
                    textStyle: const TextStyle(color: Colors.black),
                    minWidth: 150,
                  ),
                  const SizedBox(height: 20),
                  CsTextField(
                    label: 'E-mail',
                    hintText: 'Informe o seu E-mail',
                    controller: _emailController,
                    onChanged: (email) {
                      setState(() {});
                    },
                    focusNode: _emailFocus,
                    textStyle: const TextStyle(color: Colors.black),
                    minWidth: 150,
                  ),
                  const SizedBox(height: 20),
                  CsTextField(
                    label: 'Senha',
                    hintText: 'Informe sua Senha',
                    controller: _senhaController,
                    onChanged: (senha) {
                      setState(() {});
                    },
                    obscureText: true,
                    focusNode: _senhaFocus,
                    textStyle: const TextStyle(color: Colors.black),
                    minWidth: 150,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica de autenticação
                      String usuario = _usuarioController.text.trim();
                      String email = _emailController.text.trim();
                      String senha = _senhaController.text.trim();

                      if ((usuario == '' || email == '') && senha == '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SegundaPagina(
                              nomeUsuario: usuario,
                              idadeUsuario: 27,
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          _mensagemErro = 'Nome de usuário ou senha incorretos.';
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 30),
                      elevation: 0,
                    ),
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    _mensagemErro,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LocalRoutes.CADASTRO_USUARIO);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 30),
                      elevation: 0, // Remove a sombra
                    ),
                    child: const Text(
                      'Criar Cadastro',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LocalRoutes.Esqueci_a_senha);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 30),
                      elevation: 0, // Remove a sombra
                    ),
                    child: const Text(
                      'Esqueceu a senha?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  //TextButton(onPressed: onPressed, child: child)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
