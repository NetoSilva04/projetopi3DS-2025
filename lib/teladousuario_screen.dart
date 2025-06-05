import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:projetopi/teladelogin_screen.dart';

class UserPage extends StatefulWidget {
  final String nome;
  final String email;

  const UserPage({
    required this.nome,
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _avatarUrl =
      'https://www.w3schools.com/w3images/avatar2.png';

  final List<String> avatarList = [
    'https://images.unsplash.com/vector-1738925818029-c517f72da894?q=80&w=2360&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://www.w3schools.com/w3images/avatar6.png',
    'https://www.w3schools.com/w3images/avatar5.png',
    'https://www.w3schools.com/w3images/avatar4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página do Estudante'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPerfilView(),
              const SizedBox(height: 30),
              const Text(
                'Redações Enviadas',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildRedacaoCard('Redação 1', 'Nota: Aguardando', 'Data: Aguardando'),
              _buildRedacaoCard('Redação 2', 'Nota: Aguardando', 'Data: Aguardando'),
              _buildRedacaoCard('Redação 3', 'Nota: Aguardando', 'Data: Aguardando'),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRedacaoCard(String titulo, String nota, String data) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(nota),
            const SizedBox(height: 5),
            Text(data),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Ver Correção'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerfilView() {
    return Column(
      children: [
        Container(
          color: Colors.deepPurple[200],
          height: 120,
          width: double.infinity,
        ),
        Transform.translate(
          offset: const Offset(0, -50),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: CachedNetworkImageProvider(_avatarUrl),
                    backgroundColor: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _showAvatarPicker();
                    },
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                widget.nome,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(widget.email),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  void _showAvatarPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Escolher Avatar"),
          content: SizedBox(
            height: 200,
            width: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: avatarList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _avatarUrl = avatarList[index];
                    });
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: CachedNetworkImageProvider(avatarList[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
