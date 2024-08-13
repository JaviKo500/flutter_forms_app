import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlockCounterScreen extends StatelessWidget {
  const BlockCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();
  void increaseCounterBy( BuildContext context, [ int value = 1 ] ) {
     context.read<CounterBloc>().add( CounterIncreased( value ) );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block Counter Screen', style: TextStyle()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) => Text(
              'Counter value ${counterBloc.state.counter}',
              style: const TextStyle()),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy( context, 3 ),
            child: const Text('+3', style: TextStyle()),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy( context, 2 ),
            child: const Text('+2', style: TextStyle()),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increaseCounterBy( context ),
            child: const Text('+1', style: TextStyle()),
          ),
        ],
      ),
    );
  }
}
