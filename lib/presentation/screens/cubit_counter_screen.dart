import 'package:flutter/material.dart';


class CubitCounterScreen extends StatelessWidget {

  const CubitCounterScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cubit Counter Screen',
          style: TextStyle()
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            }, 
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Counter value',
          style: TextStyle()
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              
            },
            child: const Text(
              '+3',
              style: TextStyle()
            ),
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              
            },
            child: const Text(
              '+2',
              style: TextStyle()
            ),
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {
              
            },
            child: const Text(
              '+1',
              style: TextStyle()
            ),
          ),
        ],
      ),
    );
  }
}