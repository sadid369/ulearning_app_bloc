import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState()) {
    on<EmailEvents>(_emailEvents);
    on<PasswordEvents>(_passwordEvents);
  }

  FutureOr<void> _passwordEvents(
      PasswordEvents event, Emitter<SigninState> emit) {
    log('my password is ${event.password}');
    emit(state.copyWith(email: event.password));
  }

  FutureOr<void> _emailEvents(EmailEvents event, Emitter<SigninState> emit) {
    log('my email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }
}
