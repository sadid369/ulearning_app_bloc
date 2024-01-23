// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}

class HomePageDots extends HomePageEvent {
  final int index;
  HomePageDots({
    required this.index,
  });
}
