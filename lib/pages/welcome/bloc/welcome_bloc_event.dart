// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'welcome_bloc_bloc.dart';

@immutable
abstract class WelcomeBlocEvent {}

class WelcomeBlocChangeEvents extends WelcomeBlocEvent {
  final int changedIndex;
  WelcomeBlocChangeEvents({
    required this.changedIndex,
  });
}
