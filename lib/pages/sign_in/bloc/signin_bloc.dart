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
  FutureOr<void> _emailEvents(EmailEvents event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordEvents(
      PasswordEvents event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
