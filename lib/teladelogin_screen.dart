import 'package:flutter/material.dart';
import 'package:projetopi/main.dart';
import 'package:projetopi/pagCorretor/home_page.dart';
import 'package:projetopi/teladecadastro_screen.dart';
import 'package:projetopi/teladousuario_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _usuarioEmail = 'joao@example.com';
  final String _usuarioSenha = '123456';

  final String _corretorEmail = 'corretor@example.com';
  final String _corretorSenha = 'abcdef';

  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email == _usuarioEmail && password == _usuarioSenha) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserPage(
            nome: 'João da Silva',
            email: _usuarioEmail,
          ),
        ),
      );
    } else if (email == _corretorEmail && password == _corretorSenha) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CorretorHomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
              child: const Text('Criar conta'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                  (route) => false,
                );
              },
              child: const Text('Voltar à tela inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
