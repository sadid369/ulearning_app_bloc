import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_bloc_event.dart';
part 'welcome_bloc_state.dart';

class WelcomeBlocBloc extends Bloc<WelcomeBlocEvent, WelcomeBlocState> {
  WelcomeBlocBloc() : super(WelcomeBlocState(page: 0)) {
    on<WelcomeBlocChangeEvents>((event, emit) {
      emit(WelcomeBlocState(page: event.changedIndex));
    });
  }
}
