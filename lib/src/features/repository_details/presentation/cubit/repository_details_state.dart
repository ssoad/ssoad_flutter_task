part of 'repository_details_cubit.dart';

class RepositoryDetailsState extends BaseState {
  final Item? item;
  final bool? isLoading;

  @override
  List<Object?> get props => [item, isLoading];

  RepositoryDetailsState({
    this.isLoading,
    this.item,
  });

  RepositoryDetailsState copyWith({
    Item? item,
    bool? isLoading,
  }) {
    return RepositoryDetailsState(
      item: item ?? this.item,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
