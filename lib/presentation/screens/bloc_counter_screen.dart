import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const BlocCOunterView(),
    );
  }
}

class BlocCOunterView extends StatelessWidget {
  const BlocCOunterView({
    super.key,
  });

  void increaseCounter( BuildContext context, [ int value = 1] ){
    context.read<CounterBloc>().add(CounterIncreased(value)); // el metodo add permite disparar un evento
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) => Text('Counter valor ${bloc.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterReset());
            }, 
            icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
          child: context.select((CounterBloc counterBloc) =>
              Text('Counter valor : ${counterBloc.state.counter}'))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text('+3'), 
              onPressed: (){
                increaseCounter(context, 3);
              }),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2', 
              child: const Text('+2'), 
              onPressed: () {
                increaseCounter(context, 2);
              }),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3', 
              child: const Text('+1'), 
              onPressed: () {
                increaseCounter(context, 1);
              }),
        ],
      ),
    );
  }
}
