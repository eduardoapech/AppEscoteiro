import 'package:flutter/material.dart';

class acampamentos extends StatefulWidget {
  const acampamentos({super.key});

  @override
  State<acampamentos> createState() => _acampamentosState();
}

class _acampamentosState extends State<acampamentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acampamento'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(36, 200, 36, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Acampamentos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Aqui você pode adicionar o conteúdo sobre Acampamentos.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
