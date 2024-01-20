import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState(index: 0)) {
    on<TriggerAppEvents>(_triggerAppEvents);
  }

  FutureOr<void> _triggerAppEvents(
      TriggerAppEvents event, Emitter<AppState> emit) {
    emit(AppState(index: event.index));
  }
}
