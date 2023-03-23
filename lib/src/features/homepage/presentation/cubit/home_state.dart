part of 'home_cubit.dart';

class HomeState extends BaseState {
  final List<Item>? items;
  final bool? isLoading;

  @override
  List<Object?> get props => [items, isLoading];

  HomeState({this.isLoading, this.items});

  HomeState copyWith({
    List<Item>? items,
    bool? isLoading,
  }) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
