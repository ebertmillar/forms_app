import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    //on<CounterIncreased>((event,emit) => _onCounterincreased(event, emit));    es lo mismo que la linea 11
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased( CounterIncreased event, Emitter<CounterState> emit){
    emit(state.copywith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount +1
      ));
  }

  void _onCounterReset( CounterReset event, Emitter<CounterState> emit){
    emit(state.copywith(
        counter: 0
      ));
  }
}
