// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class TriggerAppEvents extends AppEvent {
  final int index;
  const TriggerAppEvents({
    required this.index,
  }) : super();
}
