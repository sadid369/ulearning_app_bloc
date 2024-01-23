// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

class HomePageState {
  final int index;
  const HomePageState({
    required this.index,
  });

  HomePageState copyWith({
    int? index,
  }) {
    return HomePageState(
      index: index ?? this.index,
    );
  }
}
