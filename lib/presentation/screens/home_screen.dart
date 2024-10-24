import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: [
          ListTile(
            title:  const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title:  const Text('Bloc'),
            subtitle: const Text('Gestor de estado básico'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/bloc'),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),

          ListTile(
            title:  const Text('Nuevo usuario'),
            subtitle: const Text('Manejo de formulario'),
            trailing: const Icon(Icons.app_registration_rounded),
            onTap: () => context.push('/new-user'),
          ),
        ],
      ),
    );
  }
}