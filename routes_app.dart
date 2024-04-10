import 'package:flutter/material.dart';
import 'package:login_tela2/configs/local_routes.dart';
import 'package:login_tela2/widgets/acampamentos.dart';
import 'package:login_tela2/widgets/apostila.dart';
import 'package:login_tela2/widgets/regras.dart';

import 'pages/Esqueci_a_senha.dart';
import 'pages/cadastro_page.dart';
import 'segundaPagina.dart';
import 'view/login/login_view.dart';

class RouterApp {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.regras:
        return MaterialPageRoute(
          builder: (_) => const regras(),
        );
      case LocalRoutes.acampamentos:
        return MaterialPageRoute(
          builder: (_) => const acampamentos(),
        );
      case LocalRoutes.apostila:
        return MaterialPageRoute(
          builder: (_) => apostila(),
        );
      case LocalRoutes.Esqueci_a_senha:
        return MaterialPageRoute(
          builder: (_) => const Esqueciasenha(),
        );
      case LocalRoutes.CADASTRO_USUARIO:
        return MaterialPageRoute(
          builder: (_) => const CadastroPage(),
        );
      case LocalRoutes.LOGIN:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case LocalRoutes.HOME:
        return MaterialPageRoute(
          builder: (_) => const SegundaPagina(
            idadeUsuario: 10,
            nomeUsuario: 'teste',
          ),
        );
      default:
        return null;
    }
  }
}
