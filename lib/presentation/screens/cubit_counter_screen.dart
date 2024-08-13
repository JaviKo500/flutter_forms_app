import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [ int value = 1 ] ) {
     context.read<CounterCubit>().increaseBy( value );
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>( ).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter Screen: ${ counterState.transactionCount }', style: const TextStyle()),
        actions: [
          IconButton(
            onPressed: () =>  context.read<CounterCubit>().reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter ${state.counter}', style: const TextStyle());
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increaseCounterBy( context,  3 ),
            child: const Text('+3', style: TextStyle()),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increaseCounterBy( context,  2 ),
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
