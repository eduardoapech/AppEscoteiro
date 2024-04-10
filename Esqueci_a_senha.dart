import 'package:flutter/material.dart';
import 'package:login_tela2/widgets/cs_text_field.dart';

class Esqueciasenha extends StatefulWidget {
  const Esqueciasenha({super.key});

  @override
  State<Esqueciasenha> createState() => _EsqueciasenhaState();
}

class _EsqueciasenhaState extends State<Esqueciasenha> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo2.png'),
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
                  _buildTextFieldWithLabel('Email', _emailController, _emailFocus),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Recuperação de Senha'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Um link de recuperação será enviado para:'),
                              Text('Email: $email'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Fechar'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Voltar ao Login'))
                          ],
                        ),
                      );
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(String label, TextEditingController controller, FocusNode focusNode) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CsTextField(
              hintText: 'Informe o seu $label',
              controller: controller,
              focusNode: focusNode,
              textStyle: const TextStyle(color: Colors.black),
              onChanged: (value) {},
              label: '',
              minWidth: 150,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Esqueciasenha(),
    debugShowCheckedModeBanner: false,
  ));
}
