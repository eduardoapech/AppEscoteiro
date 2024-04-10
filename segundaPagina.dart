import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  final String nomeUsuario;
  final int idadeUsuario;

  const SegundaPagina({Key? key, required this.nomeUsuario, required this.idadeUsuario}) : super(key: key);

  // Método para construir os botões personalizados
  Widget _buildCustomButton(BuildContext context, String text, String imagePath, Color buttonColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: buttonColor, // Cor do texto do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
        elevation: 3, // Sombra do botão
        minimumSize: const Size(double.infinity, 50), // Define a altura mínima do botão
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100, // Largura da imagem
            height: 200, // Altura da imagem
          ),
          const SizedBox(width: 10), // Espaçamento entre a imagem e o texto
          Text(
            text,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gel Horizonte'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(56, 20, 76, 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 1, right: 4),
                    child: SizedBox(
                      height: 120,
                      width: 400,
                      child: _buildCustomButton(context, 'Apostila do Escoteiro', 'assets/images/logo3.png', Colors.blue, () {
                        Navigator.pushNamed(context, '/apostila');
                      }),
                    ),
                  );
                }
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                width: 400,
                child: _buildCustomButton(context, 'Regras', 'assets/images/logo3.png', Colors.green, () {
                  Navigator.pushNamed(context, '/regras');
                }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                width: 400,
                child: _buildCustomButton(context, 'Acampamentos', 'assets/images/logo3.png', Colors.orange, () {
                  Navigator.pushNamed(context, '/acampamentos');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
