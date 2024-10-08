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
            onTap: () => context.push('/blocs'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 10 ),
            child: Divider(),
          ),
          ListTile(
            title: const Text(
              'New user',
              style: TextStyle()
            ),
            subtitle: const Text(
              'Management forms',
              style: TextStyle()
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/new-user'),
          ),
        ],
      ),
    );
  }
}