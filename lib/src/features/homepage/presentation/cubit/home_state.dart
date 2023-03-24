part of 'home_cubit.dart';

class HomeState extends BaseState {
  final List<Item>? items;
  final bool? isLoading;
  final bool? isFetching;
  final int? page;
  final String? sortBy;
  final ScrollController? scrollController;

  @override
  List<Object?> get props =>
      [items, isLoading, page, scrollController, isFetching, sortBy];

  HomeState(
      {this.isLoading,
      this.items,
      this.page,
      this.sortBy,
      this.scrollController,
      this.isFetching});

  HomeState copyWith(
      {List<Item>? items,
      bool? isLoading,
      int? page,
      ScrollController? scrollController,
      String? sortBy,
      bool? isFetching}) {
    return HomeState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      scrollController: scrollController ?? this.scrollController,
      isFetching: isFetching ?? this.isFetching,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
