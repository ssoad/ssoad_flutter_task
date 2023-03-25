import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/model/repository_list_response_model.dart';
import '../../../../core/state_management/base_cubit.dart';
import '../../repository/home_repository.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeRepository _homeRepository;
  final SharedPreferences _sharedPreferences;

  HomeCubit(this._homeRepository, this._sharedPreferences) : super(HomeState());

  Future<void> onInit() async {
    emit(state.copyWith(
        isLoading: true,
        page: 1,
        sortBy: _sharedPreferences.getString('sortBy') ?? 'stars',
        scrollController: ScrollController(),
        isFetching: false));
    var result = await _homeRepository.fetchRepositories(state.page!);
    emit(state.copyWith(isLoading: false, items: result));
    //sortRepositories(state.sortBy!);
  }

  Future<void> fetchRepositories() async {
    // double currentScrollPosition = state.scrollController!.position.pixels;
    print("New Items are being fetched");
    emit(state.copyWith(isFetching: true));
    var result = await _homeRepository.fetchRepositories(state.page! + 1);
    state.items!.addAll(result);
    emit(state.copyWith(
        isFetching: false, items: state.items!, page: state.page! + 1));
    // sortRepositories(state.sortBy!);
  }

  void sortRepositories(String value) {
    emit(state.copyWith(isLoading: true));
    if (value == 'stars') {
      _sharedPreferences.setString('sortBy', 'stars');
      print('Sorting by stars');
      // items.sort((a, b) => b.stargazersCount!.compareTo(a.stargazersCount!));
    } else {
      _sharedPreferences.setString('sortBy', 'last_updated');
      print('Sorting by last updated');
      // items.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
    }
    onInit();
    // emit(state.copyWith(items: [], isLoading: false, sortBy: value));
    emit(state.copyWith(isLoading: false, sortBy: value));
    // state.items!.forEach((element) {
    //   print(element.name);
    // });
  }
}
