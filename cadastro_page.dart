import 'package:flutter/material.dart';
import 'package:login_tela2/configs/local_routes.dart';
import 'package:login_tela2/widgets/cs_text_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {


  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmacaosenhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _ruaController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _nresidenciaController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();

  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _senhaFocus = FocusNode();
  final FocusNode _confirmacaosenhaFocus = FocusNode();
  final FocusNode _telefoneFocus = FocusNode();
  final FocusNode _ruaFocus = FocusNode();
  final FocusNode _bairroFocus = FocusNode();
  final FocusNode _nresidenciaFocus = FocusNode();
  final FocusNode _nascimentoFocus = FocusNode();

  DateTime? _dataNascimentoSelecionada;
  bool _cadastroRealizado = false;

  @override
  Widget build(BuildContext context) {

    _nomeFocus.requestFocus();

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
            padding: const EdgeInsets.fromLTRB(36, 100, 36, 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextFieldWithLabel('Nome', _nomeController, _nomeFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Email', _emailController, _emailFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Senha', _senhaController, _senhaFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Confirmar Senha', _confirmacaosenhaController, _confirmacaosenhaFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Telefone', _telefoneController, _telefoneFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Rua', _ruaController, _ruaFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('Bairro', _bairroController, _bairroFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabel('N° Residência', _nresidenciaController, _nresidenciaFocus),
                  const SizedBox(height: 10),
                  _buildTextFieldWithLabelAndDatePicker('Data de Nascimento', _nascimentoController, _nascimentoFocus),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final nome = _nomeController.text;
                      final email = _emailController.text;
                      final senha = _senhaController.text;
                      final dataNascimento = _dataNascimentoSelecionada?.toString() ?? '';

                      if (nome.isEmpty || email.isEmpty || senha.isEmpty || dataNascimento.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Aviso'),
                            content: const Text('Por favor, preencha todos os campos obrigatórios.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      setState(() {
                        _cadastroRealizado = true;
                      });

                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Cadastro com Sucesso'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Cadastro: $nome'),
                              Text('Email: $email'),
                              Text('Senha: $senha'),
                              Text('Data de Nascimento: $dataNascimento'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, LocalRoutes.LOGIN); // Navega para a tela de login
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Cadastrar'),
                  ),
                  if (_cadastroRealizado)
                    const Text(
                      'Cadastro realizado com sucesso!',
                      style: TextStyle(color: Colors.green),
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
      height: 30, // Defina a altura desejada
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                CsTextField(
                  hintText: 'Informe o seu $label',
                  controller: controller,
                  focusNode: focusNode,
                  textStyle: const TextStyle(color: Colors.black),
                  onChanged: (value) {},
                  label: '',
                  minWidth: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithLabelAndDatePicker(String label, TextEditingController controller, FocusNode focusNode) {
    return SizedBox(
      height: 30, // Defina a altura desejada
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                CsTextField(
                  hintText: 'Informe o seu $label',
                  controller: controller,
                  focusNode: focusNode,
                  textStyle: const TextStyle(color: Colors.black),
                  onChanged: (value) {},
                  label: '',
                  minWidth: 150,
                ),
                GestureDetector(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light(),
                          child: child ?? const Text(''),
                        );
                      },
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _dataNascimentoSelecionada = pickedDate;
                        _nascimentoController.text = pickedDate.toString();
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void main() {
    runApp(const MaterialApp(
      home: CadastroPage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
