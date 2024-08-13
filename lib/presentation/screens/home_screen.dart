import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              'Cubits',
              style: TextStyle()
            ),
            subtitle: const Text(
              'State management',
              style: TextStyle()
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
           ListTile(
            title: const Text(
              'Blocks',
              style: TextStyle()
            ),
            subtitle: const Text(
              'State management',
              style: TextStyle()
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/blocks'),
          )
        ],
      ),
    );
  }
}